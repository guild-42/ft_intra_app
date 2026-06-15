/// A 42 `feedback` — the comment + rating a corrector leaves after an
/// evaluation (`feedbackable_type == 'ScaleTeam'`) or an event
/// (`feedbackable_type == 'Event'`).
///
/// Plain class (no freezed/json_serializable): it's deserialize-only and keeps
/// this change codegen-free. The feedback itself carries no project name or
/// counterpart — those live on the referenced scale_team (`feedbackableId`),
/// fetched lazily on tap.
class FtFeedback {
  final int id;
  final int userId;
  final String feedbackableType;
  final int? feedbackableId;
  final String? comment;
  final num? rating; // 0..5
  final String? createdAt;

  const FtFeedback({
    required this.id,
    required this.userId,
    required this.feedbackableType,
    this.feedbackableId,
    this.comment,
    this.rating,
    this.createdAt,
  });

  factory FtFeedback.fromJson(Map<String, dynamic> json) => FtFeedback(
        id: json['id'] as int,
        userId: json['user_id'] as int? ?? 0,
        feedbackableType: json['feedbackable_type'] as String? ?? 'ScaleTeam',
        feedbackableId: json['feedbackable_id'] as int?,
        comment: json['comment'] as String?,
        rating: json['rating'] as num?,
        createdAt: json['created_at'] as String?,
      );

  bool get isScaleTeam => feedbackableType == 'ScaleTeam';
  DateTime? get createdAtLocal =>
      createdAt == null ? null : DateTime.tryParse(createdAt!)?.toLocal();
}
