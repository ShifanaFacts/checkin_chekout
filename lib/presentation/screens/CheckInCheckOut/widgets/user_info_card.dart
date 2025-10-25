import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
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
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = context.read<LoggedUserHandleBloc>().state;
      if (state.loggedUserModel == null) {
        context.read<LoggedUserHandleBloc>().add(
          GetLoggedUserDetails(lat: widget.latitude, long: widget.longitude),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoggedUserHandleBloc, LoggedUserHandleState>(
      builder: (context, state) {
        state.failure?.maybeWhen(
          authFailure: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
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
        return AnimatedContainer(
          key: const ValueKey('userInfoCard'),
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Card(
            elevation: 10,
            shadowColor: Colors.black.withOpacity(0.2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(255, 41, 129, 205),
                    const Color.fromARGB(255, 152, 62, 225),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                  width: 1.5,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: _buildContent(context, state),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context, LoggedUserHandleState state) {
    const String unknown = 'Unknown';

    if (state.isUserLoading) {
      return const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          strokeWidth: 3,
        ),
      );
    }

    if (state.isError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Failed to load user data',
              style: GoogleFonts.poppins(
                color: Colors.redAccent.shade100,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.read<LoggedUserHandleBloc>().add(
                  GetLoggedUserDetails(
                    lat: widget.latitude,
                    long: widget.longitude,
                  ),
                );
              },
              child: Text('Retry', style: GoogleFonts.poppins(fontSize: 14)),
            ),
          ],
        ),
      );
    }

    if (!state.dataFetched || state.loggedUserModel == null) {
      return Center(
        child: Text(
          'No user data available',
          style: GoogleFonts.poppins(
            color: Colors.white70,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }

    final user = state.loggedUserModel!;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.Emp_Name ?? "",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                user.Department ?? "",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                user.Designation ?? "",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              _buildInfoRow(icon: Icons.badge, text: user.Division ?? ""),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow({required IconData icon, required String text}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.white70),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
