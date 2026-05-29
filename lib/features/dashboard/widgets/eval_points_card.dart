import 'package:flutter/material.dart';

class EvalPointsCard extends StatelessWidget {
  final int points;

  const EvalPointsCard({super.key, required this.points});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const Icon(Icons.stars, size: 32, color: Color(0xFF00BABC)),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Evaluation Points'),
                Text(
                  '$points',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
