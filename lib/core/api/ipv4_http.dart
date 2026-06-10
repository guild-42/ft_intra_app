import 'package:dio/dio.dart';
import 'ipv4_http_io.dart' if (dart.library.html) 'ipv4_http_stub.dart';

/// Makes [dio] prefer IPv4 when establishing connections (no-op on web).
///
/// Dart's HttpClient has no Happy-Eyeballs (RFC 8305) IPv6→IPv4 fallback, so on
/// networks whose IPv6 path is broken/blackholed (seen on some tethered
/// cellular links) it stalls on an unreachable IPv6 address until timeout
/// instead of using a working IPv4 one — causing intermittent
/// `connectionTimeout`s that browsers don't hit. This resolves the host and
/// connects to an IPv4 address first, falling back to IPv6 only if none exists.
void applyIpv4Preference(Dio dio) => applyIpv4PreferenceImpl(dio);
