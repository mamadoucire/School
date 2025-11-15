import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/home_viewmodel.dart';
import '../models/app_notification.dart';

class NotificationsPage extends StatelessWidget {
  static const routeName = '/notifications';
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeViewModel>(context);
    final notes = vm.notifications;
    return Scaffold(
      appBar: AppBar(title: Text('Notifications')),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (ctx, i) {
            final AppNotificationModel n = notes[i];
            return Card(
              child: ListTile(
                leading: Icon(Icons.notifications),
                title: Text(n.title,
                    style: TextStyle(fontWeight: FontWeight.w700)),
                subtitle: Text(n.body),
                trailing: Text('${n.date.day}/${n.date.month}'),
              ),
            );
          },
        ),
      ),
    );
  }
}
