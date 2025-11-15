enum AbsenceType { present, absent, late }

class AbsenceModel {
  final String id;
  final AbsenceType type;
  final DateTime date;
  final String reason;

  AbsenceModel({
    required this.id,
    required this.type,
    required this.date,
    this.reason = '',
  });
}
