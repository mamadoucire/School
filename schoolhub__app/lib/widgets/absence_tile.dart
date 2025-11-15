import 'package:flutter/material.dart';
import '../models/absence.dart';

class AbsenceTile extends StatelessWidget {
  final AbsenceModel absence;

  const AbsenceTile({Key? key, required this.absence}) : super(key: key);

  String _label(AbsenceType t) {
    switch (t) {
      case AbsenceType.present:
        return 'Présent';
      case AbsenceType.absent:
        return 'Absent';
      case AbsenceType.late:
        return 'Retard';
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = absence.type == AbsenceType.absent
        ? Colors.red.shade100
        : (absence.type == AbsenceType.late
            ? Colors.orange.shade100
            : Colors.green.shade100);
    return Card(
      child: ListTile(
        leading: CircleAvatar(child: Icon(Icons.calendar_today)),
        title: Text(_label(absence.type),
            style: TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(
            '${absence.date.day}/${absence.date.month}/${absence.date.year} ${absence.reason.isNotEmpty ? '• ${absence.reason}' : ''}'),
        tileColor: color,
      ),
    );
  }
}
