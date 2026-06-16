import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

/// When true, the app runs on bundled mock data with no network/push/secure
/// storage — so App Store reviewers (and curious first users) can explore every
/// screen without a 42 account. Set from the login screen's "Try the demo"
/// button; cleared on exit. Leaf data providers read this and short-circuit to
/// [DemoData].
final demoModeProvider = StateProvider<bool>((_) => false);

void enterDemoMode(WidgetRef ref) =>
    ref.read(demoModeProvider.notifier).state = true;

void exitDemoMode(WidgetRef ref) =>
    ref.read(demoModeProvider.notifier).state = false;
