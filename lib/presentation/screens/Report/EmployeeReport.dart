import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'dart:io';

class EmployeeEntry {
  final DateTime date;
  final String inTime;
  final String outTime;
  final String duration;
  final String project;
  final String department;
  final String costCode;

  EmployeeEntry({
    required this.date,
    required this.inTime,
    required this.outTime,
    required this.duration,
    required this.project,
    required this.department,
    required this.costCode,
  });
}

class EmployeeReport extends StatefulWidget {
  @override
  _EmployeeReportState createState() => _EmployeeReportState();
}

class _EmployeeReportState extends State<EmployeeReport> {
  bool isDaily = true;
  DateTime selectedDate = DateTime(2023, 10, 26);
  late List<EmployeeEntry> entries;

  @override
  void initState() {
    super.initState();
    // Mock data for demonstration. In a real app, this would come from an API or database.
    entries = [
      EmployeeEntry(
        date: DateTime(2023, 10, 1),
        inTime: '09:00 AM',
        outTime: '05:00 PM',
        duration: '8h 0m',
        project: 'Project A',
        department: 'IT',
        costCode: 'C001',
      ),
      EmployeeEntry(
        date: DateTime(2023, 10, 2),
        inTime: '08:45 AM',
        outTime: '05:15 PM',
        duration: '8h 30m',
        project: 'Project B',
        department: 'HR',
        costCode: 'C002',
      ),
      EmployeeEntry(
        date: DateTime(2023, 10, 26),
        inTime: '09:02 AM',
        outTime: '05:30 PM',
        duration: '8h 28m',
        project: 'Project A',
        department: 'IT',
        costCode: 'C001',
      ),
      EmployeeEntry(
        date: DateTime(2023, 10, 27),
        inTime: '08:55 AM',
        outTime: '05:00 PM',
        duration: '8h 5m',
        project: 'Project B',
        department: 'HR',
        costCode: 'C002',
      ),
      EmployeeEntry(
        date: DateTime(2023, 10, 28),
        inTime: '09:10 AM',
        outTime: '06:20 PM',
        duration: '9h 10m',
        project: 'Project C',
        department: 'Finance',
        costCode: 'C003',
      ),
      EmployeeEntry(
        date: DateTime(2023, 10, 29),
        inTime: '08:48 AM',
        outTime: '06:20 PM',
        duration: '9h 32m',
        project: 'Project A',
        department: 'IT',
        costCode: 'C001',
      ),
      EmployeeEntry(
        date: DateTime(2023, 10, 30),
        inTime: '09:00 AM',
        outTime: '05:00 PM',
        duration: '8h 0m',
        project: 'Project B',
        department: 'HR',
        costCode: 'C002',
      ),
    ];
  }

  List<EmployeeEntry> get currentEntries {
    if (isDaily) {
      return entries
          .where(
            (e) =>
                e.date.year == selectedDate.year &&
                e.date.month == selectedDate.month &&
                e.date.day == selectedDate.day,
          )
          .toList();
    } else {
      return entries
          .where(
            (e) =>
                e.date.year == selectedDate.year &&
                e.date.month == selectedDate.month,
          )
          .toList();
    }
  }

  String get totalHours {
    Duration total = Duration.zero;
    for (var entry in currentEntries) {
      total += parseDuration(entry.duration);
    }
    return '${total.inHours}h ${total.inMinutes % 60}m';
  }

  Duration parseDuration(String s) {
    var parts = s.split(' ');
    int hours = int.parse(parts[0].replaceAll('h', ''));
    int minutes = int.parse(parts[1].replaceAll('m', ''));
    return Duration(hours: hours, minutes: minutes);
  }

