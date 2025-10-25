import 'package:checkin_checkout/presentation/blocs/loggedUserHandles/logged_user_handle_bloc.dart';
import 'package:checkin_checkout/presentation/blocs/userCheckinCheckout/user_checkin_checkout_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:math';
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
    // context.read<UserCheckinCheckoutBloc>().add(
    //   GetCheckInDetails(
    //     lat: currentLocation?.latitude ?? 0.0,
    //     long: currentLocation?.longitude ?? 0.0,
    //     checkinTime: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
    //   ),
    // );
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
      body: BlocBuilder<UserCheckinCheckoutBloc, UserCheckinCheckoutState>(
        builder: (context, state) {
          // Handle auth failure
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

          // Loading state
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // Error state with retry option
          if (state.isError) {
            return Center(
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: 48,
                        color: Colors.red,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Something went wrong",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "An error occurred while processing your request.",
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Retry check-in details
                          context.read<UserCheckinCheckoutBloc>().add(
                            GetCheckInDetails(
                              lat: currentLocation?.latitude ?? 0.0,
                              long: currentLocation?.longitude ?? 0.0,
                              checkinTime: DateFormat(
                                'yyyy-MM-dd HH:mm:ss',
                              ).format(DateTime.now()),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Retry',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          // Check-in model status handling

          // Default UI
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 50),
                UserInfoCard(
                  latitude: currentLocation?.latitude ?? 0.0,
                  longitude: currentLocation?.longitude ?? 0.0,
                ),
                const SizedBox(height: 10),
                const TimeDisplay(),
                const SizedBox(height: 10),

                if (state.checkinViewmodel != null)
                  Column(
                    children: [
                      if (state.checkinViewmodel != null)
                        CheckinDetailsCard(
                          latitude: currentLocation?.latitude ?? 0.0,
                          longitude: currentLocation?.longitude ?? 0.0,
                          checkinViewModel: state.checkinViewmodel!,
                        ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          context.read<UserCheckinCheckoutBloc>().add(
                            GetCheckOutData(
                              lat: currentLocation?.latitude ?? 0.0,
                              long: currentLocation?.longitude ?? 0.0,
                              checkinTime: DateFormat(
                                'yyyy-MM-dd HH:mm:ss',
                              ).format(DateTime.now()),
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("✅ Check-out successful!"),
                              backgroundColor: Colors.green,
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "Check-Out",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ],
                  )
                else
                  Column(
                    children: [
                      // Assumed user card or other widgets above
                      if ((state.checkinmodel?.description ?? '').isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          child: Text(
                            state.checkinmodel!.description ?? "",
                            style: const TextStyle(
                              color: Colors.redAccent,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      DropdownSection(
                        latitude: currentLocation?.latitude ?? 0.0,
                        longitude: currentLocation?.longitude ?? 0.0,
                      ),
                    ],
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
