import 'dart:developer';
import 'dart:async';

import 'package:checkin_checkout/presentation/blocs/loggedUserHandles/logged_user_handle_bloc.dart';
import 'package:checkin_checkout/presentation/blocs/userCheckinCheckout/user_checkin_checkout_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/user_info_card.dart';
import 'widgets/time_display.dart';
import 'widgets/dropdown_section.dart';
import 'widgets/checkin_details_card.dart';

enum LocationStatus { insideRadius, outsideRadius, inaccessible }

class CheckinCheckout extends StatefulWidget {
  const CheckinCheckout({super.key});

  @override
  CheckinCheckoutState createState() => CheckinCheckoutState();
}

class CheckinCheckoutState extends State<CheckinCheckout>
    with WidgetsBindingObserver {
  bool isCheckedIn = false;
  String currentStatus = "Not Checked-In";
  String? checkInTime;

  LatLng? currentLocation;
  String? currentAddress;
  String? errorMessage;
  StreamSubscription<Position>? _positionStreamSubscription;

  @override
  void initState() {
    super.initState();
    final bloc = context.read<UserCheckinCheckoutBloc>();
    final currentState = bloc.state;

    if (currentState.checkinmodel == null) {
      bloc.add(
        GetCheckInDetails(
          checkinTime: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
        ),
      );
    }

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _positionStreamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: BlocBuilder<UserCheckinCheckoutBloc, UserCheckinCheckoutState>(
        builder: (context, state) {
          // ────── AUTH FAILURE ──────
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

          // if (state.isLoading) {
          //   return const Center(child: CircularProgressIndicator());
          // }

          if (state.isError) {
            return Center(
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: 56,
                        color: Colors.redAccent,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "Something went wrong",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "An error occurred while processing your request.",
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: () {
                          context.read<UserCheckinCheckoutBloc>().add(
                            GetCheckInDetails(
                              checkinTime: DateFormat(
                                'yyyy-MM-dd HH:mm:ss',
                              ).format(DateTime.now()),
                            ),
                          );
                        },
                        icon: const Icon(Icons.refresh),
                        label: const Text("Retry"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }

          // ────── MAIN UI ──────
          return Stack(
            children: [
              // ─── USER INFO CARD (full-width, curved bottom) ───
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    UserInfoCard(
                      latitude: currentLocation?.latitude ?? 0.0,
                      longitude: currentLocation?.longitude ?? 0.0,
                    ),
                    // const TimeDisplay(),
                  ],
                ),
              ),

              // ─── SCROLLABLE CONTENT (starts under the curved card) ───
              Positioned(
                top: 310, // <-- adjust if card height changes
                left: 0,
                right: 0,
                bottom: 0,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),

                      // ─── TIME DISPLAY ───

                      // ─── CHECK-IN / CHECK-OUT SECTION ───
                      if (state.checkinViewmodel != null &&
                          state.checkinViewmodel!.checkintime != null)
                        _buildCheckOutSection(state)
                      else
                        _buildCheckInSection(state),

                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // ────── CHECK-OUT UI ──────
  Widget _buildCheckOutSection(UserCheckinCheckoutState state) {
    return Column(
      children: [
        CheckinDetailsCard(
          latitude: currentLocation?.latitude ?? 0.0,
          longitude: currentLocation?.longitude ?? 0.0,
          checkinViewModel: state.checkinViewmodel!,
        ),
      ],
    );
  }

  // ────── CHECK-IN UI ──────
  Widget _buildCheckInSection(UserCheckinCheckoutState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Description (if any)
        if ((state.checkinmodel?.description ?? '').isNotEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.redAccent.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              state.checkinmodel!.description!,
              style: GoogleFonts.poppins(
                color: Colors.redAccent,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),

        // Dropdown + other check-in widgets
        DropdownSection(
          latitude: currentLocation?.latitude ?? 0.0,
          longitude: currentLocation?.longitude ?? 0.0,
          dropdownDefaultModelValue: state.checkinViewmodel,
        ),
      ],
    );
  }
}
