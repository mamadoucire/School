import '../../models/note.dart';
import '../../models/absence.dart';
import '../../models/bulletin.dart';

class ChildModel {
  final String id;
  final String firstName;
  final String lastName;
  final String classe;
  final int age;
  final String avatar;
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

  factory ChildModel.fromJson(Map<String, dynamic> json) {
    return ChildModel(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      classe: json['classe'] as String,
      age: json['age'] as int,
      avatar: json['avatar'] as String,
      notes: (json['notes'] as List<dynamic>?)
              ?.map((e) => NoteModel(
                    id: e['id'] as String,
                    subject: e['subject'] as String,
                    value: (e['value'] as num).toDouble(),
                    coef: e['coef'] as int,
                    date: DateTime.parse(e['date'] as String),
                  ))
              .toList() ??
          [],
      absences: (json['absences'] as List<dynamic>?)
              ?.map((e) => AbsenceModel(
                    id: e['id'] as String,
                    type: AbsenceType.values.firstWhere(
                      (t) => t.toString().split('.').last == e['type'] as String,
                      orElse: () => AbsenceType.present,
                    ),
                    date: DateTime.parse(e['date'] as String),
                    reason: e['reason'] as String? ?? '',
                  ))
              .toList() ??
          [],
      bulletins: (json['bulletins'] as List<dynamic>?)
              ?.map((e) => BulletinModel(
                    id: e['id'] as String,
                    trimester: e['trimester'] as String,
                    subjectAverages: Map<String, double>.from(
                      (e['subjectAverages'] as Map).map(
                        (key, value) => MapEntry(
                            key as String, (value as num).toDouble()),
                      ),
                    ),
                    overallAverage: (e['overallAverage'] as num).toDouble(),
                  ))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'classe': classe,
      'age': age,
      'avatar': avatar,
      'notes': notes.map((e) => {
            'id': e.id,
            'subject': e.subject,
            'value': e.value,
            'coef': e.coef,
            'date': e.date.toIso8601String(),
          }).toList(),
      'absences': absences.map((e) => {
            'id': e.id,
            'type': e.type.toString().split('.').last,
            'date': e.date.toIso8601String(),
            'reason': e.reason,
          }).toList(),
      'bulletins': bulletins.map((e) => {
            'id': e.id,
            'trimester': e.trimester,
            'subjectAverages': e.subjectAverages,
            'overallAverage': e.overallAverage,
          }).toList(),
    };
  }
}
