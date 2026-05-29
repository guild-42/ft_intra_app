import 'package:flutter/material.dart';

class BlackholeTimer extends StatelessWidget {
  final String? blackholedAt;

  const BlackholeTimer({super.key, this.blackholedAt});

  @override
  Widget build(BuildContext context) {
    if (blackholedAt == null) {
      return const SizedBox.shrink();
    }

    final deadline = DateTime.tryParse(blackholedAt!);
    if (deadline == null) return const SizedBox.shrink();

    final daysLeft = deadline.difference(DateTime.now()).inDays;
    final isUrgent = daysLeft < 30;

    return Card(
      color: isUrgent ? Colors.red.shade900 : null,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(
              Icons.timer,
              size: 32,
              color: isUrgent ? Colors.red.shade200 : const Color(0xFF00BABC),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Blackhole'),
                  Text(
                    '$daysLeft days',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: isUrgent ? Colors.red.shade200 : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
