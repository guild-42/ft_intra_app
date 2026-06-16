import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

class IntraNotifications extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get signature => text().unique()();
  TextColumn get title => text()();
  TextColumn get body => text()();
  TextColumn get sourceDate => text().nullable()();
  DateTimeColumn get detectedAt => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get isRead => boolean().withDefault(const Constant(false))();
}

/// DEPRECATED (doc_v2/10): cookie scraping was removed for 42-ToS compliance.
/// The table is kept defined-but-unused so we don't have to run a destructive
/// migration / bump schemaVersion. No code reads or writes it.
class CookieStore extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get cookie => text()();
  DateTimeColumn get providedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get expiresAt => dateTime().nullable()();
  BoolColumn get isValid => boolean().withDefault(const Constant(true))();
}

class Friends extends Table {
  IntColumn get userId => integer()();
  TextColumn get login => text()();
  TextColumn get displayName => text().nullable()();
  TextColumn get imageUrl => text().nullable()();
  TextColumn get nickname => text().nullable()();
  RealColumn get level => real().nullable()();
  TextColumn get blackholedAt => text().nullable()();
  TextColumn get discordDmUrl => text().nullable()();
  DateTimeColumn get addedAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get lastSeenLocation => text().nullable()();
  DateTimeColumn get lastSeenAt => dateTime().nullable()();

  /// Whether to push-notify when this friend logs in / checks in on campus.
  /// Synced to the backend as part of the device's friend watch list.
  BoolColumn get notifyEnabled => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {userId};
}

class CachedUsers extends Table {
  IntColumn get userId => integer()();
  TextColumn get login => text()();
  TextColumn get displayName => text().nullable()();
  TextColumn get imageUrl => text().nullable()();
  DateTimeColumn get cachedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {userId};
}

