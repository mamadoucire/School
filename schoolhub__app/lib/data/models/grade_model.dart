// Alias pour NoteModel - utilisé pour les bulletins
import '../../models/note.dart';

export '../../models/note.dart';

// GradeModel peut être utilisé pour représenter une note dans un bulletin
class GradeModel {
  final String subject;
  final double value;
  final int coef;
  final DateTime date;

  GradeModel({
    required this.subject,
    required this.value,
    required this.coef,
    required this.date,
  });

  factory GradeModel.fromNoteModel(NoteModel note) {
    return GradeModel(
      subject: note.subject,
      value: note.value,
      coef: note.coef,
      date: note.date,
    );
  }
}

