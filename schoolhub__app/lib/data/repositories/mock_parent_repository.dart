import '../models/user_model.dart';
import '../models/child_model.dart';
import '../../models/app_notification.dart';
import '../../services/mock_service.dart';
import '../../models/child.dart' as old;

abstract class ParentRepository {
  Future<UserModel?> login(String email, String password);
  Future<List<ChildModel>> getChildren();
  Future<ChildModel?> getChildById(String id);
  Future<List<AppNotificationModel>> getNotifications();
  Future<void> markNotificationAsRead(String notificationId);
}

class MockParentRepository implements ParentRepository {
  @override
  Future<UserModel?> login(String email, String password) async {
    // Simule un délai réseau
    await Future.delayed(const Duration(milliseconds: 800));

    // Mock: accepte demo@parent.com / 1234
    if (email == 'demo@parent.com' && password == '1234') {
      return UserModel(
        id: 'u1',
        email: email,
        firstName: 'Parent',
        lastName: 'Dupont',
        phone: '+224 612 345 678',
      );
    }
    return null;
  }

  @override
  Future<List<ChildModel>> getChildren() async {
    await Future.delayed(const Duration(milliseconds: 500));
    final oldChildren = MockService.getChildren();
    // Convert old models to new models
    return oldChildren.map((oldChild) {
      return ChildModel(
        id: oldChild.id,
        firstName: oldChild.firstName,
        lastName: oldChild.lastName,
        classe: oldChild.classe,
        age: oldChild.age,
        avatar: oldChild.avatar,
        notes: oldChild.notes,
        absences: oldChild.absences,
        bulletins: oldChild.bulletins,
      );
    }).toList();
  }

  @override
  Future<ChildModel?> getChildById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final oldChildren = MockService.getChildren();
    try {
      final oldChild = oldChildren.firstWhere((child) => child.id == id);
      return ChildModel(
        id: oldChild.id,
        firstName: oldChild.firstName,
        lastName: oldChild.lastName,
        classe: oldChild.classe,
        age: oldChild.age,
        avatar: oldChild.avatar,
        notes: oldChild.notes,
        absences: oldChild.absences,
        bulletins: oldChild.bulletins,
      );
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<AppNotificationModel>> getNotifications() async {
    await Future.delayed(const Duration(milliseconds: 400));
    return MockService.getNotifications();
  }

  @override
  Future<void> markNotificationAsRead(String notificationId) async {
    await Future.delayed(const Duration(milliseconds: 200));
    // Dans un vrai repo, on ferait un appel API
  }
}

