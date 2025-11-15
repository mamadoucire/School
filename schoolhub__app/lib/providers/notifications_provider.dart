import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/app_notification.dart';
import '../data/repositories/mock_parent_repository.dart';
import 'auth_provider.dart';

final notificationsProvider = FutureProvider<List<AppNotificationModel>>((ref) async {
  final repository = ref.watch(parentRepositoryProvider);
  return await repository.getNotifications();
});

final unreadNotificationsCountProvider = Provider<int>((ref) {
  final notifications = ref.watch(notificationsProvider);
  return notifications.when(
    data: (notifs) => notifs.where((n) => !n.read).length,
    loading: () => 0,
    error: (_, __) => 0,
  );
});

