import 'package:flutter/foundation.dart';
import 'note.dart';
import 'absence.dart';
import 'bulletin.dart';

class ChildModel {
  final String id;
  final String firstName;
  final String lastName;
  final String classe;
  final int age;
  final String avatar; // asset path or network
  final List<NoteModel> notes;
  final List<AbsenceModel> absences;
  final List<BulletinModel> bulletins;

  ChildModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.classe,
    required this.age,
    required this.avatar,
    required this.notes,
    required this.absences,
    required this.bulletins,
  });

  String get fullName => '$firstName $lastName';

  double get average {
    if (notes.isEmpty) return 0;
    double sum = 0;
    double totalCoef = 0;
    for (final n in notes) {
      sum += n.value * n.coef;
      totalCoef += n.coef;
    }
    return totalCoef == 0 ? 0 : sum / totalCoef;
  }
}
