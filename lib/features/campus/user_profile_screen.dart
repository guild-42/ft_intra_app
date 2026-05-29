import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class UserProfileScreen extends StatefulWidget {
  final String login;
  const UserProfileScreen({super.key, required this.login});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  double _progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.login)),
      body: Column(
        children: [
          if (_progress < 1.0) LinearProgressIndicator(value: _progress),
          Expanded(
            child: InAppWebView(
              initialUrlRequest: URLRequest(
                url: WebUri('https://profile.intra.42.fr/users/${widget.login}'),
              ),
              initialSettings: InAppWebViewSettings(
                javaScriptEnabled: true,
                domStorageEnabled: true,
              ),
              onProgressChanged: (controller, progress) {
                setState(() => _progress = progress / 100);
              },
            ),
          ),
        ],
      ),
    );
  }
}
