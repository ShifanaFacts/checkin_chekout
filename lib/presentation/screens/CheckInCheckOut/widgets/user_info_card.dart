import 'dart:developer';

import 'package:checkin_checkout/presentation/blocs/loggedUserHandles/logged_user_handle_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:checkin_checkout/presentation/blocs/userdata/userdata_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class UserInfoCard extends StatelessWidget {
  final double latitude;
  final double longitude;
  const UserInfoCard({
    super.key,
    required this.latitude,
    required this.longitude,
  });

  @override
  Widget build(BuildContext context) {
    log('$latitude $longitude');
    return BlocBuilder<LoggedUserHandleBloc, LoggedUserHandleState>(
      builder: (context, state) {
        // Only dispatch GetUserData if data is not fetched and not loading
        if (!state.dataFetched || state.loggedUserModel == null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.read<LoggedUserHandleBloc>().add(
              GetLoggedUserDetails(lat: latitude, long: longitude),
            );
          });
        }

        return AnimatedContainer(
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
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(255, 48, 130, 202),
                    const Color.fromARGB(255, 212, 130, 226),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.2),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
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
            ),
          ),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context, LoggedUserHandleState state) {
    if (state.isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          strokeWidth: 3,
        ),
      );
    }

    if (state.isError) {
      return Center(
        child: Text(
          'Failed to load user data',
          style: GoogleFonts.poppins(
            color: Colors.redAccent.shade100,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
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
        // _buildAvatar(user),
        // const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.Emp_Name ?? '',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                user.Department ?? '',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                user.Designation ?? '',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              _buildInfoRow(icon: Icons.badge, text: '${user.Division ?? ''}'),
            ],
          ),
        ),
      ],
    );
  }

  // Widget _buildAvatar(dynamic user) {
  //   return Container(
  //     decoration: BoxDecoration(
  //       shape: BoxShape.circle,
  //       gradient: LinearGradient(
  //         colors: [Colors.white, Colors.blue.shade200],
  //         begin: Alignment.topLeft,
  //         end: Alignment.bottomRight,
  //       ),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.black.withOpacity(0.2),
  //           blurRadius: 12,
  //           offset: const Offset(0, 4),
  //         ),
  //       ],
  //     ),
  //     child: CircleAvatar(
  //       radius: 36,
  //       backgroundColor: Colors.transparent,
  //       child: ClipOval(
  //         child:
  //             // user.profileImage != null
  //             //     ? Image.network(
  //             //         user.profileImage!,
  //             //         width: 72,
  //             //         height: 72,
  //             //         fit: BoxFit.cover,
  //             //         errorBuilder: (context, error, stackTrace) =>
  //             //             const Icon(Icons.person, color: Colors.white, size: 40),
  //             //       )
  //             // :
  //             const Icon(Icons.person, color: Colors.white, size: 40),
  //       ),
  //     ),
  //   );
  // }

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
