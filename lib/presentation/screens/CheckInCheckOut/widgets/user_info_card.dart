import 'dart:developer';

import 'package:checkin_checkout/core/utils/base_url_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart'; // <-- NEW
import 'package:checkin_checkout/data/models/logged_user_data_mode.dart/loggedUser_data_model.dart';
import 'package:checkin_checkout/presentation/blocs/loggedUserHandles/logged_user_handle_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInfoCard extends StatefulWidget {
  final double latitude;
  final double longitude;

  const UserInfoCard({
    super.key,
    required this.latitude,
    required this.longitude,
  });

  @override
  _UserInfoCardState createState() => _UserInfoCardState();
}

class _UserInfoCardState extends State<UserInfoCard> {
  String? baseUrl;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<LoggedUserHandleBloc>().add(GetLoggedUserDetails());
      baseUrl = await BaseUrlService.getBaseUrl();
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoggedUserHandleBloc, LoggedUserHandleState>(
      builder: (context, state) {
        // ── AUTH FAILURE ──
        state.failure?.maybeWhen(
          authFailure: () async {
            final prefs = await SharedPreferences.getInstance();
            await prefs.clear();
            await prefs.setBool('isLoggedIn', false);
            if (context.mounted) {
              Navigator.of(
                context,
              ).pushNamedAndRemoveUntil('/login', (route) => false);
            }
          },
          orElse: () {},
        );

        return ClipPath(
          clipper: _CurvedBottomClipper(),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            height: 240,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 41, 129, 205),
                  Color.fromARGB(255, 152, 62, 225),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 40, 24, 32),
              child: _buildContent(state),
            ),
          ),
        );
      },
    );
  }

  // ──────────────────────── CONTENT ────────────────────────
  Widget _buildContent(LoggedUserHandleState state) {
    // ── SKELETON ──
    if (state.isUserLoading) {
      return const _SkeletonUserCard();
    }

    // ── ERROR ──
    if (state.isError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Failed to load user data',
              style: GoogleFonts.poppins(
                color: Colors.redAccent.shade100,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => context.read<LoggedUserHandleBloc>().add(
                GetLoggedUserDetails(),
              ),
              child: Text(
                'Retry',
                style: GoogleFonts.poppins(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white24,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      );
    }

    // ── NO DATA ──
    if (!state.dataFetched || state.loggedUserModel == null) {
      return Center(
        child: Text(
          'No user data',
          style: GoogleFonts.poppins(color: Colors.white70, fontSize: 15),
        ),
      );
    }

    // ── SUCCESS ──
    final user = state.loggedUserModel!;
    return Row(
      children: [
        // Avatar
        CircleAvatar(
          radius: 36,
          backgroundColor: Colors.white24,
          child: user.Employe_id != ""
              ? ClipOval(
                  child: Image.network(
                    '$baseUrl/api/image/2786/emp/${user.Employe_id}?width=150&height=150',
                    width: 72,
                    height: 72,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.person,
                      size: 48,
                      color: Colors.white70,
                    ),
                  ),
                )
              : const Icon(Icons.person, size: 48, color: Colors.white70),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                user.Emp_Name ?? '',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                maxLines: null,
              ),
              const SizedBox(height: 4),
              Text(
                user.Department ?? '',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                user.Designation ?? '',
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 12),
              _infoChip(icon: Icons.badge, text: user.Division ?? ''),
            ],
          ),
        ),
      ],
    );
  }

  // ── CHIP ──
  Widget _infoChip({required IconData icon, required String text}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: Colors.white70),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

// ──────────────────────── SKELETON ────────────────────────
class _SkeletonUserCard extends StatelessWidget {
  const _SkeletonUserCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // You can swap Shimmer with a plain AnimatedContainer if you don’t want the package
    return Shimmer.fromColors(
      baseColor: Colors.white24,
      highlightColor: Colors.white54,
      period: const Duration(milliseconds: 1200),
      child: Row(
        children: [
          // Avatar skeleton
          CircleAvatar(radius: 36, backgroundColor: Colors.white24),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Name
                _skeletonLine(width: 140, height: 20),
                const SizedBox(height: 8),
                // Department
                _skeletonLine(width: 110, height: 18),
                const SizedBox(height: 8),
                // Designation
                _skeletonLine(width: 90, height: 16),
                const SizedBox(height: 16),
                // Chip
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.badge, size: 18, color: Colors.white70),
                      const SizedBox(width: 6),
                      _skeletonLine(width: 70, height: 14),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _skeletonLine({required double width, required double height}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

// ────── CURVED BOTTOM CLIPPER ──────
class _CurvedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 40);
    final firstControl = Offset(size.width * 0.25, size.height);
    final firstEnd = Offset(size.width * 0.5, size.height - 30);
    final secondControl = Offset(size.width * 0.75, size.height - 70);
    final secondEnd = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(
      firstControl.dx,
      firstControl.dy,
      firstEnd.dx,
      firstEnd.dy,
    );
    path.quadraticBezierTo(
      secondControl.dx,
      secondControl.dy,
      secondEnd.dx,
      secondEnd.dy,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
