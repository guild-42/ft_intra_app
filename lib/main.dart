import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ft_intra/config/router.dart';
import 'package:ft_intra/config/theme.dart';
import 'package:ft_intra/core/checkin/checkin_service.dart';
import 'package:ft_intra/core/notifications/fcm_service.dart';
import 'package:ft_intra/core/providers.dart';
import 'package:ft_intra/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb) {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      await FcmService.initialize(
        // Cold-start taps arrive before runApp — defer until the router is
        // attached to the first frame.
        onNavigate: (route) => WidgetsBinding.instance
            .addPostFrameCallback((_) => routerConfig.go(route)),
      );
    } catch (e) {
      debugPrint('Firebase init failed: $e');
    }

    try {
      // Replay any manual check-in/out POST that failed offline.
      await CheckinService().syncPending();
    } catch (e) {
      debugPrint('Checkin sync failed: $e');
    }
  }

  runApp(const ProviderScope(child: FtIntra42App()));
}

class FtIntra42App extends ConsumerStatefulWidget {
  const FtIntra42App({super.key});

  @override
  ConsumerState<FtIntra42App> createState() => _FtIntra42AppState();
}

class _FtIntra42AppState extends ConsumerState<FtIntra42App>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && !kIsWeb) {
      ref.read(checkinServiceProvider).syncPending();
      ref.read(checkinStatusProvider.notifier).refresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'ft_intra',
      theme: FtTheme.light,
      darkTheme: FtTheme.dark,
      themeMode: ThemeMode.dark,
      routerConfig: routerConfig,
      debugShowCheckedModeBanner: false,
    );
  }
}
