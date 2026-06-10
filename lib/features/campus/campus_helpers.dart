/// Shared campus helpers used by campus_screen and its tabs. Lives here (not in
/// campus_screen) so the tabs don't have to import the screen back — that
/// previously created a circular dependency between the tabs and their parent.
String clusterFromHost(String host) {
  // c1r5p3 -> c1 ; 1A1 -> 1A ; e1r2p1 -> e1
  final match = RegExp(r'^([a-zA-Z]?\d+[a-zA-Z]*|\d*[a-zA-Z]+\d*)').firstMatch(host);
  if (match == null) return host;
  final m = match.group(1)!;
  // strip trailing rN/pN
  final idx = m.indexOf(RegExp(r'[rRpP]'));
  if (idx > 0) return m.substring(0, idx);
  return m;
}
