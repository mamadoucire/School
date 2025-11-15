import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../providers/children_provider.dart';
import '../../core/constants.dart';
import '../../core/gradients.dart';

class BulletinPage extends ConsumerWidget {
  final String? childId;

  const BulletinPage({super.key, this.childId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final childrenAsync = ref.watch(childrenProvider);

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: AppGradients.darkHeaderGradient,
          ),
        ),
        title: Text(
          'Bulletin',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: childrenAsync.when(
        data: (children) {
          final child = childId != null
              ? children.where((c) => c.id == childId).firstOrNull
              : null;

          if (child == null && childId != null) {
            return Center(
              child: Text(
                'Enfant non trouvé',
                style: GoogleFonts.poppins(),
              ),
            );
          }

          if (child == null) {
            return Center(
              child: Text(
                'Sélectionnez un enfant pour voir le bulletin.',
                style: GoogleFonts.poppins(),
              ),
            );
          }

          return _buildBulletins(context, child);
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

  Widget _buildBulletins(BuildContext context, child) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Text(
            'Bulletins de ${child.fullName}',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: child.bulletins.isEmpty
                ? Center(
                    child: Text(
                      'Aucun bulletin disponible',
                      style: GoogleFonts.poppins(),
                    ),
                  )
                : ListView.builder(
                    itemCount: child.bulletins.length,
                    itemBuilder: (ctx, i) {
                      final bulletin = child.bulletins[i];
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Trimestre ${bulletin.trimester}',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 8),
                              ...bulletin.subjectAverages.entries.map(
                                (e) => ListTile(
                                  title: Text(
                                    e.key,
                                    style: GoogleFonts.poppins(),
                                  ),
                                  trailing: Text(
                                    '${e.value.toStringAsFixed(1)}/20',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ),
                              ),
                              const Divider(),
                              Text(
                                'Moyenne générale: ${bulletin.overallAverage.toStringAsFixed(1)}/20',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

