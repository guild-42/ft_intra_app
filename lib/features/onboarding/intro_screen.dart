import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ft_intra/core/providers.dart';
import 'package:ft_intra/core/prefs/prefs_store.dart';

const _teal = Color(0xFF00BABC);

/// First-launch intro carousel (shown once; persisted via PrefsKeys.seenIntro).
/// Skippable. On finish/skip → /login.
class IntroScreen extends ConsumerStatefulWidget {
  const IntroScreen({super.key});

  @override
  ConsumerState<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends ConsumerState<IntroScreen> {
  final _controller = PageController();
  int _page = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _finish() async {
    await ref.read(prefsStoreProvider).setBool(PrefsKeys.seenIntro, true);
    if (mounted) context.go('/login');
  }

  @override
  Widget build(BuildContext context) {
    final s = ref.watch(stringsProvider);
    final slides = [
      (
        Icons.notifications_active,
        s.get('intro_notifications_title'),
        s.get('intro_notifications_body'),
      ),
      (
        Icons.location_on,
        s.get('intro_presence_title'),
        s.get('intro_presence_body'),
      ),
      (
        Icons.rate_review,
        s.get('intro_evals_title'),
        s.get('intro_evals_body'),
      ),
    ];
    final isLast = _page == slides.length - 1;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: _finish,
                child: Text(s.get('intro_skip')),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (i) => setState(() => _page = i),
                itemCount: slides.length,
                itemBuilder: (context, i) {
                  final (icon, title, body) = slides[i];
                  return Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(icon, size: 96, color: _teal),
                        const SizedBox(height: 32),
                        Text(title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 16),
                        Text(body,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 15, color: Colors.grey)),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                slides.length,
                (i) => AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: i == _page ? 20 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: i == _page ? _teal : Colors.grey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                      backgroundColor: _teal, minimumSize: const Size(0, 52)),
                  onPressed: () {
                    if (isLast) {
                      _finish();
                    } else {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeOut,
                      );
                    }
                  },
                  child: Text(
                      s.get(isLast ? 'intro_start' : 'intro_next')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
