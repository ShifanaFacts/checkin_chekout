import 'dart:developer';

import 'package:checkin_checkout/presentation/blocs/userCheckinCheckout/user_checkin_checkout_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:checkin_checkout/data/models/dashboard_model/dashboard_model.dart';
import 'package:checkin_checkout/data/models/dropDown_model/dropdown_model.dart';
import 'package:checkin_checkout/presentation/blocs/loggedUserHandles/logged_user_handle_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DropdownSection extends StatefulWidget {
  final double latitude;
  final double longitude;

  const DropdownSection({
    super.key,
    required this.latitude,
    required this.longitude,
  });

  @override
  State<DropdownSection> createState() => _DropdownSectionState();
}

class _DropdownSectionState extends State<DropdownSection> {
  Map<String, String?> selectedValues = {};
  bool isCheckedIn = false;
  String currentStatus = "Not Checked-In";
  String checkInTime = "";
  bool get canCheckIn => !isCheckedIn;
  bool _hasFetchedDropdowns =
      false; // Flag to prevent multiple dropdown fetches

  @override
  void initState() {
    super.initState();

    // Trigger dashboard data fetch and schedule dropdown data fetch
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = context.read<LoggedUserHandleBloc>().state;
      if (!state.dataFetched || state.dashboardModel == null) {
        context.read<LoggedUserHandleBloc>().add(const GetDashboardList());
      } else if (state.dataFetched &&
          state.dashboardModel != null &&
          !_hasFetchedDropdowns) {
        // Fetch dropdown data for onload == 1 items if dashboard data is already available
        _fetchInitialDropdownData(state.dashboardModel!);
      }
    });
  }

  void _fetchInitialDropdownData(DashboardModel dashboardModel) {
    if (_hasFetchedDropdowns) return; // Prevent multiple fetches
    setState(() {
      _hasFetchedDropdowns = true;
    });

    final dashboardItems = dashboardModel.jsonResult ?? [];
    for (var item in dashboardItems) {
      final int? onload = item.loadOnClick;
      if (onload == 1) {
        fetchDropdownData(item.key, item.description);
      }
    }
  }

  void fetchDropdownData(String? key, String? description) {
    if (key != null) {
      context.read<LoggedUserHandleBloc>().add(
        GetDropDownData(
          strDocType: key,
          description: description,
          lat: widget.latitude,
          long: widget.longitude,
        ),
      );
    }
  }

  void _reloadDashboardData() {
    setState(() {
      _hasFetchedDropdowns = false; // Allow dropdowns to be refetched
    });
    context.read<LoggedUserHandleBloc>().add(const GetDashboardList());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoggedUserHandleBloc, LoggedUserHandleState>(
      listenWhen: (previous, current) =>
          previous.dataFetched != current.dataFetched ||
          previous.dashboardModel != current.dashboardModel ||
          previous.failure != current.failure,
      listener: (context, state) {
        // Handle auth failure
        state.failure?.maybeWhen(
          authFailure: () async {
            try {
              final prefs = await SharedPreferences.getInstance();
              await prefs.clear();
              await prefs.setBool('isLoggedIn', false);
              if (context.mounted) {
                Navigator.of(
                  context,
                ).pushNamedAndRemoveUntil('/login', (route) => false);
              }
            } catch (e) {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Error during logout: $e'),
                    backgroundColor: Colors.red,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }
            }
          },
          orElse: () {},
        );

        // Fetch dropdown data when dashboard data is loaded, only if not already fetched
        if (state.dataFetched &&
            state.dashboardModel != null &&
            !_hasFetchedDropdowns) {
          _fetchInitialDropdownData(state.dashboardModel!);
        }
      },
      builder: (context, state) {
        if (state.isDashboardLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.isError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Error: ${state.failure?.toString() ?? "Unknown error"}',
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _reloadDashboardData,
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
          );
        } else if (state.dataFetched && state.dashboardModel != null) {
          final dashboardItems = state.dashboardModel!.jsonResult ?? [];

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ...dashboardItems.map((item) {
                  final String dropdownName =
                      item.description ?? item.key ?? 'Unknown';
                  final String? key = item.key;
                  final int? onload = item.loadOnClick;
                  if (key == null) {
                    return const SizedBox.shrink();
                  }

                  // Get dropdown items directly from state
                  final List<DropdownItem> dropitems =
                      state.dropdownModel?.dropdownsByDescription?[key] ?? [];

                  // Hide onload == 0 dropdowns until data is available
                  if (onload == 0 && dropitems.isEmpty) {
                    return const SizedBox.shrink();
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dropdownName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Stack(
                          children: [
                            DropdownButton<String>(
                              value: selectedValues[key],
                              isExpanded: true,
                              hint: Text(
                                dropitems.isEmpty
                                    ? 'Loading or no data available'
                                    : 'Select $dropdownName',
                              ),
                              items: dropitems.map((item) {
                                return DropdownMenuItem<String>(
                                  value: item.code,
                                  child: Text(item.description ?? ""),
                                );
                              }).toList(),
                              onChanged: dropitems.isNotEmpty
                                  ? (newValue) {
                                      setState(() {
                                        selectedValues[key] = newValue;
                                      });

                                      // Fetch dependent data for the selected value
                                      if (item.loadOnClick == 1) {
                                        final List<DropdownItem>
                                        currentDropItems =
                                            state
                                                .dropdownModel
                                                ?.dropdownsByDescription?[key] ??
                                            [];

                                        context
                                            .read<LoggedUserHandleBloc>()
                                            .add(
                                              GetDropDownData(
                                                strDocType: key,
                                                description: newValue,
                                                lat: widget.latitude,
                                                long: widget.longitude,
                                              ),
                                            );

                                        // Check for childList to trigger onload == 0 fetches
                                        DropdownItem? selectedItem;
                                        for (var item in currentDropItems) {
                                          if (item.code == newValue) {
                                            selectedItem = item;
                                            break;
                                          }
                                        }

                                        if (selectedItem?.childList != null &&
                                            selectedItem!
                                                .childList!
                                                .isNotEmpty) {
                                          final loggedBlocState = context
                                              .read<LoggedUserHandleBloc>()
                                              .state;
                                          final dashboardItemsList =
                                              loggedBlocState
                                                  .dashboardModel
                                                  ?.jsonResult ??
                                              [];
                                          for (var dashboardItem
                                              in dashboardItemsList) {
                                            final int? onload =
                                                dashboardItem.loadOnClick;
                                            if (onload == 0) {
                                              final childKey =
                                                  dashboardItem.key;
                                              final childDropItems =
                                                  state
                                                      .dropdownModel
                                                      ?.dropdownsByDescription?[childKey] ??
                                                  [];

                                              // Fetch using parent's selected value for filtering
                                              fetchDropdownData(
                                                dashboardItem.key,
                                                newValue,
                                              );
                                            }
                                          }
                                        }
                                      }
                                    }
                                  : null,
                            ),
                            if (state.isDropdownLoading &&
                                (state
                                        .dropdownModel
                                        ?.dropdownsByDescription?[key]
                                        ?.isEmpty ??
                                    true))
                              const Positioned(
                                right: 0,
                                top: 0,
                                bottom: 0,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed:
                      selectedValues.isNotEmpty &&
                          selectedValues.values.every((value) => value != null)
                      ? handleCheckIn
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Check-In",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          );
        }

        // No dashboard data available, show reload option
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'No dashboard data available',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _reloadDashboardData,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Reload Dashboard',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void handleCheckIn() {
    final formattedTime = DateFormat(
      'yyyy-MM-dd HH:mm:ss',
    ).format(DateTime.now());
    final selectedData = selectedValues.map(
      (key, value) => MapEntry(key, value ?? ''),
    );

    context.read<UserCheckinCheckoutBloc>().add(
      GetCheckinData(
        lat: widget.latitude,
        long: widget.longitude,
        dropDownSelectionObject: selectedData,
        checkinTime: formattedTime,
      ),
    );
  }
}
