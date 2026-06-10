import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ft_intra/config/constants.dart';
import 'package:ft_intra/core/providers.dart';

/// In-app OAuth capture: loads the 42 authorize URL in a webview and intercepts
/// the `ft-intra42://callback?code=...` redirect, exchanging the code for a
/// token (stored in secure storage by [AuthService.exchangeCode]).
///
/// Pop result: `true` if a token was obtained, `false`/`null` otherwise. Used
/// to capture a fresh `public projects` token for review notifications without
/// leaving the app.
class OAuthWebViewScreen extends ConsumerStatefulWidget {
  const OAuthWebViewScreen({super.key});

  @override
  ConsumerState<OAuthWebViewScreen> createState() => _OAuthWebViewScreenState();
}

class _OAuthWebViewScreenState extends ConsumerState<OAuthWebViewScreen> {
  double _progress = 0;
  bool _exchanging = false;

  Future<void> _handleCode(String code) async {
    if (_exchanging) return;
    setState(() => _exchanging = true);
    final ok = await ref.read(authServiceProvider).exchangeCode(code);
    debugPrint('OAuthWebView exchange result: $ok');
    if (mounted) Navigator.of(context).pop(ok);
  }

  @override
  Widget build(BuildContext context) {
    final authorizeUrl = ref.read(authServiceProvider).authorizeUrl;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authorize 42'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(false),
        ),
      ),
      body: Column(
        children: [
          if (_progress < 1.0) LinearProgressIndicator(value: _progress),
          if (_exchanging) const LinearProgressIndicator(),
          Expanded(
            child: InAppWebView(
              initialUrlRequest: URLRequest(url: WebUri(authorizeUrl)),
              initialSettings: InAppWebViewSettings(
                javaScriptEnabled: true,
                domStorageEnabled: true,
                // Required for shouldOverrideUrlLoading to fire at all — without
                // it the ft-intra42://callback redirect is never intercepted.
                useShouldOverrideUrlLoading: true,
              ),
              onProgressChanged: (_, p) => setState(() => _progress = p / 100),
              onLoadStop: (controller, url) async {
                // Fallback: some redirects to a custom scheme surface here.
                final u = url?.toString() ?? '';
                debugPrint('OAuthWebView onLoadStop: $u');
                if (u.startsWith(FtConstants.redirectUriMobile)) {
                  final code = Uri.parse(u).queryParameters['code'];
                  if (code != null && code.isNotEmpty) await _handleCode(code);
                }
              },
              shouldOverrideUrlLoading: (controller, action) async {
                final url = action.request.url?.toString() ?? '';
                debugPrint('OAuthWebView navigating: $url');
                if (url.startsWith(FtConstants.redirectUriMobile)) {
                  final code = Uri.parse(url).queryParameters['code'];
                  debugPrint('OAuthWebView callback caught, code=${code != null}');
                  if (code != null && code.isNotEmpty) {
                    await _handleCode(code);
                  } else {
                    if (mounted) Navigator.of(context).pop(false);
                  }
                  return NavigationActionPolicy.CANCEL;
                }
                return NavigationActionPolicy.ALLOW;
              },
            ),
          ),
        ],
      ),
    );
  }
}
