import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:ft_intra/core/providers.dart';

class IntraWebView extends ConsumerStatefulWidget {
  const IntraWebView({super.key});

  @override
  ConsumerState<IntraWebView> createState() => _IntraWebViewState();
}

class _IntraWebViewState extends ConsumerState<IntraWebView> {
  static final Uri _home = Uri.parse('https://profile.intra.42.fr');

  late final WebViewController _controller;
  bool _isLoading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) => setState(() {
            _isLoading = true;
            _hasError = false;
          }),
          onPageFinished: (_) => setState(() => _isLoading = false),
          // Only treat main-frame failures as a page error; a single failed
          // subresource shouldn't blank out an otherwise-loaded page.
          onWebResourceError: (error) {
            if (error.isForMainFrame == false) return;
            setState(() {
              _isLoading = false;
              _hasError = true;
            });
          },
        ),
      )
      ..loadRequest(_home);
  }

  void _reload() {
    setState(() {
      _isLoading = true;
      _hasError = false;
    });
    // After a hard network failure there's no committed page to reload(), so
    // re-issue the original request rather than _controller.reload().
    _controller.loadRequest(_home);
  }

  @override
  Widget build(BuildContext context) {
    final s = ref.watch(stringsProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
        heroTag: 'intra_reload',
        backgroundColor: const Color(0xFF00BABC),
        tooltip: s.get('reload'),
        onPressed: _reload,
        child: const Icon(Icons.refresh),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            WebViewWidget(controller: _controller),
            if (_hasError)
              Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.wifi_off,
                            size: 48, color: Colors.grey),
                        const SizedBox(height: 16),
                        Text(
                          s.get('network_error'),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        FilledButton.icon(
                          onPressed: _reload,
                          icon: const Icon(Icons.refresh),
                          label: Text(s.get('reload')),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            if (_isLoading && !_hasError)
              const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
