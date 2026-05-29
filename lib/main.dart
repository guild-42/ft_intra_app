import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ft_intra/config/constants.dart';
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
      await FcmService.initialize();
    } catch (e) {
      debugPrint('Firebase init failed: $e');
    }

    try {
      final prefs = await SharedPreferences.getInstance();
      final enabled = prefs.getBool('checkin_geofence_enabled') ?? false;
      final campusId =
          prefs.getInt('selected_campus_id') ?? FtConstants.campusIdTokyo;
      final service = CheckinService();
      // Re-register the geofence if relaunch/reboot dropped it, then replay any
      // check-in/out POST that failed in the background isolate.
      await service.reconcileGeofence(enabled: enabled, campusId: campusId);
      await service.syncPending();
    } catch (e) {
      debugPrint('Checkin init failed: $e');
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
