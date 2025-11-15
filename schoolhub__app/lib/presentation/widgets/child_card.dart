import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/models/child_model.dart';
import '../../core/constants.dart';
import '../../models/absence.dart';

class ChildCard extends StatelessWidget {
  final ChildModel child;
  final void Function()? onTap;

  const ChildCard({super.key, required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    // Calcul du pourcentage de présence (simplifié)
    final totalDays = 30; // Exemple
    final absentCount = child.absences.where((a) => a.type == AbsenceType.absent).length;
    final presentDays = totalDays - absentCount;
    final presencePercent = totalDays > 0 ? ((presentDays / totalDays) * 100).round() : 100;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Avatar dans un cercle violet
              Hero(
                tag: 'avatar_${child.id}',
                child: CircleAvatar(
                  radius: 32,
                  backgroundColor: AppColors.purple,
                  child: Text(
                    child.firstName[0],
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      child.fullName,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${child.classe} • ${child.age} ans',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.greyText,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Statistiques horizontales
                    Row(
                      children: [
                        _buildStatItem(
                          '${child.average.toStringAsFixed(1)}',
                          'Moyenne',
                        ),
                        const SizedBox(width: 16),
                        _buildStatItem(
                          '$presencePercent%',
                          'Présence',
                        ),
                        const SizedBox(width: 16),
                        _buildStatItem(
                          '${child.notes.length}',
                          'Notes',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.greyText,
          ),
        ),
      ],
    );
  }
}

