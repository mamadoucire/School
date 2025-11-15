import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:schoolhub__app/data/models/user_model.dart';
import 'package:schoolhub__app/data/repositories/mock_parent_repository.dart';
import 'package:schoolhub__app/domain/usecases/auth_usecase.dart';
import 'package:schoolhub__app/providers/auth_provider.dart';

void main() {
  group('AuthProvider', () {
    test('initial state should be unauthenticated', () {
      final container = ProviderContainer();
      final authState = container.read(authStateProvider);

      expect(authState.isAuthenticated, false);
      expect(authState.user, null);
      expect(authState.isLoading, false);
      expect(authState.error, null);
    });

    test('login with valid credentials should succeed', () async {
      final container = ProviderContainer();
      final authNotifier = container.read(authStateProvider.notifier);

      final result = await authNotifier.login('demo@parent.com', '1234');

      expect(result, true);
      final authState = container.read(authStateProvider);
      expect(authState.isAuthenticated, true);
      expect(authState.user, isNotNull);
      expect(authState.user?.email, 'demo@parent.com');
      expect(authState.user?.firstName, 'Parent');
      expect(authState.isLoading, false);
    });

    test('login with invalid credentials should fail', () async {
      final container = ProviderContainer();
      final authNotifier = container.read(authStateProvider.notifier);

      final result = await authNotifier.login('wrong@email.com', 'wrongpass');

      expect(result, false);
      final authState = container.read(authStateProvider);
      expect(authState.isAuthenticated, false);
      expect(authState.user, null);
      expect(authState.error, 'Identifiants invalides');
      expect(authState.isLoading, false);
    });

    test('logout should reset state', () async {
      final container = ProviderContainer();
      final authNotifier = container.read(authStateProvider.notifier);

      // First login
      await authNotifier.login('demo@parent.com', '1234');
      expect(container.read(authStateProvider).isAuthenticated, true);

      // Then logout
      authNotifier.logout();
      final authState = container.read(authStateProvider);
      expect(authState.isAuthenticated, false);
      expect(authState.user, null);
    });
  });
}

