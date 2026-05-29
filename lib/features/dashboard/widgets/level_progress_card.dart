import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class LevelProgressCard extends StatelessWidget {
  final double level;
  final String cursusName;

  const LevelProgressCard({
    super.key,
    required this.level,
    required this.cursusName,
  });

  @override
  Widget build(BuildContext context) {
    final intLevel = level.floor();
    final progress = level - intLevel;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(cursusName,
                    style: Theme.of(context).textTheme.titleSmall),
                Text(
                  'Level $intLevel',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00BABC),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            LinearPercentIndicator(
              lineHeight: 20,
              percent: progress,
              center: Text(
                '${(progress * 100).toStringAsFixed(0)}%',
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.grey.shade800,
              progressColor: const Color(0xFF00BABC),
              barRadius: const Radius.circular(10),
              padding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    );
  }
}
