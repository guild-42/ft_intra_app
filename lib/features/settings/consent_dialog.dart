import 'package:flutter/material.dart';
import 'package:ft_intra/l10n/strings.dart';

const _teal = Color(0xFF00BABC);

/// Consent dialog shown before sending a credential to the backend.
///
/// [forToken] true = the OAuth token (review notifications); false = the intra
/// cookie (event / friend / evalpo notifications). The "what is stored" line is
/// swapped accordingly. Returns true only if the user explicitly agreed.
Future<bool> showConsentDialog(
  BuildContext context,
  AppStrings s, {
  required bool forToken,
}) async {
  final agreed = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(s.get('consent_title')),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Para(Icons.notifications_active, s.get('consent_benefit')),
            _Para(Icons.help_outline, s.get('consent_why')),
            _Para(
              Icons.cloud_upload_outlined,
              s.get(forToken ? 'consent_stored_token' : 'consent_stored_cookie'),
            ),
            _Para(Icons.lock_outline, s.get('consent_usage_limit')),
            _Para(Icons.warning_amber_outlined, s.get('consent_risk'),
                color: Colors.orange.shade800),
            _Para(Icons.tune, s.get('consent_control')),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(s.get('consent_decline')),
        ),
        FilledButton(
          style: FilledButton.styleFrom(backgroundColor: _teal),
          onPressed: () => Navigator.pop(context, true),
          child: Text(s.get('consent_agree')),
        ),
      ],
    ),
  );
  return agreed ?? false;
}

class _Para extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? color;
  const _Para(this.icon, this.text, {this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: color ?? _teal),
          const SizedBox(width: 10),
          Expanded(
            child: Text(text,
                style: TextStyle(fontSize: 13, height: 1.35, color: color)),
          ),
        ],
      ),
    );
  }
}