@DriftDatabase(tables: [IntraNotifications, CookieStore, Friends, CachedUsers])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'ft_intra42'));

  @override
  int get schemaVersion => 6;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) => m.createAll(),
        onUpgrade: (m, from, to) async {
          // 冪等マイグレーション。createTable(friends) は「現行スキーマ(全列)」で作るため、
          // 単純な addColumn 列挙だと古い端末で "duplicate column" になる(drift の落とし穴)。
          // 実テーブル/列を見て、無いものだけ作る。
          final tables = (await m.database
                  .customSelect("SELECT name FROM sqlite_master WHERE type='table'")
                  .get())
              .map((r) => r.read<String>('name'))
              .toSet();

          if (!tables.contains(friends.actualTableName)) {
            await m.createTable(friends);
          } else {
            final cols = (await m.database
                    .customSelect('PRAGMA table_info(${friends.actualTableName})')
                    .get())
                .map((r) => r.read<String>('name'))
                .toSet();
            if (!cols.contains(friends.nickname.name)) {
              await m.addColumn(friends, friends.nickname);
            }
            if (!cols.contains(friends.level.name)) {
              await m.addColumn(friends, friends.level);
            }
            if (!cols.contains(friends.blackholedAt.name)) {
              await m.addColumn(friends, friends.blackholedAt);
            }
            if (!cols.contains(friends.discordDmUrl.name)) {
              await m.addColumn(friends, friends.discordDmUrl);
            }
            if (!cols.contains(friends.notifyEnabled.name)) {
              await m.addColumn(friends, friends.notifyEnabled);
            }
          }

          if (!tables.contains(cachedUsers.actualTableName)) {
            await m.createTable(cachedUsers);
          }
        },
      );

  // --- Notifications ---

  Future<List<IntraNotification>> getAllNotifications() {
    return (select(intraNotifications)
          ..orderBy([(t) => OrderingTerm.desc(t.detectedAt)]))
        .get();
  }

  Stream<List<IntraNotification>> watchAllNotifications() {
    return (select(intraNotifications)
          ..orderBy([(t) => OrderingTerm.desc(t.detectedAt)]))
        .watch();
  }

  Future<bool> insertNotification({
    required String signature,
    required String title,
    required String body,
    String? sourceDate,
  }) async {
    try {
      await into(intraNotifications).insert(
        IntraNotificationsCompanion.insert(
          signature: signature,
          title: title,
          body: body,
          sourceDate: Value(sourceDate),
        ),
      );
      return true;
    } catch (_) {
      return false; // duplicate signature
    }
  }

  Future<int> getNotificationCount() async {
    final count = countAll();
    final query = selectOnly(intraNotifications)..addColumns([count]);
    final row = await query.getSingle();
    return row.read(count) ?? 0;
  }

  // --- Friends ---

  Future<List<Friend>> getAllFriends() {
    return (select(friends)..orderBy([(t) => OrderingTerm.asc(t.login)])).get();
  }

  Stream<List<Friend>> watchAllFriends() {
    return (select(friends)..orderBy([(t) => OrderingTerm.asc(t.login)])).watch();
  }

  Future<void> addFriend({
    required int userId,
    required String login,
    String? displayName,
    String? imageUrl,
    double? level,
    String? blackholedAt,
  }) async {
    await into(friends).insertOnConflictUpdate(
      FriendsCompanion.insert(
        userId: Value(userId),
        login: login,
        displayName: Value(displayName),
        imageUrl: Value(imageUrl),
        level: Value(level),
        blackholedAt: Value(blackholedAt),
      ),
    );
  }

  Future<void> setDiscordDmUrl(int userId, String? url) async {
    await (update(friends)..where((t) => t.userId.equals(userId))).write(
      FriendsCompanion(discordDmUrl: Value(url)),
    );
  }

  Future<void> removeFriend(int userId) async {
    await (delete(friends)..where((t) => t.userId.equals(userId))).go();
  }

  Future<void> setNickname(int userId, String? nickname) async {
    await (update(friends)..where((t) => t.userId.equals(userId))).write(
      FriendsCompanion(nickname: Value(nickname)),
    );
  }

  /// Toggle per-friend login push notification.
  Future<void> setFriendNotify(int userId, bool enabled) async {
    await (update(friends)..where((t) => t.userId.equals(userId))).write(
      FriendsCompanion(notifyEnabled: Value(enabled)),
    );
  }

  /// User ids the device wants login push for — sent to backend as watch list.
  Future<List<int>> getFriendWatchIds() async {
    final rows = await (select(friends)
          ..where((t) => t.notifyEnabled.equals(true)))
        .get();
    return rows.map((f) => f.userId).toList();
  }

  /// Update friend's current location. When [location] is null (offline),
  /// `lastSeenAt` is preserved (so we always know when the friend was last seen).
  /// When [location] is non-null (active), both fields are updated to "now".
  Future<void> updateFriendLocation(int userId, String? location) async {
    await (update(friends)..where((t) => t.userId.equals(userId))).write(
      location != null
          ? FriendsCompanion(
              lastSeenLocation: Value(location),
              lastSeenAt: Value(DateTime.now()),
            )
          : const FriendsCompanion(
              lastSeenLocation: Value(null),
              // lastSeenAt: NOT touched
            ),
    );
  }

  /// Backfill `lastSeenAt` from a historical login timestamp (e.g. when a
  /// friend is first added and we fetch their last known login from the API).
  /// Only sets if currently null, to not overwrite live tracking data.
  Future<void> setFriendLastSeenIfMissing(int userId, DateTime lastSeen) async {
    await (update(friends)
          ..where((t) => t.userId.equals(userId) & t.lastSeenAt.isNull()))
        .write(FriendsCompanion(lastSeenAt: Value(lastSeen)));
  }

  Future<bool> isFriend(int userId) async {
    final row = await (select(friends)..where((t) => t.userId.equals(userId)))
        .getSingleOrNull();
    return row != null;
  }

  // --- Cached users ---

  Future<List<CachedUser>> getCachedUsers(List<int> userIds) {
    if (userIds.isEmpty) return Future.value([]);
    return (select(cachedUsers)..where((t) => t.userId.isIn(userIds))).get();
  }

  Stream<List<CachedUser>> watchCachedUsers(List<int> userIds) {
    if (userIds.isEmpty) return Stream.value([]);
    return (select(cachedUsers)..where((t) => t.userId.isIn(userIds))).watch();
  }

  Stream<List<CachedUser>> watchAllCachedUsers() {
    return select(cachedUsers).watch();
  }

  Future<void> upsertCachedUser({
    required int userId,
    required String login,
    String? displayName,
    String? imageUrl,
  }) async {
    await into(cachedUsers).insertOnConflictUpdate(
      CachedUsersCompanion.insert(
        userId: Value(userId),
        login: login,
        displayName: Value(displayName),
        imageUrl: Value(imageUrl),
      ),
    );
  }

  Future<void> upsertCachedUsers(List<CachedUsersCompanion> rows) async {
    await batch((b) {
      b.insertAllOnConflictUpdate(cachedUsers, rows);
    });
  }
}
