import 'package:flutter/foundation.dart';
import '../models/child.dart';
import '../models/note.dart';
import '../models/absence.dart';
import '../models/bulletin.dart';
import '../models/app_notification.dart';

class MockService {
  // static data
  static List<ChildModel> getChildren() {
    final child1Notes = [
      NoteModel(
          id: 'n1',
          subject: 'Mathématiques',
          value: 16,
          coef: 4,
          date: DateTime(2024, 10, 15)),
      NoteModel(
          id: 'n2',
          subject: 'Français',
          value: 14,
          coef: 3,
          date: DateTime(2024, 10, 12)),
      NoteModel(
          id: 'n3',
          subject: 'Anglais',
          value: 12,
          coef: 2,
          date: DateTime(2024, 10, 10)),
      NoteModel(
          id: 'n4',
          subject: 'Histoire-Géo',
          value: 17,
          coef: 2,
          date: DateTime(2024, 10, 10)),
    ];

    final child1Absences = [
      AbsenceModel(
          id: 'a1', type: AbsenceType.present, date: DateTime(2024, 10, 01)),
      AbsenceModel(
          id: 'a2', type: AbsenceType.late, date: DateTime(2024, 10, 05)),
      AbsenceModel(
          id: 'a3',
          type: AbsenceType.absent,
          date: DateTime(2024, 9, 20),
          reason: 'Malade'),
    ];

    final child1Bulletins = [
      BulletinModel(
          id: 'b1',
          trimester: 'T1',
          subjectAverages: {
            'Mathématiques': 15.5,
            'Français': 14.0,
            'Anglais': 12.0,
          },
          overallAverage: 14.2),
    ];

    final child2Notes = [
      NoteModel(
          id: 'n5',
          subject: 'Mathématiques',
          value: 13,
          coef: 4,
          date: DateTime(2024, 9, 15)),
      NoteModel(
          id: 'n6',
          subject: 'Français',
          value: 12,
          coef: 3,
          date: DateTime(2024, 9, 12)),
    ];

    final child2Absences = [
      AbsenceModel(
          id: 'a4', type: AbsenceType.present, date: DateTime(2024, 10, 03)),
      AbsenceModel(
          id: 'a5', type: AbsenceType.absent, date: DateTime(2024, 9, 22)),
    ];

    return [
      ChildModel(
        id: 'c1',
        firstName: 'Marie',
        lastName: 'Dupont',
        classe: '3ème A',
        age: 14,
        avatar: 'assets/avatar_girl.png',
        notes: child1Notes,
        absences: child1Absences,
        bulletins: child1Bulletins,
      ),
      ChildModel(
        id: 'c2',
        firstName: 'Paul',
        lastName: 'Dupont',
        classe: '6ème B',
        age: 11,
        avatar: 'assets/avatar_boy.png',
        notes: child2Notes,
        absences: child2Absences,
        bulletins: [],
      ),
    ];
  }

  static List<AppNotificationModel> getNotifications() {
    return [
      AppNotificationModel(
        id: 'notif1',
        title: 'Absence signalée',
        body: 'Marie Dupont a été absente le 20/09/2024 (motif : Malade).',
        date: DateTime.now().subtract(Duration(days: 2)),
      ),
      AppNotificationModel(
        id: 'notif2',
        title: 'Nouvelle note',
        body:
            'Une nouvelle note en Mathématiques a été publiée pour Paul Dupont.',
        date: DateTime.now().subtract(Duration(days: 1)),
      ),
    ];
  }
}
