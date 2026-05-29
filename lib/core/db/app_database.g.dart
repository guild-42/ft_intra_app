// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $IntraNotificationsTable extends IntraNotifications
    with TableInfo<$IntraNotificationsTable, IntraNotification> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IntraNotificationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _signatureMeta =
      const VerificationMeta('signature');
  @override
  late final GeneratedColumn<String> signature = GeneratedColumn<String>(
      'signature', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
      'body', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sourceDateMeta =
      const VerificationMeta('sourceDate');
  @override
  late final GeneratedColumn<String> sourceDate = GeneratedColumn<String>(
      'source_date', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _detectedAtMeta =
      const VerificationMeta('detectedAt');
  @override
  late final GeneratedColumn<DateTime> detectedAt = GeneratedColumn<DateTime>(
      'detected_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _isReadMeta = const VerificationMeta('isRead');
  @override
  late final GeneratedColumn<bool> isRead = GeneratedColumn<bool>(
      'is_read', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_read" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, signature, title, body, sourceDate, detectedAt, isRead];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'intra_notifications';
  @override
  VerificationContext validateIntegrity(Insertable<IntraNotification> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('signature')) {
      context.handle(_signatureMeta,
          signature.isAcceptableOrUnknown(data['signature']!, _signatureMeta));
    } else if (isInserting) {
      context.missing(_signatureMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body']!, _bodyMeta));
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('source_date')) {
      context.handle(
          _sourceDateMeta,
          sourceDate.isAcceptableOrUnknown(
              data['source_date']!, _sourceDateMeta));
    }
    if (data.containsKey('detected_at')) {
      context.handle(
          _detectedAtMeta,
          detectedAt.isAcceptableOrUnknown(
              data['detected_at']!, _detectedAtMeta));
    }
    if (data.containsKey('is_read')) {
      context.handle(_isReadMeta,
          isRead.isAcceptableOrUnknown(data['is_read']!, _isReadMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  IntraNotification map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IntraNotification(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      signature: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}signature'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      body: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}body'])!,
      sourceDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_date']),
      detectedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}detected_at'])!,
      isRead: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_read'])!,
    );
  }

  @override
  $IntraNotificationsTable createAlias(String alias) {
    return $IntraNotificationsTable(attachedDatabase, alias);
  }
}

class IntraNotification extends DataClass
    implements Insertable<IntraNotification> {
  final int id;
  final String signature;
  final String title;
  final String body;
  final String? sourceDate;
  final DateTime detectedAt;
  final bool isRead;
  const IntraNotification(
      {required this.id,
      required this.signature,
      required this.title,
      required this.body,
      this.sourceDate,
      required this.detectedAt,
      required this.isRead});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['signature'] = Variable<String>(signature);
    map['title'] = Variable<String>(title);
    map['body'] = Variable<String>(body);
    if (!nullToAbsent || sourceDate != null) {
      map['source_date'] = Variable<String>(sourceDate);
    }
    map['detected_at'] = Variable<DateTime>(detectedAt);
    map['is_read'] = Variable<bool>(isRead);
    return map;
  }

  IntraNotificationsCompanion toCompanion(bool nullToAbsent) {
    return IntraNotificationsCompanion(
      id: Value(id),
      signature: Value(signature),
      title: Value(title),
      body: Value(body),
      sourceDate: sourceDate == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceDate),
      detectedAt: Value(detectedAt),
      isRead: Value(isRead),
    );
  }

  factory IntraNotification.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IntraNotification(
      id: serializer.fromJson<int>(json['id']),
      signature: serializer.fromJson<String>(json['signature']),
      title: serializer.fromJson<String>(json['title']),
      body: serializer.fromJson<String>(json['body']),
      sourceDate: serializer.fromJson<String?>(json['sourceDate']),
      detectedAt: serializer.fromJson<DateTime>(json['detectedAt']),
      isRead: serializer.fromJson<bool>(json['isRead']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'signature': serializer.toJson<String>(signature),
      'title': serializer.toJson<String>(title),
      'body': serializer.toJson<String>(body),
      'sourceDate': serializer.toJson<String?>(sourceDate),
      'detectedAt': serializer.toJson<DateTime>(detectedAt),
      'isRead': serializer.toJson<bool>(isRead),
    };
  }

  IntraNotification copyWith(
          {int? id,
          String? signature,
          String? title,
          String? body,
          Value<String?> sourceDate = const Value.absent(),
          DateTime? detectedAt,
          bool? isRead}) =>
      IntraNotification(
        id: id ?? this.id,
        signature: signature ?? this.signature,
        title: title ?? this.title,
        body: body ?? this.body,
        sourceDate: sourceDate.present ? sourceDate.value : this.sourceDate,
        detectedAt: detectedAt ?? this.detectedAt,
        isRead: isRead ?? this.isRead,
      );
  IntraNotification copyWithCompanion(IntraNotificationsCompanion data) {
    return IntraNotification(
      id: data.id.present ? data.id.value : this.id,
      signature: data.signature.present ? data.signature.value : this.signature,
      title: data.title.present ? data.title.value : this.title,
      body: data.body.present ? data.body.value : this.body,
      sourceDate:
          data.sourceDate.present ? data.sourceDate.value : this.sourceDate,
      detectedAt:
          data.detectedAt.present ? data.detectedAt.value : this.detectedAt,
      isRead: data.isRead.present ? data.isRead.value : this.isRead,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IntraNotification(')
          ..write('id: $id, ')
          ..write('signature: $signature, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('sourceDate: $sourceDate, ')
          ..write('detectedAt: $detectedAt, ')
          ..write('isRead: $isRead')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, signature, title, body, sourceDate, detectedAt, isRead);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IntraNotification &&
          other.id == this.id &&
          other.signature == this.signature &&
          other.title == this.title &&
          other.body == this.body &&
          other.sourceDate == this.sourceDate &&
          other.detectedAt == this.detectedAt &&
          other.isRead == this.isRead);
}

class IntraNotificationsCompanion extends UpdateCompanion<IntraNotification> {
  final Value<int> id;
  final Value<String> signature;
  final Value<String> title;
  final Value<String> body;
  final Value<String?> sourceDate;
  final Value<DateTime> detectedAt;
  final Value<bool> isRead;
  const IntraNotificationsCompanion({
    this.id = const Value.absent(),
    this.signature = const Value.absent(),
    this.title = const Value.absent(),
    this.body = const Value.absent(),
    this.sourceDate = const Value.absent(),
    this.detectedAt = const Value.absent(),
    this.isRead = const Value.absent(),
  });
  IntraNotificationsCompanion.insert({
    this.id = const Value.absent(),
    required String signature,
    required String title,
    required String body,
    this.sourceDate = const Value.absent(),
    this.detectedAt = const Value.absent(),
    this.isRead = const Value.absent(),
  })  : signature = Value(signature),
        title = Value(title),
        body = Value(body);
  static Insertable<IntraNotification> custom({
    Expression<int>? id,
    Expression<String>? signature,
    Expression<String>? title,
    Expression<String>? body,
    Expression<String>? sourceDate,
    Expression<DateTime>? detectedAt,
    Expression<bool>? isRead,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (signature != null) 'signature': signature,
      if (title != null) 'title': title,
      if (body != null) 'body': body,
      if (sourceDate != null) 'source_date': sourceDate,
      if (detectedAt != null) 'detected_at': detectedAt,
      if (isRead != null) 'is_read': isRead,
    });
  }

  IntraNotificationsCompanion copyWith(
      {Value<int>? id,
      Value<String>? signature,
      Value<String>? title,
      Value<String>? body,
      Value<String?>? sourceDate,
      Value<DateTime>? detectedAt,
      Value<bool>? isRead}) {
    return IntraNotificationsCompanion(
      id: id ?? this.id,
      signature: signature ?? this.signature,
      title: title ?? this.title,
      body: body ?? this.body,
      sourceDate: sourceDate ?? this.sourceDate,
      detectedAt: detectedAt ?? this.detectedAt,
      isRead: isRead ?? this.isRead,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (signature.present) {
      map['signature'] = Variable<String>(signature.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (sourceDate.present) {
      map['source_date'] = Variable<String>(sourceDate.value);
    }
    if (detectedAt.present) {
      map['detected_at'] = Variable<DateTime>(detectedAt.value);
    }
    if (isRead.present) {
      map['is_read'] = Variable<bool>(isRead.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IntraNotificationsCompanion(')
          ..write('id: $id, ')
          ..write('signature: $signature, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('sourceDate: $sourceDate, ')
          ..write('detectedAt: $detectedAt, ')
          ..write('isRead: $isRead')
          ..write(')'))
        .toString();
  }
}

class $CookieStoreTable extends CookieStore
    with TableInfo<$CookieStoreTable, CookieStoreData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CookieStoreTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _cookieMeta = const VerificationMeta('cookie');
  @override
  late final GeneratedColumn<String> cookie = GeneratedColumn<String>(
      'cookie', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _providedAtMeta =
      const VerificationMeta('providedAt');
  @override
  late final GeneratedColumn<DateTime> providedAt = GeneratedColumn<DateTime>(
      'provided_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _expiresAtMeta =
      const VerificationMeta('expiresAt');
  @override
  late final GeneratedColumn<DateTime> expiresAt = GeneratedColumn<DateTime>(
      'expires_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _isValidMeta =
      const VerificationMeta('isValid');
  @override
  late final GeneratedColumn<bool> isValid = GeneratedColumn<bool>(
      'is_valid', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_valid" IN (0, 1))'),
      defaultValue: const Constant(true));
  @override
  List<GeneratedColumn> get $columns =>
      [id, cookie, providedAt, expiresAt, isValid];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cookie_store';
  @override
  VerificationContext validateIntegrity(Insertable<CookieStoreData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('cookie')) {
      context.handle(_cookieMeta,
          cookie.isAcceptableOrUnknown(data['cookie']!, _cookieMeta));
    } else if (isInserting) {
      context.missing(_cookieMeta);
    }
    if (data.containsKey('provided_at')) {
      context.handle(
          _providedAtMeta,
          providedAt.isAcceptableOrUnknown(
              data['provided_at']!, _providedAtMeta));
    }
    if (data.containsKey('expires_at')) {
      context.handle(_expiresAtMeta,
          expiresAt.isAcceptableOrUnknown(data['expires_at']!, _expiresAtMeta));
    }
    if (data.containsKey('is_valid')) {
      context.handle(_isValidMeta,
          isValid.isAcceptableOrUnknown(data['is_valid']!, _isValidMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CookieStoreData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CookieStoreData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      cookie: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cookie'])!,
      providedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}provided_at'])!,
      expiresAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}expires_at']),
      isValid: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_valid'])!,
    );
  }

  @override
  $CookieStoreTable createAlias(String alias) {
    return $CookieStoreTable(attachedDatabase, alias);
  }
}

class CookieStoreData extends DataClass implements Insertable<CookieStoreData> {
  final int id;
  final String cookie;
  final DateTime providedAt;
  final DateTime? expiresAt;
  final bool isValid;
  const CookieStoreData(
      {required this.id,
      required this.cookie,
      required this.providedAt,
      this.expiresAt,
      required this.isValid});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['cookie'] = Variable<String>(cookie);
    map['provided_at'] = Variable<DateTime>(providedAt);
    if (!nullToAbsent || expiresAt != null) {
      map['expires_at'] = Variable<DateTime>(expiresAt);
    }
    map['is_valid'] = Variable<bool>(isValid);
    return map;
  }

  CookieStoreCompanion toCompanion(bool nullToAbsent) {
    return CookieStoreCompanion(
      id: Value(id),
      cookie: Value(cookie),
      providedAt: Value(providedAt),
      expiresAt: expiresAt == null && nullToAbsent
          ? const Value.absent()
          : Value(expiresAt),
      isValid: Value(isValid),
    );
  }

  factory CookieStoreData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CookieStoreData(
      id: serializer.fromJson<int>(json['id']),
      cookie: serializer.fromJson<String>(json['cookie']),
      providedAt: serializer.fromJson<DateTime>(json['providedAt']),
      expiresAt: serializer.fromJson<DateTime?>(json['expiresAt']),
      isValid: serializer.fromJson<bool>(json['isValid']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'cookie': serializer.toJson<String>(cookie),
      'providedAt': serializer.toJson<DateTime>(providedAt),
      'expiresAt': serializer.toJson<DateTime?>(expiresAt),
      'isValid': serializer.toJson<bool>(isValid),
    };
  }

  CookieStoreData copyWith(
          {int? id,
          String? cookie,
          DateTime? providedAt,
          Value<DateTime?> expiresAt = const Value.absent(),
          bool? isValid}) =>
      CookieStoreData(
        id: id ?? this.id,
        cookie: cookie ?? this.cookie,
        providedAt: providedAt ?? this.providedAt,
        expiresAt: expiresAt.present ? expiresAt.value : this.expiresAt,
        isValid: isValid ?? this.isValid,
      );
  CookieStoreData copyWithCompanion(CookieStoreCompanion data) {
    return CookieStoreData(
      id: data.id.present ? data.id.value : this.id,
      cookie: data.cookie.present ? data.cookie.value : this.cookie,
      providedAt:
          data.providedAt.present ? data.providedAt.value : this.providedAt,
      expiresAt: data.expiresAt.present ? data.expiresAt.value : this.expiresAt,
      isValid: data.isValid.present ? data.isValid.value : this.isValid,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CookieStoreData(')
          ..write('id: $id, ')
          ..write('cookie: $cookie, ')
          ..write('providedAt: $providedAt, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('isValid: $isValid')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, cookie, providedAt, expiresAt, isValid);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CookieStoreData &&
          other.id == this.id &&
          other.cookie == this.cookie &&
          other.providedAt == this.providedAt &&
          other.expiresAt == this.expiresAt &&
          other.isValid == this.isValid);
}

class CookieStoreCompanion extends UpdateCompanion<CookieStoreData> {
  final Value<int> id;
  final Value<String> cookie;
  final Value<DateTime> providedAt;
  final Value<DateTime?> expiresAt;
  final Value<bool> isValid;
  const CookieStoreCompanion({
    this.id = const Value.absent(),
    this.cookie = const Value.absent(),
    this.providedAt = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.isValid = const Value.absent(),
  });
  CookieStoreCompanion.insert({
    this.id = const Value.absent(),
    required String cookie,
    this.providedAt = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.isValid = const Value.absent(),
  }) : cookie = Value(cookie);
  static Insertable<CookieStoreData> custom({
    Expression<int>? id,
    Expression<String>? cookie,
    Expression<DateTime>? providedAt,
    Expression<DateTime>? expiresAt,
    Expression<bool>? isValid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cookie != null) 'cookie': cookie,
      if (providedAt != null) 'provided_at': providedAt,
      if (expiresAt != null) 'expires_at': expiresAt,
      if (isValid != null) 'is_valid': isValid,
    });
  }

  CookieStoreCompanion copyWith(
      {Value<int>? id,
      Value<String>? cookie,
      Value<DateTime>? providedAt,
      Value<DateTime?>? expiresAt,
      Value<bool>? isValid}) {
    return CookieStoreCompanion(
      id: id ?? this.id,
      cookie: cookie ?? this.cookie,
      providedAt: providedAt ?? this.providedAt,
      expiresAt: expiresAt ?? this.expiresAt,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (cookie.present) {
      map['cookie'] = Variable<String>(cookie.value);
    }
    if (providedAt.present) {
      map['provided_at'] = Variable<DateTime>(providedAt.value);
    }
    if (expiresAt.present) {
      map['expires_at'] = Variable<DateTime>(expiresAt.value);
    }
    if (isValid.present) {
      map['is_valid'] = Variable<bool>(isValid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CookieStoreCompanion(')
          ..write('id: $id, ')
          ..write('cookie: $cookie, ')
          ..write('providedAt: $providedAt, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('isValid: $isValid')
          ..write(')'))
        .toString();
  }
}

class $FriendsTable extends Friends with TableInfo<$FriendsTable, Friend> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FriendsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _loginMeta = const VerificationMeta('login');
  @override
  late final GeneratedColumn<String> login = GeneratedColumn<String>(
      'login', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _displayNameMeta =
      const VerificationMeta('displayName');
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
      'display_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nicknameMeta =
      const VerificationMeta('nickname');
  @override
  late final GeneratedColumn<String> nickname = GeneratedColumn<String>(
      'nickname', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<double> level = GeneratedColumn<double>(
      'level', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _blackholedAtMeta =
      const VerificationMeta('blackholedAt');
  @override
  late final GeneratedColumn<String> blackholedAt = GeneratedColumn<String>(
      'blackholed_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _discordDmUrlMeta =
      const VerificationMeta('discordDmUrl');
  @override
  late final GeneratedColumn<String> discordDmUrl = GeneratedColumn<String>(
      'discord_dm_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _addedAtMeta =
      const VerificationMeta('addedAt');
  @override
  late final GeneratedColumn<DateTime> addedAt = GeneratedColumn<DateTime>(
      'added_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _lastSeenLocationMeta =
      const VerificationMeta('lastSeenLocation');
  @override
  late final GeneratedColumn<String> lastSeenLocation = GeneratedColumn<String>(
      'last_seen_location', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _lastSeenAtMeta =
      const VerificationMeta('lastSeenAt');
  @override
  late final GeneratedColumn<DateTime> lastSeenAt = GeneratedColumn<DateTime>(
      'last_seen_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _notifyEnabledMeta =
      const VerificationMeta('notifyEnabled');
  @override
  late final GeneratedColumn<bool> notifyEnabled = GeneratedColumn<bool>(
      'notify_enabled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("notify_enabled" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        userId,
        login,
        displayName,
        imageUrl,
        nickname,
        level,
        blackholedAt,
        discordDmUrl,
        addedAt,
        lastSeenLocation,
        lastSeenAt,
        notifyEnabled
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'friends';
  @override
  VerificationContext validateIntegrity(Insertable<Friend> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    }
    if (data.containsKey('login')) {
      context.handle(
          _loginMeta, login.isAcceptableOrUnknown(data['login']!, _loginMeta));
    } else if (isInserting) {
      context.missing(_loginMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
          _displayNameMeta,
          displayName.isAcceptableOrUnknown(
              data['display_name']!, _displayNameMeta));
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    }
    if (data.containsKey('nickname')) {
      context.handle(_nicknameMeta,
          nickname.isAcceptableOrUnknown(data['nickname']!, _nicknameMeta));
    }
    if (data.containsKey('level')) {
      context.handle(
          _levelMeta, level.isAcceptableOrUnknown(data['level']!, _levelMeta));
    }
    if (data.containsKey('blackholed_at')) {
      context.handle(
          _blackholedAtMeta,
          blackholedAt.isAcceptableOrUnknown(
              data['blackholed_at']!, _blackholedAtMeta));
    }
    if (data.containsKey('discord_dm_url')) {
      context.handle(
          _discordDmUrlMeta,
          discordDmUrl.isAcceptableOrUnknown(
              data['discord_dm_url']!, _discordDmUrlMeta));
    }
    if (data.containsKey('added_at')) {
      context.handle(_addedAtMeta,
          addedAt.isAcceptableOrUnknown(data['added_at']!, _addedAtMeta));
    }
    if (data.containsKey('last_seen_location')) {
      context.handle(
          _lastSeenLocationMeta,
          lastSeenLocation.isAcceptableOrUnknown(
              data['last_seen_location']!, _lastSeenLocationMeta));
    }
    if (data.containsKey('last_seen_at')) {
      context.handle(
          _lastSeenAtMeta,
          lastSeenAt.isAcceptableOrUnknown(
              data['last_seen_at']!, _lastSeenAtMeta));
    }
    if (data.containsKey('notify_enabled')) {
      context.handle(
          _notifyEnabledMeta,
          notifyEnabled.isAcceptableOrUnknown(
              data['notify_enabled']!, _notifyEnabledMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId};
  @override
  Friend map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Friend(
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      login: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}login'])!,
      displayName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}display_name']),
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url']),
      nickname: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nickname']),
      level: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}level']),
      blackholedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}blackholed_at']),
      discordDmUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}discord_dm_url']),
      addedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}added_at'])!,
      lastSeenLocation: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}last_seen_location']),
      lastSeenAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_seen_at']),
      notifyEnabled: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}notify_enabled'])!,
    );
  }

  @override
  $FriendsTable createAlias(String alias) {
    return $FriendsTable(attachedDatabase, alias);
  }
}

class Friend extends DataClass implements Insertable<Friend> {
  final int userId;
  final String login;
  final String? displayName;
  final String? imageUrl;
  final String? nickname;
  final double? level;
  final String? blackholedAt;
  final String? discordDmUrl;
  final DateTime addedAt;
  final String? lastSeenLocation;
  final DateTime? lastSeenAt;

  /// Whether to push-notify when this friend logs in / checks in on campus.
  /// Synced to the backend as part of the device's friend watch list.
  final bool notifyEnabled;
  const Friend(
      {required this.userId,
      required this.login,
      this.displayName,
      this.imageUrl,
      this.nickname,
      this.level,
      this.blackholedAt,
      this.discordDmUrl,
      required this.addedAt,
      this.lastSeenLocation,
      this.lastSeenAt,
      required this.notifyEnabled});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<int>(userId);
    map['login'] = Variable<String>(login);
    if (!nullToAbsent || displayName != null) {
      map['display_name'] = Variable<String>(displayName);
    }
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    if (!nullToAbsent || nickname != null) {
      map['nickname'] = Variable<String>(nickname);
    }
    if (!nullToAbsent || level != null) {
      map['level'] = Variable<double>(level);
    }
    if (!nullToAbsent || blackholedAt != null) {
      map['blackholed_at'] = Variable<String>(blackholedAt);
    }
    if (!nullToAbsent || discordDmUrl != null) {
      map['discord_dm_url'] = Variable<String>(discordDmUrl);
    }
    map['added_at'] = Variable<DateTime>(addedAt);
    if (!nullToAbsent || lastSeenLocation != null) {
      map['last_seen_location'] = Variable<String>(lastSeenLocation);
    }
    if (!nullToAbsent || lastSeenAt != null) {
      map['last_seen_at'] = Variable<DateTime>(lastSeenAt);
    }
    map['notify_enabled'] = Variable<bool>(notifyEnabled);
    return map;
  }

  FriendsCompanion toCompanion(bool nullToAbsent) {
    return FriendsCompanion(
      userId: Value(userId),
      login: Value(login),
      displayName: displayName == null && nullToAbsent
          ? const Value.absent()
          : Value(displayName),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      nickname: nickname == null && nullToAbsent
          ? const Value.absent()
          : Value(nickname),
      level:
          level == null && nullToAbsent ? const Value.absent() : Value(level),
      blackholedAt: blackholedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(blackholedAt),
      discordDmUrl: discordDmUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(discordDmUrl),
      addedAt: Value(addedAt),
      lastSeenLocation: lastSeenLocation == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSeenLocation),
      lastSeenAt: lastSeenAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSeenAt),
      notifyEnabled: Value(notifyEnabled),
    );
  }

  factory Friend.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Friend(
      userId: serializer.fromJson<int>(json['userId']),
      login: serializer.fromJson<String>(json['login']),
      displayName: serializer.fromJson<String?>(json['displayName']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      nickname: serializer.fromJson<String?>(json['nickname']),
      level: serializer.fromJson<double?>(json['level']),
      blackholedAt: serializer.fromJson<String?>(json['blackholedAt']),
      discordDmUrl: serializer.fromJson<String?>(json['discordDmUrl']),
      addedAt: serializer.fromJson<DateTime>(json['addedAt']),
      lastSeenLocation: serializer.fromJson<String?>(json['lastSeenLocation']),
      lastSeenAt: serializer.fromJson<DateTime?>(json['lastSeenAt']),
      notifyEnabled: serializer.fromJson<bool>(json['notifyEnabled']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<int>(userId),
      'login': serializer.toJson<String>(login),
      'displayName': serializer.toJson<String?>(displayName),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'nickname': serializer.toJson<String?>(nickname),
      'level': serializer.toJson<double?>(level),
      'blackholedAt': serializer.toJson<String?>(blackholedAt),
      'discordDmUrl': serializer.toJson<String?>(discordDmUrl),
      'addedAt': serializer.toJson<DateTime>(addedAt),
      'lastSeenLocation': serializer.toJson<String?>(lastSeenLocation),
      'lastSeenAt': serializer.toJson<DateTime?>(lastSeenAt),
      'notifyEnabled': serializer.toJson<bool>(notifyEnabled),
    };
  }

  Friend copyWith(
          {int? userId,
          String? login,
          Value<String?> displayName = const Value.absent(),
          Value<String?> imageUrl = const Value.absent(),
          Value<String?> nickname = const Value.absent(),
          Value<double?> level = const Value.absent(),
          Value<String?> blackholedAt = const Value.absent(),
          Value<String?> discordDmUrl = const Value.absent(),
          DateTime? addedAt,
          Value<String?> lastSeenLocation = const Value.absent(),
          Value<DateTime?> lastSeenAt = const Value.absent(),
          bool? notifyEnabled}) =>
      Friend(
        userId: userId ?? this.userId,
        login: login ?? this.login,
        displayName: displayName.present ? displayName.value : this.displayName,
        imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
        nickname: nickname.present ? nickname.value : this.nickname,
        level: level.present ? level.value : this.level,
        blackholedAt:
            blackholedAt.present ? blackholedAt.value : this.blackholedAt,
        discordDmUrl:
            discordDmUrl.present ? discordDmUrl.value : this.discordDmUrl,
        addedAt: addedAt ?? this.addedAt,
        lastSeenLocation: lastSeenLocation.present
            ? lastSeenLocation.value
            : this.lastSeenLocation,
        lastSeenAt: lastSeenAt.present ? lastSeenAt.value : this.lastSeenAt,
        notifyEnabled: notifyEnabled ?? this.notifyEnabled,
      );
  Friend copyWithCompanion(FriendsCompanion data) {
    return Friend(
      userId: data.userId.present ? data.userId.value : this.userId,
      login: data.login.present ? data.login.value : this.login,
      displayName:
          data.displayName.present ? data.displayName.value : this.displayName,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      nickname: data.nickname.present ? data.nickname.value : this.nickname,
      level: data.level.present ? data.level.value : this.level,
      blackholedAt: data.blackholedAt.present
          ? data.blackholedAt.value
          : this.blackholedAt,
      discordDmUrl: data.discordDmUrl.present
          ? data.discordDmUrl.value
          : this.discordDmUrl,
      addedAt: data.addedAt.present ? data.addedAt.value : this.addedAt,
      lastSeenLocation: data.lastSeenLocation.present
          ? data.lastSeenLocation.value
          : this.lastSeenLocation,
      lastSeenAt:
          data.lastSeenAt.present ? data.lastSeenAt.value : this.lastSeenAt,
      notifyEnabled: data.notifyEnabled.present
          ? data.notifyEnabled.value
          : this.notifyEnabled,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Friend(')
          ..write('userId: $userId, ')
          ..write('login: $login, ')
          ..write('displayName: $displayName, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('nickname: $nickname, ')
          ..write('level: $level, ')
          ..write('blackholedAt: $blackholedAt, ')
          ..write('discordDmUrl: $discordDmUrl, ')
          ..write('addedAt: $addedAt, ')
          ..write('lastSeenLocation: $lastSeenLocation, ')
          ..write('lastSeenAt: $lastSeenAt, ')
          ..write('notifyEnabled: $notifyEnabled')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      userId,
      login,
      displayName,
      imageUrl,
      nickname,
      level,
      blackholedAt,
      discordDmUrl,
      addedAt,
      lastSeenLocation,
      lastSeenAt,
      notifyEnabled);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Friend &&
          other.userId == this.userId &&
          other.login == this.login &&
          other.displayName == this.displayName &&
          other.imageUrl == this.imageUrl &&
          other.nickname == this.nickname &&
          other.level == this.level &&
          other.blackholedAt == this.blackholedAt &&
          other.discordDmUrl == this.discordDmUrl &&
          other.addedAt == this.addedAt &&
          other.lastSeenLocation == this.lastSeenLocation &&
          other.lastSeenAt == this.lastSeenAt &&
          other.notifyEnabled == this.notifyEnabled);
}

class FriendsCompanion extends UpdateCompanion<Friend> {
  final Value<int> userId;
  final Value<String> login;
  final Value<String?> displayName;
  final Value<String?> imageUrl;
  final Value<String?> nickname;
  final Value<double?> level;
  final Value<String?> blackholedAt;
  final Value<String?> discordDmUrl;
  final Value<DateTime> addedAt;
  final Value<String?> lastSeenLocation;
  final Value<DateTime?> lastSeenAt;
  final Value<bool> notifyEnabled;
  const FriendsCompanion({
    this.userId = const Value.absent(),
    this.login = const Value.absent(),
    this.displayName = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.nickname = const Value.absent(),
    this.level = const Value.absent(),
    this.blackholedAt = const Value.absent(),
    this.discordDmUrl = const Value.absent(),
    this.addedAt = const Value.absent(),
    this.lastSeenLocation = const Value.absent(),
    this.lastSeenAt = const Value.absent(),
    this.notifyEnabled = const Value.absent(),
  });
  FriendsCompanion.insert({
    this.userId = const Value.absent(),
    required String login,
    this.displayName = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.nickname = const Value.absent(),
    this.level = const Value.absent(),
    this.blackholedAt = const Value.absent(),
    this.discordDmUrl = const Value.absent(),
    this.addedAt = const Value.absent(),
    this.lastSeenLocation = const Value.absent(),
    this.lastSeenAt = const Value.absent(),
    this.notifyEnabled = const Value.absent(),
  }) : login = Value(login);
  static Insertable<Friend> custom({
    Expression<int>? userId,
    Expression<String>? login,
    Expression<String>? displayName,
    Expression<String>? imageUrl,
    Expression<String>? nickname,
    Expression<double>? level,
    Expression<String>? blackholedAt,
    Expression<String>? discordDmUrl,
    Expression<DateTime>? addedAt,
    Expression<String>? lastSeenLocation,
    Expression<DateTime>? lastSeenAt,
    Expression<bool>? notifyEnabled,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (login != null) 'login': login,
      if (displayName != null) 'display_name': displayName,
      if (imageUrl != null) 'image_url': imageUrl,
      if (nickname != null) 'nickname': nickname,
      if (level != null) 'level': level,
      if (blackholedAt != null) 'blackholed_at': blackholedAt,
      if (discordDmUrl != null) 'discord_dm_url': discordDmUrl,
      if (addedAt != null) 'added_at': addedAt,
      if (lastSeenLocation != null) 'last_seen_location': lastSeenLocation,
      if (lastSeenAt != null) 'last_seen_at': lastSeenAt,
      if (notifyEnabled != null) 'notify_enabled': notifyEnabled,
    });
  }

  FriendsCompanion copyWith(
      {Value<int>? userId,
      Value<String>? login,
      Value<String?>? displayName,
      Value<String?>? imageUrl,
      Value<String?>? nickname,
      Value<double?>? level,
      Value<String?>? blackholedAt,
      Value<String?>? discordDmUrl,
      Value<DateTime>? addedAt,
      Value<String?>? lastSeenLocation,
      Value<DateTime?>? lastSeenAt,
      Value<bool>? notifyEnabled}) {
    return FriendsCompanion(
      userId: userId ?? this.userId,
      login: login ?? this.login,
      displayName: displayName ?? this.displayName,
      imageUrl: imageUrl ?? this.imageUrl,
      nickname: nickname ?? this.nickname,
      level: level ?? this.level,
      blackholedAt: blackholedAt ?? this.blackholedAt,
      discordDmUrl: discordDmUrl ?? this.discordDmUrl,
      addedAt: addedAt ?? this.addedAt,
      lastSeenLocation: lastSeenLocation ?? this.lastSeenLocation,
      lastSeenAt: lastSeenAt ?? this.lastSeenAt,
      notifyEnabled: notifyEnabled ?? this.notifyEnabled,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (login.present) {
      map['login'] = Variable<String>(login.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (nickname.present) {
      map['nickname'] = Variable<String>(nickname.value);
    }
    if (level.present) {
      map['level'] = Variable<double>(level.value);
    }
    if (blackholedAt.present) {
      map['blackholed_at'] = Variable<String>(blackholedAt.value);
    }
    if (discordDmUrl.present) {
      map['discord_dm_url'] = Variable<String>(discordDmUrl.value);
    }
    if (addedAt.present) {
      map['added_at'] = Variable<DateTime>(addedAt.value);
    }
    if (lastSeenLocation.present) {
      map['last_seen_location'] = Variable<String>(lastSeenLocation.value);
    }
    if (lastSeenAt.present) {
      map['last_seen_at'] = Variable<DateTime>(lastSeenAt.value);
    }
    if (notifyEnabled.present) {
      map['notify_enabled'] = Variable<bool>(notifyEnabled.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FriendsCompanion(')
          ..write('userId: $userId, ')
          ..write('login: $login, ')
          ..write('displayName: $displayName, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('nickname: $nickname, ')
          ..write('level: $level, ')
          ..write('blackholedAt: $blackholedAt, ')
          ..write('discordDmUrl: $discordDmUrl, ')
          ..write('addedAt: $addedAt, ')
          ..write('lastSeenLocation: $lastSeenLocation, ')
          ..write('lastSeenAt: $lastSeenAt, ')
          ..write('notifyEnabled: $notifyEnabled')
          ..write(')'))
        .toString();
  }
}

class $CachedUsersTable extends CachedUsers
    with TableInfo<$CachedUsersTable, CachedUser> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedUsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _loginMeta = const VerificationMeta('login');
  @override
  late final GeneratedColumn<String> login = GeneratedColumn<String>(
      'login', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _displayNameMeta =
      const VerificationMeta('displayName');
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
      'display_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _cachedAtMeta =
      const VerificationMeta('cachedAt');
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
      'cached_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [userId, login, displayName, imageUrl, cachedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_users';
  @override
  VerificationContext validateIntegrity(Insertable<CachedUser> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    }
    if (data.containsKey('login')) {
      context.handle(
          _loginMeta, login.isAcceptableOrUnknown(data['login']!, _loginMeta));
    } else if (isInserting) {
      context.missing(_loginMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
          _displayNameMeta,
          displayName.isAcceptableOrUnknown(
              data['display_name']!, _displayNameMeta));
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    }
    if (data.containsKey('cached_at')) {
      context.handle(_cachedAtMeta,
          cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId};
  @override
  CachedUser map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedUser(
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      login: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}login'])!,
      displayName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}display_name']),
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url']),
      cachedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}cached_at'])!,
    );
  }

  @override
  $CachedUsersTable createAlias(String alias) {
    return $CachedUsersTable(attachedDatabase, alias);
  }
}

class CachedUser extends DataClass implements Insertable<CachedUser> {
  final int userId;
  final String login;
  final String? displayName;
  final String? imageUrl;
  final DateTime cachedAt;
  const CachedUser(
      {required this.userId,
      required this.login,
      this.displayName,
      this.imageUrl,
      required this.cachedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<int>(userId);
    map['login'] = Variable<String>(login);
    if (!nullToAbsent || displayName != null) {
      map['display_name'] = Variable<String>(displayName);
    }
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  CachedUsersCompanion toCompanion(bool nullToAbsent) {
    return CachedUsersCompanion(
      userId: Value(userId),
      login: Value(login),
      displayName: displayName == null && nullToAbsent
          ? const Value.absent()
          : Value(displayName),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      cachedAt: Value(cachedAt),
    );
  }

  factory CachedUser.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedUser(
      userId: serializer.fromJson<int>(json['userId']),
      login: serializer.fromJson<String>(json['login']),
      displayName: serializer.fromJson<String?>(json['displayName']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<int>(userId),
      'login': serializer.toJson<String>(login),
      'displayName': serializer.toJson<String?>(displayName),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  CachedUser copyWith(
          {int? userId,
          String? login,
          Value<String?> displayName = const Value.absent(),
          Value<String?> imageUrl = const Value.absent(),
          DateTime? cachedAt}) =>
      CachedUser(
        userId: userId ?? this.userId,
        login: login ?? this.login,
        displayName: displayName.present ? displayName.value : this.displayName,
        imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
        cachedAt: cachedAt ?? this.cachedAt,
      );
  CachedUser copyWithCompanion(CachedUsersCompanion data) {
    return CachedUser(
      userId: data.userId.present ? data.userId.value : this.userId,
      login: data.login.present ? data.login.value : this.login,
      displayName:
          data.displayName.present ? data.displayName.value : this.displayName,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedUser(')
          ..write('userId: $userId, ')
          ..write('login: $login, ')
          ..write('displayName: $displayName, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(userId, login, displayName, imageUrl, cachedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedUser &&
          other.userId == this.userId &&
          other.login == this.login &&
          other.displayName == this.displayName &&
          other.imageUrl == this.imageUrl &&
          other.cachedAt == this.cachedAt);
}

class CachedUsersCompanion extends UpdateCompanion<CachedUser> {
  final Value<int> userId;
  final Value<String> login;
  final Value<String?> displayName;
  final Value<String?> imageUrl;
  final Value<DateTime> cachedAt;
  const CachedUsersCompanion({
    this.userId = const Value.absent(),
    this.login = const Value.absent(),
    this.displayName = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.cachedAt = const Value.absent(),
  });
  CachedUsersCompanion.insert({
    this.userId = const Value.absent(),
    required String login,
    this.displayName = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.cachedAt = const Value.absent(),
  }) : login = Value(login);
  static Insertable<CachedUser> custom({
    Expression<int>? userId,
    Expression<String>? login,
    Expression<String>? displayName,
    Expression<String>? imageUrl,
    Expression<DateTime>? cachedAt,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (login != null) 'login': login,
      if (displayName != null) 'display_name': displayName,
      if (imageUrl != null) 'image_url': imageUrl,
      if (cachedAt != null) 'cached_at': cachedAt,
    });
  }

  CachedUsersCompanion copyWith(
      {Value<int>? userId,
      Value<String>? login,
      Value<String?>? displayName,
      Value<String?>? imageUrl,
      Value<DateTime>? cachedAt}) {
    return CachedUsersCompanion(
      userId: userId ?? this.userId,
      login: login ?? this.login,
      displayName: displayName ?? this.displayName,
      imageUrl: imageUrl ?? this.imageUrl,
      cachedAt: cachedAt ?? this.cachedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (login.present) {
      map['login'] = Variable<String>(login.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedUsersCompanion(')
          ..write('userId: $userId, ')
          ..write('login: $login, ')
          ..write('displayName: $displayName, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $IntraNotificationsTable intraNotifications =
      $IntraNotificationsTable(this);
  late final $CookieStoreTable cookieStore = $CookieStoreTable(this);
  late final $FriendsTable friends = $FriendsTable(this);
  late final $CachedUsersTable cachedUsers = $CachedUsersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [intraNotifications, cookieStore, friends, cachedUsers];
}

typedef $$IntraNotificationsTableCreateCompanionBuilder
    = IntraNotificationsCompanion Function({
  Value<int> id,
  required String signature,
  required String title,
  required String body,
  Value<String?> sourceDate,
  Value<DateTime> detectedAt,
  Value<bool> isRead,
});
typedef $$IntraNotificationsTableUpdateCompanionBuilder
    = IntraNotificationsCompanion Function({
  Value<int> id,
  Value<String> signature,
  Value<String> title,
  Value<String> body,
  Value<String?> sourceDate,
  Value<DateTime> detectedAt,
  Value<bool> isRead,
});

class $$IntraNotificationsTableFilterComposer
    extends Composer<_$AppDatabase, $IntraNotificationsTable> {
  $$IntraNotificationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get signature => $composableBuilder(
      column: $table.signature, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get body => $composableBuilder(
      column: $table.body, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sourceDate => $composableBuilder(
      column: $table.sourceDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get detectedAt => $composableBuilder(
      column: $table.detectedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isRead => $composableBuilder(
      column: $table.isRead, builder: (column) => ColumnFilters(column));
}

class $$IntraNotificationsTableOrderingComposer
    extends Composer<_$AppDatabase, $IntraNotificationsTable> {
  $$IntraNotificationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get signature => $composableBuilder(
      column: $table.signature, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get body => $composableBuilder(
      column: $table.body, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sourceDate => $composableBuilder(
      column: $table.sourceDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get detectedAt => $composableBuilder(
      column: $table.detectedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isRead => $composableBuilder(
      column: $table.isRead, builder: (column) => ColumnOrderings(column));
}

class $$IntraNotificationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $IntraNotificationsTable> {
  $$IntraNotificationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get signature =>
      $composableBuilder(column: $table.signature, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<String> get sourceDate => $composableBuilder(
      column: $table.sourceDate, builder: (column) => column);

  GeneratedColumn<DateTime> get detectedAt => $composableBuilder(
      column: $table.detectedAt, builder: (column) => column);

  GeneratedColumn<bool> get isRead =>
      $composableBuilder(column: $table.isRead, builder: (column) => column);
}

class $$IntraNotificationsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $IntraNotificationsTable,
    IntraNotification,
    $$IntraNotificationsTableFilterComposer,
    $$IntraNotificationsTableOrderingComposer,
    $$IntraNotificationsTableAnnotationComposer,
    $$IntraNotificationsTableCreateCompanionBuilder,
    $$IntraNotificationsTableUpdateCompanionBuilder,
    (
      IntraNotification,
      BaseReferences<_$AppDatabase, $IntraNotificationsTable, IntraNotification>
    ),
    IntraNotification,
    PrefetchHooks Function()> {
  $$IntraNotificationsTableTableManager(
      _$AppDatabase db, $IntraNotificationsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IntraNotificationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IntraNotificationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IntraNotificationsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> signature = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> body = const Value.absent(),
            Value<String?> sourceDate = const Value.absent(),
            Value<DateTime> detectedAt = const Value.absent(),
            Value<bool> isRead = const Value.absent(),
          }) =>
              IntraNotificationsCompanion(
            id: id,
            signature: signature,
            title: title,
            body: body,
            sourceDate: sourceDate,
            detectedAt: detectedAt,
            isRead: isRead,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String signature,
            required String title,
            required String body,
            Value<String?> sourceDate = const Value.absent(),
            Value<DateTime> detectedAt = const Value.absent(),
            Value<bool> isRead = const Value.absent(),
          }) =>
              IntraNotificationsCompanion.insert(
            id: id,
            signature: signature,
            title: title,
            body: body,
            sourceDate: sourceDate,
            detectedAt: detectedAt,
            isRead: isRead,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$IntraNotificationsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $IntraNotificationsTable,
    IntraNotification,
    $$IntraNotificationsTableFilterComposer,
    $$IntraNotificationsTableOrderingComposer,
    $$IntraNotificationsTableAnnotationComposer,
    $$IntraNotificationsTableCreateCompanionBuilder,
    $$IntraNotificationsTableUpdateCompanionBuilder,
    (
      IntraNotification,
      BaseReferences<_$AppDatabase, $IntraNotificationsTable, IntraNotification>
    ),
    IntraNotification,
    PrefetchHooks Function()>;
typedef $$CookieStoreTableCreateCompanionBuilder = CookieStoreCompanion
    Function({
  Value<int> id,
  required String cookie,
  Value<DateTime> providedAt,
  Value<DateTime?> expiresAt,
  Value<bool> isValid,
});
typedef $$CookieStoreTableUpdateCompanionBuilder = CookieStoreCompanion
    Function({
  Value<int> id,
  Value<String> cookie,
  Value<DateTime> providedAt,
  Value<DateTime?> expiresAt,
  Value<bool> isValid,
});

class $$CookieStoreTableFilterComposer
    extends Composer<_$AppDatabase, $CookieStoreTable> {
  $$CookieStoreTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cookie => $composableBuilder(
      column: $table.cookie, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get providedAt => $composableBuilder(
      column: $table.providedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get expiresAt => $composableBuilder(
      column: $table.expiresAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isValid => $composableBuilder(
      column: $table.isValid, builder: (column) => ColumnFilters(column));
}

class $$CookieStoreTableOrderingComposer
    extends Composer<_$AppDatabase, $CookieStoreTable> {
  $$CookieStoreTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cookie => $composableBuilder(
      column: $table.cookie, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get providedAt => $composableBuilder(
      column: $table.providedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get expiresAt => $composableBuilder(
      column: $table.expiresAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isValid => $composableBuilder(
      column: $table.isValid, builder: (column) => ColumnOrderings(column));
}

class $$CookieStoreTableAnnotationComposer
    extends Composer<_$AppDatabase, $CookieStoreTable> {
  $$CookieStoreTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get cookie =>
      $composableBuilder(column: $table.cookie, builder: (column) => column);

  GeneratedColumn<DateTime> get providedAt => $composableBuilder(
      column: $table.providedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get expiresAt =>
      $composableBuilder(column: $table.expiresAt, builder: (column) => column);

  GeneratedColumn<bool> get isValid =>
      $composableBuilder(column: $table.isValid, builder: (column) => column);
}

class $$CookieStoreTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CookieStoreTable,
    CookieStoreData,
    $$CookieStoreTableFilterComposer,
    $$CookieStoreTableOrderingComposer,
    $$CookieStoreTableAnnotationComposer,
    $$CookieStoreTableCreateCompanionBuilder,
    $$CookieStoreTableUpdateCompanionBuilder,
    (
      CookieStoreData,
      BaseReferences<_$AppDatabase, $CookieStoreTable, CookieStoreData>
    ),
    CookieStoreData,
    PrefetchHooks Function()> {
  $$CookieStoreTableTableManager(_$AppDatabase db, $CookieStoreTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CookieStoreTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CookieStoreTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CookieStoreTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> cookie = const Value.absent(),
            Value<DateTime> providedAt = const Value.absent(),
            Value<DateTime?> expiresAt = const Value.absent(),
            Value<bool> isValid = const Value.absent(),
          }) =>
              CookieStoreCompanion(
            id: id,
            cookie: cookie,
            providedAt: providedAt,
            expiresAt: expiresAt,
            isValid: isValid,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String cookie,
            Value<DateTime> providedAt = const Value.absent(),
            Value<DateTime?> expiresAt = const Value.absent(),
            Value<bool> isValid = const Value.absent(),
          }) =>
              CookieStoreCompanion.insert(
            id: id,
            cookie: cookie,
            providedAt: providedAt,
            expiresAt: expiresAt,
            isValid: isValid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CookieStoreTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CookieStoreTable,
    CookieStoreData,
    $$CookieStoreTableFilterComposer,
    $$CookieStoreTableOrderingComposer,
    $$CookieStoreTableAnnotationComposer,
    $$CookieStoreTableCreateCompanionBuilder,
    $$CookieStoreTableUpdateCompanionBuilder,
    (
      CookieStoreData,
      BaseReferences<_$AppDatabase, $CookieStoreTable, CookieStoreData>
    ),
    CookieStoreData,
    PrefetchHooks Function()>;
typedef $$FriendsTableCreateCompanionBuilder = FriendsCompanion Function({
  Value<int> userId,
  required String login,
  Value<String?> displayName,
  Value<String?> imageUrl,
  Value<String?> nickname,
  Value<double?> level,
  Value<String?> blackholedAt,
  Value<String?> discordDmUrl,
  Value<DateTime> addedAt,
  Value<String?> lastSeenLocation,
  Value<DateTime?> lastSeenAt,
  Value<bool> notifyEnabled,
});
typedef $$FriendsTableUpdateCompanionBuilder = FriendsCompanion Function({
  Value<int> userId,
  Value<String> login,
  Value<String?> displayName,
  Value<String?> imageUrl,
  Value<String?> nickname,
  Value<double?> level,
  Value<String?> blackholedAt,
  Value<String?> discordDmUrl,
  Value<DateTime> addedAt,
  Value<String?> lastSeenLocation,
  Value<DateTime?> lastSeenAt,
  Value<bool> notifyEnabled,
});

class $$FriendsTableFilterComposer
    extends Composer<_$AppDatabase, $FriendsTable> {
  $$FriendsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get login => $composableBuilder(
      column: $table.login, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nickname => $composableBuilder(
      column: $table.nickname, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get level => $composableBuilder(
      column: $table.level, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get blackholedAt => $composableBuilder(
      column: $table.blackholedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get discordDmUrl => $composableBuilder(
      column: $table.discordDmUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get addedAt => $composableBuilder(
      column: $table.addedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastSeenLocation => $composableBuilder(
      column: $table.lastSeenLocation,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastSeenAt => $composableBuilder(
      column: $table.lastSeenAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get notifyEnabled => $composableBuilder(
      column: $table.notifyEnabled, builder: (column) => ColumnFilters(column));
}

class $$FriendsTableOrderingComposer
    extends Composer<_$AppDatabase, $FriendsTable> {
  $$FriendsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get login => $composableBuilder(
      column: $table.login, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nickname => $composableBuilder(
      column: $table.nickname, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get level => $composableBuilder(
      column: $table.level, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get blackholedAt => $composableBuilder(
      column: $table.blackholedAt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get discordDmUrl => $composableBuilder(
      column: $table.discordDmUrl,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get addedAt => $composableBuilder(
      column: $table.addedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastSeenLocation => $composableBuilder(
      column: $table.lastSeenLocation,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastSeenAt => $composableBuilder(
      column: $table.lastSeenAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get notifyEnabled => $composableBuilder(
      column: $table.notifyEnabled,
      builder: (column) => ColumnOrderings(column));
}

class $$FriendsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FriendsTable> {
  $$FriendsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get login =>
      $composableBuilder(column: $table.login, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get nickname =>
      $composableBuilder(column: $table.nickname, builder: (column) => column);

  GeneratedColumn<double> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  GeneratedColumn<String> get blackholedAt => $composableBuilder(
      column: $table.blackholedAt, builder: (column) => column);

  GeneratedColumn<String> get discordDmUrl => $composableBuilder(
      column: $table.discordDmUrl, builder: (column) => column);

  GeneratedColumn<DateTime> get addedAt =>
      $composableBuilder(column: $table.addedAt, builder: (column) => column);

  GeneratedColumn<String> get lastSeenLocation => $composableBuilder(
      column: $table.lastSeenLocation, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSeenAt => $composableBuilder(
      column: $table.lastSeenAt, builder: (column) => column);

  GeneratedColumn<bool> get notifyEnabled => $composableBuilder(
      column: $table.notifyEnabled, builder: (column) => column);
}

class $$FriendsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FriendsTable,
    Friend,
    $$FriendsTableFilterComposer,
    $$FriendsTableOrderingComposer,
    $$FriendsTableAnnotationComposer,
    $$FriendsTableCreateCompanionBuilder,
    $$FriendsTableUpdateCompanionBuilder,
    (Friend, BaseReferences<_$AppDatabase, $FriendsTable, Friend>),
    Friend,
    PrefetchHooks Function()> {
  $$FriendsTableTableManager(_$AppDatabase db, $FriendsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FriendsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FriendsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FriendsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> userId = const Value.absent(),
            Value<String> login = const Value.absent(),
            Value<String?> displayName = const Value.absent(),
            Value<String?> imageUrl = const Value.absent(),
            Value<String?> nickname = const Value.absent(),
            Value<double?> level = const Value.absent(),
            Value<String?> blackholedAt = const Value.absent(),
            Value<String?> discordDmUrl = const Value.absent(),
            Value<DateTime> addedAt = const Value.absent(),
            Value<String?> lastSeenLocation = const Value.absent(),
            Value<DateTime?> lastSeenAt = const Value.absent(),
            Value<bool> notifyEnabled = const Value.absent(),
          }) =>
              FriendsCompanion(
            userId: userId,
            login: login,
            displayName: displayName,
            imageUrl: imageUrl,
            nickname: nickname,
            level: level,
            blackholedAt: blackholedAt,
            discordDmUrl: discordDmUrl,
            addedAt: addedAt,
            lastSeenLocation: lastSeenLocation,
            lastSeenAt: lastSeenAt,
            notifyEnabled: notifyEnabled,
          ),
          createCompanionCallback: ({
            Value<int> userId = const Value.absent(),
            required String login,
            Value<String?> displayName = const Value.absent(),
            Value<String?> imageUrl = const Value.absent(),
            Value<String?> nickname = const Value.absent(),
            Value<double?> level = const Value.absent(),
            Value<String?> blackholedAt = const Value.absent(),
            Value<String?> discordDmUrl = const Value.absent(),
            Value<DateTime> addedAt = const Value.absent(),
            Value<String?> lastSeenLocation = const Value.absent(),
            Value<DateTime?> lastSeenAt = const Value.absent(),
            Value<bool> notifyEnabled = const Value.absent(),
          }) =>
              FriendsCompanion.insert(
            userId: userId,
            login: login,
            displayName: displayName,
            imageUrl: imageUrl,
            nickname: nickname,
            level: level,
            blackholedAt: blackholedAt,
            discordDmUrl: discordDmUrl,
            addedAt: addedAt,
            lastSeenLocation: lastSeenLocation,
            lastSeenAt: lastSeenAt,
            notifyEnabled: notifyEnabled,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FriendsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FriendsTable,
    Friend,
    $$FriendsTableFilterComposer,
    $$FriendsTableOrderingComposer,
    $$FriendsTableAnnotationComposer,
    $$FriendsTableCreateCompanionBuilder,
    $$FriendsTableUpdateCompanionBuilder,
    (Friend, BaseReferences<_$AppDatabase, $FriendsTable, Friend>),
    Friend,
    PrefetchHooks Function()>;
typedef $$CachedUsersTableCreateCompanionBuilder = CachedUsersCompanion
    Function({
  Value<int> userId,
  required String login,
  Value<String?> displayName,
  Value<String?> imageUrl,
  Value<DateTime> cachedAt,
});
typedef $$CachedUsersTableUpdateCompanionBuilder = CachedUsersCompanion
    Function({
  Value<int> userId,
  Value<String> login,
  Value<String?> displayName,
  Value<String?> imageUrl,
  Value<DateTime> cachedAt,
});

class $$CachedUsersTableFilterComposer
    extends Composer<_$AppDatabase, $CachedUsersTable> {
  $$CachedUsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get login => $composableBuilder(
      column: $table.login, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
      column: $table.cachedAt, builder: (column) => ColumnFilters(column));
}

class $$CachedUsersTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedUsersTable> {
  $$CachedUsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get login => $composableBuilder(
      column: $table.login, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
      column: $table.cachedAt, builder: (column) => ColumnOrderings(column));
}

class $$CachedUsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedUsersTable> {
  $$CachedUsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get login =>
      $composableBuilder(column: $table.login, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$CachedUsersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CachedUsersTable,
    CachedUser,
    $$CachedUsersTableFilterComposer,
    $$CachedUsersTableOrderingComposer,
    $$CachedUsersTableAnnotationComposer,
    $$CachedUsersTableCreateCompanionBuilder,
    $$CachedUsersTableUpdateCompanionBuilder,
    (CachedUser, BaseReferences<_$AppDatabase, $CachedUsersTable, CachedUser>),
    CachedUser,
    PrefetchHooks Function()> {
  $$CachedUsersTableTableManager(_$AppDatabase db, $CachedUsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedUsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedUsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedUsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> userId = const Value.absent(),
            Value<String> login = const Value.absent(),
            Value<String?> displayName = const Value.absent(),
            Value<String?> imageUrl = const Value.absent(),
            Value<DateTime> cachedAt = const Value.absent(),
          }) =>
              CachedUsersCompanion(
            userId: userId,
            login: login,
            displayName: displayName,
            imageUrl: imageUrl,
            cachedAt: cachedAt,
          ),
          createCompanionCallback: ({
            Value<int> userId = const Value.absent(),
            required String login,
            Value<String?> displayName = const Value.absent(),
            Value<String?> imageUrl = const Value.absent(),
            Value<DateTime> cachedAt = const Value.absent(),
          }) =>
              CachedUsersCompanion.insert(
            userId: userId,
            login: login,
            displayName: displayName,
            imageUrl: imageUrl,
            cachedAt: cachedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CachedUsersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CachedUsersTable,
    CachedUser,
    $$CachedUsersTableFilterComposer,
    $$CachedUsersTableOrderingComposer,
    $$CachedUsersTableAnnotationComposer,
    $$CachedUsersTableCreateCompanionBuilder,
    $$CachedUsersTableUpdateCompanionBuilder,
    (CachedUser, BaseReferences<_$AppDatabase, $CachedUsersTable, CachedUser>),
    CachedUser,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$IntraNotificationsTableTableManager get intraNotifications =>
      $$IntraNotificationsTableTableManager(_db, _db.intraNotifications);
  $$CookieStoreTableTableManager get cookieStore =>
      $$CookieStoreTableTableManager(_db, _db.cookieStore);
  $$FriendsTableTableManager get friends =>
      $$FriendsTableTableManager(_db, _db.friends);
  $$CachedUsersTableTableManager get cachedUsers =>
      $$CachedUsersTableTableManager(_db, _db.cachedUsers);
}