  String get dateDisplay {
    if (isDaily) {
      return '${selectedDate.day}, ${selectedDate.month}, ${selectedDate.year}';
    } else {
      return '${DateFormat('MMMM').format(selectedDate)}, ${selectedDate.year}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Reports',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Toggle buttons
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                _buildToggleButton('Daily', isDaily, true),
                SizedBox(width: 8),
                _buildToggleButton('Monthly', !isDaily, false),
              ],
            ),
          ),

          // Date selector
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                      child: Text(dateDisplay, style: TextStyle(fontSize: 16)),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today, color: Colors.grey[600]),
                    onPressed: () => _selectDate(context),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 24),

          // Total hours card with additional details for daily
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Hours',
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text(
                    totalHours,
                    style: TextStyle(
                      color: Color(0xFF1DA1F2),
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      height: 1.0,
                    ),
                  ),
                  if (isDaily && currentEntries.isNotEmpty) ...[
                    SizedBox(height: 16),
                    Text(
                      'Check-in: ${currentEntries[0].inTime}',
                      style: TextStyle(color: Colors.grey[800], fontSize: 14),
                    ),
                    Text(
                      'Check-out: ${currentEntries[0].outTime}',
                      style: TextStyle(color: Colors.grey[800], fontSize: 14),
                    ),
                    Text(
                      'Project: ${currentEntries[0].project}',
                      style: TextStyle(color: Colors.grey[800], fontSize: 14),
                    ),
                    Text(
                      'Department: ${currentEntries[0].department}',
                      style: TextStyle(color: Colors.grey[800], fontSize: 14),
                    ),
                    Text(
                      'Cost Code: ${currentEntries[0].costCode}',
                      style: TextStyle(color: Colors.grey[800], fontSize: 14),
                    ),
                  ],
                ],
              ),
            ),
          ),

          SizedBox(height: 24),

          // History section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  'History',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.download, color: Color(0xFF1DA1F2)),
                  onPressed: _downloadReport,
                ),
              ],
            ),
          ),

          SizedBox(height: 16),

          // History items
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: currentEntries.length,
              itemBuilder: (context, index) {
                final entry = currentEntries[index];
                return Column(
                  children: [
                    _buildHistoryItem(
                      DateFormat('EEE, MMM d').format(entry.date),
                      entry.duration,
                      entry.inTime,
                      entry.outTime,
                      entry.project,
                      entry.department,
                      entry.costCode,
                    ),
                    SizedBox(height: 12),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButton(String text, bool isSelected, bool setToDaily) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isDaily = setToDaily;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Color(0xFF1DA1F2) : Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey[600],
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHistoryItem(
    String date,
    String duration,
    String inTime,
    String outTime,
    String project,
    String department,
    String costCode,
  ) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.login, size: 14, color: Colors.grey[600]),
                    SizedBox(width: 4),
                    Text(
                      inTime,
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                    SizedBox(width: 16),
                    Icon(Icons.logout, size: 14, color: Colors.grey[600]),
                    SizedBox(width: 4),
                    Text(
                      outTime,
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  'Project: $project',
                  style: TextStyle(color: Colors.grey[800], fontSize: 12),
                ),
                Text(
                  'Department: $department',
                  style: TextStyle(color: Colors.grey[800], fontSize: 12),
                ),
                Text(
                  'Cost Code: $costCode',
                  style: TextStyle(color: Colors.grey[800], fontSize: 12),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Color(0xFF1DA1F2).withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              duration,
              style: TextStyle(
                color: Color(0xFF1DA1F2),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        if (!isDaily) {
          // Normalize to first of the month for monthly view
          selectedDate = DateTime(picked.year, picked.month, 1);
        } else {
          selectedDate = picked;
        }
      });
    }
  }

  Future<void> _downloadReport() async {
    final data = currentEntries;
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(32),
        build: (pw.Context context) {
          return [
            pw.Header(
              level: 0,
              child: pw.Text(
                isDaily
                    ? 'Daily Employee Report - ${DateFormat('MMMM d, yyyy').format(selectedDate)}'
                    : 'Monthly Employee Report - ${DateFormat('MMMM yyyy').format(selectedDate)}',
                style: pw.TextStyle(
                  fontSize: 20,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ),
            pw.SizedBox(height: 20),
            pw.Text(
              'Total Hours: $totalHours',
              style: pw.TextStyle(fontSize: 16),
            ),
            if (isDaily && data.isNotEmpty) ...[
              pw.SizedBox(height: 10),
              pw.Text('Check-in: ${data[0].inTime}'),
              pw.Text('Check-out: ${data[0].outTime}'),
              pw.Text('Project: ${data[0].project}'),
              pw.Text('Department: ${data[0].department}'),
              pw.Text('Cost Code: ${data[0].costCode}'),
            ],
            pw.SizedBox(height: 20),
            pw.Table.fromTextArray(
              headers: [
                'Date',
                'In Time',
                'Out Time',
                'Duration',
                'Project',
                'Department',
                'Cost Code',
              ],
              data: data
                  .map(
                    (e) => [
                      DateFormat('MMM d, yyyy').format(e.date),
                      e.inTime,
                      e.outTime,
                      e.duration,
                      e.project,
                      e.department,
                      e.costCode,
                    ],
                  )
                  .toList(),
              border: pw.TableBorder.all(),
              headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              cellAlignment: pw.Alignment.centerLeft,
              cellPadding: pw.EdgeInsets.all(8),
            ),
          ];
        },
      ),
    );

    try {
      final dir = await getDownloadsDirectory();
      final path =
          '${dir!.path}/employee_report_${isDaily ? 'daily' : 'monthly'}_${DateFormat('yyyyMMdd').format(selectedDate)}.pdf';
      final file = File(path);
      await file.writeAsBytes(await pdf.save());
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('PDF report downloaded to $path')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error downloading PDF report: $e')),
      );
    }
  }
}
