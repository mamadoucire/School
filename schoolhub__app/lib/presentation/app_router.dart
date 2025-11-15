import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';
import '../core/constants.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';
import 'pages/child_detail_page.dart';
import 'pages/bulletin_page.dart';
import 'pages/notifications_page.dart';
import 'pages/profil_page.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: AppRoutes.login,
    redirect: (context, state) {
      final isAuthenticated = authState.isAuthenticated;
      final isLoggingIn = state.matchedLocation == AppRoutes.login;

      if (!isAuthenticated && !isLoggingIn) {
        return AppRoutes.login;
      }
      if (isAuthenticated && isLoggingIn) {
        return AppRoutes.home;
      }
      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.login,
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.home,
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/child/:id',
        name: 'childDetail',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return ChildDetailPage(childId: id);
        },
      ),
      GoRoute(
        path: AppRoutes.bulletin,
        name: 'bulletin',
        builder: (context, state) {
          final childId = state.uri.queryParameters['childId'];
          return BulletinPage(childId: childId);
        },
      ),
      GoRoute(
        path: AppRoutes.notifications,
        name: 'notifications',
        builder: (context, state) => const NotificationsPage(),
      ),
      GoRoute(
        path: AppRoutes.profile,
        name: 'profile',
        builder: (context, state) => const ProfilPage(),
      ),
    ],
  );
});

