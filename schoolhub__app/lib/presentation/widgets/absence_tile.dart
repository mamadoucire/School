import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../models/absence.dart';
import '../../core/constants.dart';

class AbsenceTile extends StatelessWidget {
  final AbsenceModel absence;

  const AbsenceTile({super.key, required this.absence});

  @override
  Widget build(BuildContext context) {
    IconData icon;
    Color color;
    String label;

    switch (absence.type) {
      case AbsenceType.present:
        icon = Icons.check_circle;
        color = Colors.green;
        label = 'Présent';
        break;
      case AbsenceType.late:
        icon = Icons.schedule;
        color = Colors.orange;
        label = 'Retard';
        break;
      case AbsenceType.absent:
        icon = Icons.cancel;
        color = AppColors.error;
        label = 'Absent';
        break;
    }

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.2),
          child: Icon(icon, color: color),
        ),
        title: Text(
          label,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: absence.reason.isNotEmpty
            ? Text(
                'Motif: ${absence.reason}',
                style: GoogleFonts.poppins(),
              )
            : null,
        trailing: Text(
          DateFormat('dd/MM/yyyy').format(absence.date),
          style: GoogleFonts.poppins(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}

