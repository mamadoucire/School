import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../providers/children_provider.dart';
import '../../core/constants.dart';
import '../../core/gradients.dart';
import '../widgets/note_tile.dart';
import '../widgets/absence_tile.dart';

class ChildDetailPage extends ConsumerWidget {
  final String childId;

  const ChildDetailPage({super.key, required this.childId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final childAsync = ref.watch(childProvider(childId));

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: AppGradients.darkHeaderGradient,
          ),
        ),
        title: childAsync.when(
          data: (child) => Text(
            child?.fullName ?? 'Enfant',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          loading: () => Text(
            'Chargement...',
            style: GoogleFonts.poppins(color: Colors.white),
          ),
          error: (_, __) => Text(
            'Erreur',
            style: GoogleFonts.poppins(color: Colors.white),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: childAsync.when(
        data: (child) {
          if (child == null) {
            return Center(
              child: Text(
                'Enfant non trouvé',
                style: GoogleFonts.poppins(),
              ),
            );
          }
          return _buildChildDetail(context, child);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text(
            'Erreur: $error',
            style: GoogleFonts.poppins(),
          ),
        ),
      ),
    );
  }

  Widget _buildChildDetail(BuildContext context, child) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Hero(
            tag: 'avatar_${child.id}',
            child: CircleAvatar(
              radius: 36,
              backgroundColor: AppColors.purple,
              child: Text(
                child.firstName[0],
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '${child.classe} • ${child.age} ans',
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: AppColors.greyText,
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Moyenne générale',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${child.average.toStringAsFixed(1)} / 20',
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => context.push(
                      '${AppRoutes.bulletin}?childId=${child.id}',
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                    ),
                    child: Text(
                      'Voir bulletin',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Notes récentes',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(height: 8),
          ...child.notes.map((n) => NoteTile(note: n)).toList(),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Absences',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(height: 8),
          ...child.absences.map((a) => AbsenceTile(absence: a)).toList(),
        ],
      ),
    );
  }
}

