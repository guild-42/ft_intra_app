import 'package:go_router/go_router.dart';
import 'package:ft_intra/core/models/user.dart';
import 'package:ft_intra/features/auth/splash_screen.dart';
import 'package:ft_intra/features/auth/login_screen.dart';
import 'package:ft_intra/features/auth/callback_screen.dart';
import 'package:ft_intra/features/auth/oauth_webview_screen.dart';
import 'package:ft_intra/features/dashboard/dashboard_screen.dart';
import 'package:ft_intra/features/dashboard/project_detail_screen.dart';
import 'package:ft_intra/features/notifications/notifications_screen.dart';
import 'package:ft_intra/features/notifications/cookie_webview_screen.dart';
import 'package:ft_intra/features/campus/campus_screen.dart';
import 'package:ft_intra/features/campus/user_profile_screen.dart';
import 'package:ft_intra/features/campus/user_detail_screen.dart';
import 'package:ft_intra/features/evaluations/evaluations_screen.dart';
import 'package:ft_intra/features/events/events_screen.dart';
import 'package:ft_intra/features/settings/settings_screen.dart';
import 'package:ft_intra/app_shell.dart';

final routerConfig = GoRouter(
  initialLocation: '/',
  redirect: (context, state) {
    final location = state.uri.toString();
    if (location.contains('callback')) {
      final uri = Uri.parse(location);
      final code = uri.queryParameters['code'];
      if (code != null) {
        return '/auth-callback?code=$code';
      }
    }
    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/callback',
      builder: (context, state) {
        final code = state.uri.queryParameters['code'];
        return CallbackScreen(code: code);
      },
    ),
    GoRoute(
      path: '/auth-callback',
      builder: (context, state) {
        final code = state.uri.queryParameters['code'];
        return CallbackScreen(code: code);
      },
    ),
    GoRoute(
      path: '/cookie-login',
      builder: (context, state) => const CookieWebViewScreen(),
    ),
    GoRoute(
      path: '/oauth',
      builder: (context, state) => const OAuthWebViewScreen(),
    ),
    GoRoute(
      path: '/user/:login',
      builder: (context, state) {
        final login = state.pathParameters['login']!;
        return UserDetailScreen(login: login);
      },
    ),
    GoRoute(
      path: '/user-webview/:login',
      builder: (context, state) {
        final login = state.pathParameters['login']!;
        return UserProfileScreen(login: login);
      },
    ),
    GoRoute(
      path: '/project-detail',
      builder: (context, state) {
        final project = state.extra as ProjectUser;
        return ProjectDetailScreen(project: project);
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          AppShell(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/dashboard',
            builder: (context, state) => const DashboardScreen(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/notifications',
            builder: (context, state) => const NotificationsScreen(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/campus',
            builder: (context, state) => const CampusScreen(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/events',
            builder: (context, state) => const EventsScreen(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/evaluations',
            builder: (context, state) => const EvaluationsScreen(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/settings',
            builder: (context, state) => const SettingsScreen(),
          ),
        ]),
      ],
    ),
  ],
);
