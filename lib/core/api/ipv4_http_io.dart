import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

/// Native (dart:io) implementation: install a connection factory that resolves
/// the host and connects to an IPv4 address first, falling back to IPv6 only
/// when no IPv4 address is available.
///
/// A custom [HttpClient.connectionFactory] BYPASSES dart:io's built-in TLS
/// selection (which only uses SecureSocket when no factory is set), so we MUST
/// return a [SecureSocket] ourselves for https — otherwise a plain HTTP request
/// is written to port 443 and the server replies "400 The plain HTTP request
/// was sent to HTTPS port". We pass the resolved [InternetAddress] (whose `host`
/// carries the original DNS name) so SNI / certificate validation still target
/// the hostname, not the raw IP.
void applyIpv4PreferenceImpl(Dio dio) {
  dio.httpClientAdapter = IOHttpClientAdapter(
    createHttpClient: () {
      final client = HttpClient();
      client.connectionFactory = (uri, proxyHost, proxyPort) {
        final host = proxyHost ?? uri.host;
        final port = proxyPort ?? uri.port;
        final isSecure = uri.isScheme('https');
        Future<ConnectionTask<Socket>> connect(Object target) => isSecure
            ? SecureSocket.startConnect(target, port)
            : Socket.startConnect(target, port);
        // Already a literal IP — connect directly.
        final literal = InternetAddress.tryParse(host);
        if (literal != null) {
          return connect(literal);
        }
        return InternetAddress.lookup(host).then((addrs) {
          final v4 = addrs
              .where((a) => a.type == InternetAddressType.IPv4)
              .toList()
            // Cloudflare returns multiple edge IPs; dart:io has no Happy-Eyeballs
            // and would always pick the first, so a momentarily-bad path stalls
            // the full connectTimeout. Shuffle so each (re)connect picks a
            // different edge — paired with the API client's connect-retry this
            // recovers instead of repeatedly hitting the same bad IP.
            ..shuffle();
          final target = v4.isNotEmpty ? v4.first : addrs.first;
          return connect(target);
        });
      };
      return client;
    },
  );
}
