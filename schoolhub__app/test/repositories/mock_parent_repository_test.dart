import 'package:flutter_test/flutter_test.dart';
import 'package:schoolhub__app/data/repositories/mock_parent_repository.dart';

void main() {
  group('MockParentRepository', () {
    late MockParentRepository repository;

    setUp(() {
      repository = MockParentRepository();
    });

    test('login with valid credentials should return user', () async {
      final user = await repository.login('demo@parent.com', '1234');

      expect(user, isNotNull);
      expect(user?.email, 'demo@parent.com');
      expect(user?.firstName, 'Parent');
      expect(user?.lastName, 'Dupont');
      expect(user?.id, 'u1');
    });

    test('login with invalid credentials should return null', () async {
      final user = await repository.login('wrong@email.com', 'wrongpass');

      expect(user, null);
    });

    test('getChildren should return list of children', () async {
      final children = await repository.getChildren();

      expect(children, isNotEmpty);
      expect(children.length, greaterThan(0));
      expect(children.first.id, isNotEmpty);
      expect(children.first.firstName, isNotEmpty);
      expect(children.first.lastName, isNotEmpty);
    });

    test('getChildById with valid id should return child', () async {
      final children = await repository.getChildren();
      final firstChildId = children.first.id;

      final child = await repository.getChildById(firstChildId);

      expect(child, isNotNull);
      expect(child?.id, firstChildId);
    });

    test('getChildById with invalid id should return null', () async {
      final child = await repository.getChildById('invalid-id');

      expect(child, null);
    });

    test('getNotifications should return list of notifications', () async {
      final notifications = await repository.getNotifications();

      expect(notifications, isNotEmpty);
      expect(notifications.first.id, isNotEmpty);
      expect(notifications.first.title, isNotEmpty);
      expect(notifications.first.body, isNotEmpty);
    });

    test('markNotificationAsRead should complete without error', () async {
      final notifications = await repository.getNotifications();
      final firstNotificationId = notifications.first.id;

      expect(
        () => repository.markNotificationAsRead(firstNotificationId),
        returnsNormally,
      );
    });
  });
}

