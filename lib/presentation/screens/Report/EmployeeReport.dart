import 'dart:developer';
import 'package:checkin_checkout/data/models/report_model/report_model.dart';
import 'package:checkin_checkout/presentation/blocs/InOutReport/in_out_report_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmployeeReport extends StatefulWidget {
  @override
  _EmployeeReportState createState() => _EmployeeReportState();
}

class _EmployeeReportState extends State<EmployeeReport> {
  bool isDaily = true;
  DateTimeRange? selectedDateRange; // Changed to DateTimeRange
  DateTime selectedDate = DateTime.now(); // For daily mode
  List<ReportDataModel> currentEntries = [];

  @override
  void initState() {
    super.initState();
    // Initialize with today's date for daily mode
    selectedDateRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now(),
    );
    _fetchReportData();
  }

  String get dateDisplay {
    if (isDaily) {
      return DateFormat('dd-MM-yyyy').format(selectedDate);
    } else {
      final start = selectedDateRange!.start;
      final end = selectedDateRange!.end;
      return '${DateFormat('dd-MM-yyyy').format(start)} to ${DateFormat('dd-MM-yyyy').format(end)}';
    }
  }

  void _fetchReportData() {
    String fmdateStr;
    String todateStr;

    if (isDaily) {
      fmdateStr = DateFormat('yyyy-MM-dd').format(selectedDate);
      todateStr = DateFormat('yyyy-MM-dd').format(selectedDate);
    } else {
      fmdateStr = DateFormat('yyyy-MM-dd').format(selectedDateRange!.start);
      todateStr = DateFormat('yyyy-MM-dd').format(selectedDateRange!.end);
    }

    log('Fetching report: $fmdateStr to $todateStr');

    context.read<InOutReportBloc>().add(
      GetInoutReport(
        ReportType: isDaily ? "Daily" : "Range",
        fmdate: fmdateStr,
        todate: todateStr,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Reports',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 2,
        centerTitle: true,
      ),
      body: BlocBuilder<InOutReportBloc, InOutReportState>(
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

          // Update currentEntries based on state
          currentEntries = state.inOutTimeReport?.reportModel ?? [];

          return Column(
            children: [
              // Toggle buttons
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    _buildToggleButton('Daily', isDaily, true),
                    const SizedBox(width: 8),
                    _buildToggleButton(
                      'Range',
                      !isDaily,
                      false,
                    ), // Changed text
                  ],
                ),
              ),

              // Date/Range selector
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GestureDetector(
                  onTap: () => _selectDateRange(context),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            dateDisplay,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.date_range, // Changed to range icon
                          color: Color(0xFF1DA1F2),
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // History section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: const [
                    Text(
                      'History',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // History items
              Expanded(
                child: state.isLoading
                    ? _buildSkeletonLoader()
                    : state.isError
                    ? _buildErrorWidget()
                    : currentEntries.isEmpty
                    ? _buildEmptyState()
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        itemCount: currentEntries.length,
                        itemBuilder: (context, index) {
                          final entry = currentEntries[index];
                          return _buildHistoryItem(
                            entry.effectivedate,
                            entry.checkInTime,
                            entry.checkOutTime,
                            entry.project,
                            entry.department,
                            entry.activity,
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildToggleButton(String text, bool isSelected, bool setToDaily) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isDaily = setToDaily;
            _fetchReportData();
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF1DA1F2) : Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey[700],
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  // ────────────────────── DATE RANGE PICKER ──────────────────────
  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? picked;

    if (isDaily) {
      // For daily mode, use single date picker
      final DateTime? singleDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime.now(),
        builder: (context, child) => _buildDatePickerTheme(child!),
      );

      if (singleDate != null && singleDate != selectedDate) {
        setState(() {
          selectedDate = singleDate;
          _fetchReportData();
        });
      }
      return;
    } else {
      // For range mode, use range picker
      picked = await showDateRangePicker(
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime.now(),
        initialDateRange: selectedDateRange,
        builder: (context, child) => _buildDatePickerTheme(child!),
      );
    }

    if (picked != null && picked != selectedDateRange) {
      setState(() {
        selectedDateRange = picked;
        _fetchReportData();
      });
    }
  }

  Widget _buildDatePickerTheme(Widget child) {
    return Theme(
      data: ThemeData.light().copyWith(
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF1DA1F2),
          onPrimary: Colors.white,
          surface: Colors.white,
        ),
        dialogBackgroundColor: Colors.white,
      ),
      child: child,
    );
  }

  // ────────────── REST OF THE METHODS (UNCHANGED) ──────────────

  Widget _buildHistoryItem(
    String? effectiveDate,
    String? checkInTime,
    String? checkOutTime,
    String? project,
    String? department,
    String? costCode,
  ) {
    String date = "";
    String inTimeFormatted = "";
    String outTimeFormatted = "";
    String duration = "";

    if (effectiveDate != null) {
      try {
        final parsedDate = DateTime.parse(effectiveDate);
        date = DateFormat('dd-MM-yyyy').format(parsedDate);
      } catch (e) {
        log('Error parsing effectiveDate: $e');
      }
    }

    if (checkInTime != null) {
      try {
        final parsedInTime = DateTime.parse(checkInTime);
        inTimeFormatted = DateFormat('HH:mm').format(parsedInTime);
      } catch (e) {
        log('Error parsing checkInTime: $e');
      }
    }

    if (checkOutTime != null) {
      try {
        final parsedOutTime = DateTime.parse(checkOutTime);
        outTimeFormatted = DateFormat('HH:mm').format(parsedOutTime);
      } catch (e) {
        log('Error parsing checkOutTime: $e');
      }
    }

    if (checkInTime != null && checkOutTime != null) {
      try {
        final inDateTime = DateTime.parse(checkInTime);
        final outDateTime = DateTime.parse(checkOutTime);
        final diff = outDateTime.difference(inDateTime);
        final hours = diff.inHours;
        final minutes = diff.inMinutes % 60;
        duration = '$hours hrs ${minutes}m';
      } catch (e) {
        log('Error calculating duration: $e');
      }
    }

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    date,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.login, size: 16, color: Colors.grey),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          inTimeFormatted,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Icon(Icons.logout, size: 16, color: Colors.grey),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          outTimeFormatted,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Project: ${project ?? "N/A"}',
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Department: ${department ?? "N/A"}',
                    style: const TextStyle(color: Colors.black87, fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Cost Code: ${costCode ?? "N/A"}',
                    style: const TextStyle(color: Colors.black87, fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF1DA1F2).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                duration,
                style: const TextStyle(
                  color: Color(0xFF1DA1F2),
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkeletonLoader() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      itemCount: 5,
      itemBuilder: (context, index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.only(bottom: 12),
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 100,
                          height: 14,
                          color: Colors.grey[300],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              width: 16,
                              height: 16,
                              color: Colors.grey[300],
                            ),
                            const SizedBox(width: 8),
                            Container(
                              width: 60,
                              height: 14,
                              color: Colors.grey[300],
                            ),
                            const SizedBox(width: 16),
                            Container(
                              width: 16,
                              height: 16,
                              color: Colors.grey[300],
                            ),
                            const SizedBox(width: 8),
                            Container(
                              width: 60,
                              height: 14,
                              color: Colors.grey[300],
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Container(
                          width: double.infinity,
                          height: 14,
                          color: Colors.grey[300],
                        ),
                        const SizedBox(height: 4),
                        Container(
                          width: double.infinity,
                          height: 14,
                          color: Colors.grey[300],
                        ),
                        const SizedBox(height: 4),
                        Container(
                          width: 150,
                          height: 14,
                          color: Colors.grey[300],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(width: 60, height: 30, color: Colors.grey[300]),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildErrorWidget() {
    return Center(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.error_outline,
                size: 48,
                color: Colors.redAccent,
              ),
              const SizedBox(height: 16),
              const Text(
                "Something went wrong",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                "An error occurred while processing your request.",
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _fetchReportData,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1DA1F2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                child: const Text(
                  'Retry',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.history_toggle_off, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'No records found',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Try selecting a different date range.',
            style: TextStyle(fontSize: 14, color: Colors.grey[500]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
