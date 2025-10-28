import 'dart:developer';
import 'package:checkin_checkout/data/models/checkin_checkout_model/checkin_view_model.dart';
import 'package:checkin_checkout/presentation/blocs/userCheckinCheckout/user_checkin_checkout_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CheckinDetailsCard extends StatefulWidget {
  final CheckinVieModel? checkinViewModel;
  final double latitude;
  final double longitude;

  const CheckinDetailsCard({
    super.key,
    required this.checkinViewModel,
    required this.latitude,
    required this.longitude,
  });

  @override
  CheckinDetailsCardState createState() => CheckinDetailsCardState();
}

class CheckinDetailsCardState extends State<CheckinDetailsCard>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.checkinViewModel;

    if (data == null) {
      return const SizedBox.shrink();
    }

    return FadeTransition(
      opacity: _fadeAnimation,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Card(
          elevation: 10,
          shadowColor: Colors.blueAccent.withOpacity(0.25),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              gradient: LinearGradient(
                colors: [Colors.blue.shade50, Colors.white],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: Border.all(
                color: Colors.blueAccent.withOpacity(0.2),
                width: 1.5,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDetailRow(
                      icon: Icons.work_outline,
                      title: 'Project',
                      value: data.PJCTALLOC ?? '—',
                      color: Colors.blueAccent,
                      delay: 0,
                    ),
                    _buildDetailRow(
                      icon: Icons.business,
                      title: 'Department',
                      value: data.Dept ?? '—',
                      color: Colors.teal,
                      delay: 100,
                    ),
                    _buildDetailRow(
                      icon: Icons.paid_outlined,
                      title: 'Cost Code',
                      value: data.EMPCOST ?? '—',
                      color: Colors.green,
                      delay: 200,
                    ),
                    _buildDetailRow(
                      icon: Icons.play_circle_outline,
                      title: 'Activity',
                      value: data.ACTALLOC ?? '—',
                      color: Colors.orange,
                      delay: 300,
                    ),
                    _buildDetailRow(
                      icon: Icons.access_time_filled,
                      title: 'Check-In Time',
                      value: _formatTime(data.checkintime),
                      color: Colors.purple,
                      delay: 400,
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          context.read<UserCheckinCheckoutBloc>().add(
                            GetCheckOutData(
                              checkinTime: DateFormat(
                                'yyyy-MM-dd HH:mm:ss',
                              ).format(DateTime.now()),
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Check-out successful!"),
                              backgroundColor: Colors.green,
                            ),
                          );
                        },
                        icon: const Icon(Icons.logout, color: Colors.white),
                        label: Text(
                          "Check-Out",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrangeAccent,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          elevation: 6,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
    required int delay,
  }) {
    return AnimatedSlideFade(
      delay: Duration(milliseconds: delay),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 2),
        decoration: BoxDecoration(
          color: color.withOpacity(0.05),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: color.withOpacity(0.2)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(String? timeStr) {
    if (timeStr == null || timeStr.isEmpty) return '—';
    try {
      final date = DateTime.parse(timeStr);
      return DateFormat('hh:mm a • dd MMM yyyy').format(date);
    } catch (e) {
      return timeStr;
    }
  }
}

// Custom animation widget for staggered fade + slide
class AnimatedSlideFade extends StatelessWidget {
  final Widget child;
  final Duration delay;

  const AnimatedSlideFade({
    super.key,
    required this.child,
    required this.delay,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(30 * (1 - value), 0),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
