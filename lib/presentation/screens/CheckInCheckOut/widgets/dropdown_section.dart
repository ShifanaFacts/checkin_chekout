import 'dart:async';
import 'dart:developer';

import 'package:checkin_checkout/data/models/checkin_checkout_model/checkin_view_model.dart';
import 'package:checkin_checkout/data/models/dashboard_model/dashboard_model.dart';
import 'package:checkin_checkout/data/models/dropDown_model/dropdown_model.dart';
import 'package:checkin_checkout/presentation/blocs/loggedUserHandles/logged_user_handle_bloc.dart';
import 'package:checkin_checkout/presentation/blocs/userCheckinCheckout/user_checkin_checkout_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DropdownSection extends StatefulWidget {
  final double latitude;
  final double longitude;
  final CheckinVieModel? dropdownDefaultModelValue;

  const DropdownSection({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.dropdownDefaultModelValue,
  });

  @override
  State<DropdownSection> createState() => _DropdownSectionState();
}

class _DropdownSectionState extends State<DropdownSection>
    with TickerProviderStateMixin {
  Map<String, String?> selectedValues = {};
  bool _hasFetchedDropdowns = false;
  bool _isLocationEnabled = false;
  bool _hasLocationPermission = false;

  // Fixed: Initialize here in constructor (before build)
  late final AnimationController _fadeController;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize AnimationController safely
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    );
    _fadeController.forward();

    _checkLocationStatus();
    _scheduleInitialData();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  void _scheduleInitialData() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = context.read<LoggedUserHandleBloc>().state;
      if (!state.dataFetched || state.dashboardModel == null) {
        context.read<LoggedUserHandleBloc>().add(const GetDashboardList());
      } else if (!_hasFetchedDropdowns) {
        _fetchInitialDropdownData(state.dashboardModel!);
      }

      Timer(const Duration(milliseconds: 800), () {
        if (!mounted) return;
        _triggerDependentDropdowns();
      });
    });
  }

  void _fetchInitialDropdownData(DashboardModel dashboardModel) {
    if (_hasFetchedDropdowns) return;
    setState(() => _hasFetchedDropdowns = true);

    final items = dashboardModel.jsonResult ?? [];
    for (var item in items) {
      if (item.loadOnClick == 1 && item.key != null) {
        fetchDropdownData(item.key, item.description);
      }
    }
  }

  void _triggerDependentDropdowns() {
    final state = context.read<LoggedUserHandleBloc>().state;
    if (!state.dataFetched || state.dashboardModel == null) return;

    final items = state.dashboardModel!.jsonResult ?? [];
    for (var item in items) {
      if (item.depend == 1 && item.key != null) {
        final newValue =
            selectedValues[item.key] ??
            state
                .dropdownModel
                ?.dropdownsByDescription?[item.key]
                ?.firstOrNull
                ?.code;
        if (newValue != null) {
          _fetchChildrenFor(item.key!, newValue);
        }
      }
    }
  }

  void _fetchChildrenFor(String parentKey, String parentValue) {
    final state = context.read<LoggedUserHandleBloc>().state;
    final currentItems =
        state.dropdownModel?.dropdownsByDescription?[parentKey] ?? [];
    final selectedItem = currentItems.cast<DropdownItem?>().firstWhere(
      (i) => i?.code == parentValue,
      orElse: () => null,
    );

    if (selectedItem?.childList == null || selectedItem!.childList!.isEmpty)
      return;

    final dashboardItems = state.dashboardModel?.jsonResult ?? [];
    for (var dashItem in dashboardItems) {
      if (dashItem.depend == 0 && dashItem.key != null) {
        fetchDropdownData(dashItem.key, parentValue);
        setState(() => selectedValues[dashItem.key!] = null);
      }
    }
  }

  void fetchDropdownData(String? key, String? description) {
    if (key == null) return;
    context.read<LoggedUserHandleBloc>().add(
      GetDropDownData(strDocType: key, description: description),
    );
  }

  Future<bool> _checkLocationStatus() async {
    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        await _showEnableLocationDialog();
        return false;
      }

      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          _showSnackBar('Location permission denied.');
          return false;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        await _showPermissionDeniedDialog();
        return false;
      }

      setState(() {
        _isLocationEnabled = serviceEnabled;
        _hasLocationPermission =
            permission == LocationPermission.always ||
            permission == LocationPermission.whileInUse;
      });
      return true;
    } catch (e) {
      _showSnackBar('Location error: $e');
      return false;
    }
  }

  void _showSnackBar(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  Future<void> _showEnableLocationDialog() => showDialog(
    context: context,
    builder: (_) => _buildLocationDialog(
      title: 'Enable Location',
      content: 'Please turn on location services to check-in.',
      actionText: 'Open Settings',
      onAction: Geolocator.openLocationSettings,
    ),
  );

  Future<void> _showPermissionDeniedDialog() => showDialog(
    context: context,
    builder: (_) => _buildLocationDialog(
      title: 'Permission Required',
      content: 'Location access is permanently denied. Enable in app settings.',
      actionText: 'Open Settings',
      onAction: Geolocator.openAppSettings,
    ),
  );

  Widget _buildLocationDialog({
    required String title,
    required String content,
    required String actionText,
    required VoidCallback onAction,
  }) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(
        title,
        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
      ),
      content: Text(content, style: GoogleFonts.poppins()),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            onAction();
            Future.delayed(const Duration(seconds: 1), _checkLocationStatus);
          },
          child: Text(actionText),
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> _buildDropdownItems(List<DropdownItem> items) {
    final seen = <String>{};
    return items
        .where((i) => i.code != null && seen.add(i.code!))
        .map(
          (i) => DropdownMenuItem(
            value: i.code,
            child: Text(i.description ?? '—', style: GoogleFonts.poppins()),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Card(
          elevation: 8,
          shadowColor: Colors.black.withOpacity(0.15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [Colors.white, Colors.grey[50]!],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            padding: const EdgeInsets.fromLTRB(20, 28, 20, 32),
            child: BlocConsumer<LoggedUserHandleBloc, LoggedUserHandleState>(
              listenWhen: (p, c) =>
                  p.dataFetched != c.dataFetched ||
                  p.dropdownModel != c.dropdownModel ||
                  p.failure != c.failure,
              listener: (context, state) {
                state.failure?.maybeWhen(
                  authFailure: () async {
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.clear();
                    await prefs.setBool('isLoggedIn', false);
                    if (context.mounted) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/login',
                        (r) => false,
                      );
                    }
                  },
                  orElse: () {},
                );

                if (state.dataFetched && !_hasFetchedDropdowns) {
                  _fetchInitialDropdownData(state.dashboardModel!);
                }

                if (state.dropdownModel != null) {
                  final map = state.dropdownModel!.dropdownsByDescription ?? {};
                  map.forEach((key, items) {
                    if (items.isEmpty) return;
                    if (selectedValues[key] == null) {
                      setState(() => selectedValues[key] = items.first.code);
                    } else if (!items.any(
                      (i) => i.code == selectedValues[key],
                    )) {
                      setState(() => selectedValues[key] = items.first.code);
                    }
                  });
                }
              },
              builder: (context, state) {
                if (state.isDashboardLoading) {
                  return _buildShimmer();
                }

                if (state.isError) {
                  return _buildErrorState();
                }

                if (!state.dataFetched || state.dashboardModel == null) {
                  return _buildEmptyState();
                }

                final items = state.dashboardModel!.jsonResult ?? [];
                final validItems = items.where((i) => i.key != null).toList();

                return Column(
                  children: [
                    ...validItems.map(
                      (item) => _buildDropdownField(item, state),
                    ),
                    const SizedBox(height: 24),
                    _buildCheckInButton(validItems.length),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(children: List.generate(3, (_) => _shimmerDropdown())),
    );
  }

  Widget _shimmerDropdown() => Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(width: 120, height: 16, color: Colors.white),
        const SizedBox(height: 8),
        Container(height: 56, color: Colors.white),
      ],
    ),
  );

  Widget _buildErrorState() {
    return Center(
      child: Column(
        children: [
          const Icon(Icons.error, size: 48, color: Colors.redAccent),
          const SizedBox(height: 12),
          Text(
            'Failed to load data',
            style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              setState(() => _hasFetchedDropdowns = false);
              context.read<LoggedUserHandleBloc>().add(
                const GetDashboardList(),
              );
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Retry'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        children: [
          Icon(Icons.dashboard, size: 48, color: Colors.grey),
          const SizedBox(height: 12),
          Text('No data available', style: GoogleFonts.poppins()),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              context.read<LoggedUserHandleBloc>().add(
                const GetDashboardList(),
              );
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Reload'),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField(DashboardItem item, LoggedUserHandleState state) {
    final key = item.key!;
    final items = state.dropdownModel?.dropdownsByDescription?[key] ?? [];
    final isVisible = item.loadOnClick != 0 || items.isNotEmpty;

    if (!isVisible) return const SizedBox.shrink();

    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.description ?? key,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.blueGrey[800],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.blueGrey[200]!),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                value: selectedValues[key],
                hint: Text(
                  'Select an option',
                  style: GoogleFonts.poppins(color: Colors.grey),
                ),
                icon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.blueAccent,
                ),
                dropdownColor: Colors.white,
                borderRadius: BorderRadius.circular(14),
                items: _buildDropdownItems(items),
                onChanged: (value) {
                  setState(() => selectedValues[key] = value);
                  if (item.depend == 1 && value != null) {
                    _fetchChildrenFor(key, value);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckInButton(int total) {
    final allSelected =
        selectedValues.length == total &&
        selectedValues.values.every((v) => v != null);
    final canCheckIn = _isLocationEnabled && _hasLocationPermission;

    return SizedBox(
      width: double.infinity,

      child: ElevatedButton.icon(
        onPressed: canCheckIn ? _handleCheckIn : null,
        icon: const Icon(Icons.login, size: 20),
        label: Text(
          'Check-In Now',
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: canCheckIn
              ? const Color.fromARGB(255, 104, 167, 136)
              : Colors.grey,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: canCheckIn ? 8 : 2,
        ),
      ),
    );
  }

  void _handleCheckIn() {
    _checkLocationStatus().then((valid) {
      if (!valid) return;

      final time = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
      final data = selectedValues.map((k, v) => MapEntry(k, v ?? ''));

      context.read<UserCheckinCheckoutBloc>().add(
        GetCheckinData(dropDownSelectionObject: data, checkinTime: time),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Check-in request sent!'),
          backgroundColor: Colors.green,
        ),
      );
    });
  }
}
