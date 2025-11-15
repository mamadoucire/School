class NoteModel {
  final String id;
  final String subject;
  final double value; // out of 20
  final int coef;
  final DateTime date;

  NoteModel({
    required this.id,
    required this.subject,
    required this.value,
    required this.coef,
    required this.date,
  });
}
