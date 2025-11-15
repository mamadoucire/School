import 'package:flutter/material.dart';
import '../models/child.dart';
import '../core/app_colors.dart';

class ChildCard extends StatelessWidget {
  final ChildModel child;
  final void Function()? onTap;

  const ChildCard({Key? key, required this.child, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 14.0),
          child: Row(
            children: [
              Hero(
                tag: 'avatar_${child.id}',
                child: CircleAvatar(
                  radius: 28,
                  backgroundColor: AppColors.pastelGreen,
                  child: Text(child.firstName[0],
                      style: TextStyle(
                          color: AppColors.darkGreen,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(child.fullName,
                        style: Theme.of(context).textTheme.titleLarge),
                    SizedBox(height: 4),
                    Text('${child.classe} • ${child.age} ans',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.pastelGreen,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text('${child.average.toStringAsFixed(1)} / 20',
                        style: TextStyle(
                            color: AppColors.darkGreen,
                            fontWeight: FontWeight.w700)),
                  ),
                  SizedBox(height: 6),
                  Text('${child.absences.length} abs.',
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
