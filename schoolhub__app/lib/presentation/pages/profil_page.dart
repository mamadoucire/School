import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../providers/auth_provider.dart';
import '../../core/constants.dart';
import '../../core/gradients.dart';

class ProfilPage extends ConsumerWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    final user = authState.user;

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: AppGradients.darkHeaderGradient,
          ),
        ),
        title: Text(
          'Profil',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 48,
              backgroundColor: AppColors.accent,
              child: Icon(
                Icons.person,
                size: 48,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              user?.fullName ?? 'Parent',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Parent',
              style: GoogleFonts.poppins(
                color: AppColors.greyText,
              ),
            ),
            if (user != null) ...[
              const SizedBox(height: 8),
              Text(
                user.email,
                style: GoogleFonts.poppins(
                  color: AppColors.greyText,
                ),
              ),
              if (user.phone.isNotEmpty) ...[
                const SizedBox(height: 4),
                Text(
                  user.phone,
                  style: GoogleFonts.poppins(
                    color: AppColors.greyText,
                  ),
                ),
              ],
            ],
            const SizedBox(height: 32),
            Card(
              child: ListTile(
                leading: Icon(Icons.logout, color: AppColors.error),
                title: Text(
                  'Se déconnecter',
                  style: GoogleFonts.poppins(
                    color: AppColors.error,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  ref.read(authStateProvider.notifier).logout();
                  context.go(AppRoutes.login);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

