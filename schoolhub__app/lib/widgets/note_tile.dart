import 'package:flutter/material.dart';
import '../models/note.dart';

class NoteTile extends StatelessWidget {
  final NoteModel note;

  const NoteTile({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title:
            Text(note.subject, style: TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(
            '${note.coef} • ${note.date.day}/${note.date.month}/${note.date.year}'),
        trailing: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.green.shade50,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text('${note.value.toStringAsFixed(0)}/20',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.green.shade800)),
        ),
      ),
    );
  }
}
