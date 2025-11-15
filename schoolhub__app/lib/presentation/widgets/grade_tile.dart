import 'package:flutter/material.dart';
import '../../data/models/grade_model.dart';
import '../../core/constants.dart';

class GradeTile extends StatelessWidget {
  final GradeModel grade;

  const GradeTile({super.key, required this.grade});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.accent,
          child: Text(
            grade.value.toStringAsFixed(1),
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(grade.subject),
        subtitle: Text('Coefficient: ${grade.coef}'),
        trailing: Text(
          '${grade.value.toStringAsFixed(1)}/20',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}

