import 'package:flutter/material.dart';
import '../models/child.dart';
import '../models/app_notification.dart';
import '../services/mock_service.dart';

class HomeViewModel extends ChangeNotifier {
  List<ChildModel> children = [];
  List<AppNotificationModel> notifications = [];

  HomeViewModel() {
    loadInitialData();
  }

  void loadInitialData() {
    children = MockService.getChildren();
    notifications = MockService.getNotifications();
    notifyListeners();
  }

  ChildModel? getChildById(String id) {
    return children.firstWhere((c) => c.id == id, orElse: () => children[0]);
  }
}
