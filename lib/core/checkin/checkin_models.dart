// Distinct from the 42 API ubuntu-session locations on the Active Users tab:
// this is our own location-based check-in (GET /api/checkins).
class CheckedInUser {
  final int userId;
  final String login;
  final int campusId;
  final String source; // 'geo' | 'manual'
  final DateTime? checkedInAt;

  const CheckedInUser({
    required this.userId,
    required this.login,
    required this.campusId,
    required this.source,
    this.checkedInAt,
  });

  factory CheckedInUser.fromJson(Map<String, dynamic> json) {
    final raw = json['checked_in_at'];
    return CheckedInUser(
      userId: (json['user_id'] as num?)?.toInt() ?? 0,
      login: json['login'] as String? ?? '',
      campusId: (json['campus_id'] as num?)?.toInt() ?? 0,
      source: json['source'] as String? ?? 'geo',
      checkedInAt: raw is String ? DateTime.tryParse(raw) : null,
    );
  }
}
