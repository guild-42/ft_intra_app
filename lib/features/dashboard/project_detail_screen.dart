import 'package:flutter/material.dart';
import 'package:ft_intra/core/models/user.dart';

class ProjectDetailScreen extends StatelessWidget {
  final ProjectUser project;

  const ProjectDetailScreen({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final validated = project.validated ?? false;
    final isFinished = project.status == 'finished';

    return Scaffold(
      appBar: AppBar(title: Text(project.project.name)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Icon(
                    validated
                        ? Icons.check_circle
                        : isFinished
                            ? Icons.cancel
                            : Icons.hourglass_empty,
                    size: 64,
                    color: validated
                        ? Colors.green
                        : isFinished
                            ? Colors.red
                            : Colors.orange,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    project.project.name,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  if (project.finalMark != null)
                    Text(
                      '${project.finalMark}',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: validated ? Colors.green : Colors.red,
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          _InfoRow(label: 'Status', value: project.status),
          _InfoRow(
            label: 'Validated',
            value: validated ? 'Yes' : 'No',
          ),
          _InfoRow(label: 'Slug', value: project.project.slug),
          if (project.markedAt != null)
            _InfoRow(label: 'Marked at', value: _formatDate(project.markedAt!)),
          _InfoRow(
            label: 'Cursus',
            value: project.cursusIds.contains(21)
                ? '42cursus'
                : project.cursusIds.contains(9)
                    ? 'C Piscine'
                    : project.cursusIds.join(', '),
          ),
        ],
      ),
    );
  }

  String _formatDate(String iso) {
    final dt = DateTime.tryParse(iso);
    if (dt == null) return iso;
    return '${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')} '
        '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(color: Colors.grey)),
            Flexible(
              child: Text(
                value,
                style: const TextStyle(fontWeight: FontWeight.w500),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
