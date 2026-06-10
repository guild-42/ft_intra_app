import 'package:flutter/material.dart';
import 'package:ft_intra/core/models/user.dart';

const _pageSize = 15;
const _piscineCursusId = 9;

List<ProjectUser> _sorted(List<ProjectUser> projects) {
  final copy = List<ProjectUser>.from(projects);
  copy.sort((a, b) {
    final order = _statusOrder(a.status).compareTo(_statusOrder(b.status));
    if (order != 0) return order;
    final aDate = a.markedAt ?? '';
    final bDate = b.markedAt ?? '';
    return bDate.compareTo(aDate);
  });
  return copy;
}

int _statusOrder(String status) {
  switch (status) {
    case 'in_progress':
      return 0;
    case 'waiting_for_correction':
      return 1;
    case 'searching_a_group':
      return 2;
    case 'creating_group':
      return 3;
    case 'finished':
      return 4;
    default:
      return 5;
  }
}

class ProjectListSection extends StatefulWidget {
  final List<ProjectUser> projects;
  final String title;
  final void Function(ProjectUser) onTap;

  const ProjectListSection({
    super.key,
    required this.projects,
    required this.title,
    required this.onTap,
  });

  @override
  State<ProjectListSection> createState() => _ProjectListSectionState();
}

class _ProjectListSectionState extends State<ProjectListSection> {
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    final sorted = _sorted(widget.projects);
    final totalPages = (sorted.length / _pageSize).ceil();
    final start = _page * _pageSize;
    final end = (start + _pageSize).clamp(0, sorted.length);
    final pageItems = sorted.sublist(start, end);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${widget.title} (${sorted.length})',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            if (totalPages > 1)
              Text(
                '${_page + 1} / $totalPages',
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
          ],
        ),
        const SizedBox(height: 8),
        if (pageItems.isEmpty)
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text('No projects', style: TextStyle(color: Colors.grey)),
          ),
        ...pageItems.map((p) => _ProjectTile(
              project: p,
              onTap: () => widget.onTap(p),
            )),
        if (totalPages > 1) ...[
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _page > 0 ? () => setState(() => _page--) : null,
                icon: const Icon(Icons.chevron_left),
              ),
              ...List.generate(totalPages, (i) {
                if (totalPages > 7 && (i > 2 && i < totalPages - 2) && (i - _page).abs() > 1) {
                  if (i == 3 || i == totalPages - 3) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Text('...', style: TextStyle(color: Colors.grey)),
                    );
                  }
                  return const SizedBox.shrink();
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: InkWell(
                    onTap: () => setState(() => _page = i),
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      width: 32,
                      height: 32,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: i == _page ? const Color(0xFF00BABC) : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '${i + 1}',
                        style: TextStyle(
                          color: i == _page ? Colors.white : Colors.grey,
                          fontWeight: i == _page ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                );
              }),
              IconButton(
                onPressed: _page < totalPages - 1 ? () => setState(() => _page++) : null,
                icon: const Icon(Icons.chevron_right),
              ),
            ],
          ),
        ],
      ],
    );
  }
}

class _ProjectTile extends StatelessWidget {
  final ProjectUser project;
  final VoidCallback onTap;

  const _ProjectTile({required this.project, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final validated = project.validated ?? false;
    final isFinished = project.status == 'finished';

    return Card(
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          validated
              ? Icons.check_circle
              : isFinished
                  ? Icons.cancel
                  : Icons.hourglass_empty,
          color: validated
              ? Colors.green
              : isFinished
                  ? Colors.red
                  : Colors.orange,
        ),
        title: Text(project.project.name),
        subtitle: Text(project.status),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (project.finalMark != null)
              Text(
                '${project.finalMark}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: validated ? Colors.green : Colors.red,
                ),
              ),
            const SizedBox(width: 4),
            const Icon(Icons.chevron_right, size: 20, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

({List<ProjectUser> cursus, List<ProjectUser> piscine}) splitProjects(List<ProjectUser> all) {
  final cursus = <ProjectUser>[];
  final piscine = <ProjectUser>[];
  for (final p in all) {
    if (p.cursusIds.contains(_piscineCursusId)) {
      piscine.add(p);
    } else {
      cursus.add(p);
    }
  }
  return (cursus: cursus, piscine: piscine);
}
