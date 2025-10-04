import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> course;

  const CourseDetailsScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    Color statusColor = _getStatusColor(course['status'] ?? 'Pending');
    IconData statusIcon = _getStatusIcon(course['status'] ?? 'Pending');

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Course Details',
          style: GoogleFonts.outfit(
            color: Colors.black87,
            letterSpacing: 0.5,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFFF5F7FA),
            ),
          ),
          // Main content
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 100, 16, 24),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                shadowColor: Colors.blueAccent.withValues(alpha: 0.2),
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Course Code and Name
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  Colors.blueAccent.withValues(alpha: 0.15),
                                  Colors.blueAccent.withValues(alpha: 0.05)
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            padding: const EdgeInsets.all(16),
                            child: const Icon(
                              Icons.class_,
                              color: Colors.blueAccent,
                              size: 36,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  course['courseCode'] ?? 'N/A',
                                  style: GoogleFonts.outfit(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.blueAccent[700],
                                    letterSpacing: 1.2,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  course['courseName'] ??
                                      'BS Computer Science ',
                                  style: GoogleFonts.outfit(
                                    fontSize: 18,
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),

                      // Status
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 10),
                        decoration: BoxDecoration(
                          color: statusColor.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              statusIcon,
                              color: statusColor,
                              size: 28,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Status: ',
                              style: GoogleFonts.outfit(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.grey[800],
                              ),
                            ),
                            Text(
                              course['status'] ?? 'Pending',
                              style: GoogleFonts.outfit(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: statusColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 28),

                      // Instructor
                      if (course['instructor'] != null) ...[
                        _InfoRow(
                          icon: Icons.person,
                          iconColor: Colors.deepPurple,
                          label: 'Instructor',
                          value: course['instructor'],
                          valueColor: Colors.deepPurple,
                        ),
                        const SizedBox(height: 18),
                      ],

                      // Schedule
                      if (course['schedule'] != null) ...[
                        _InfoRow(
                          icon: Icons.schedule,
                          iconColor: Colors.teal,
                          label: 'Schedule',
                          value: course['schedule'],
                          valueColor: Colors.teal,
                        ),
                        const SizedBox(height: 18),
                      ],

                      // Requirements
                      if (course['requirements'] != null) ...[
                        _InfoRow(
                          icon: Icons.assignment_turned_in,
                          iconColor: Colors.orange,
                          label: 'Requirements',
                          value: course['requirements'],
                          valueColor: Colors.orange[800],
                        ),
                        const SizedBox(height: 18),
                      ],

                      // Section
                      if (course['section'] != null) ...[
                        _InfoRow(
                          icon: Icons.group,
                          iconColor: Colors.indigo,
                          label: 'Section',
                          value: course['section'],
                          valueColor: Colors.indigo[700],
                        ),
                        const SizedBox(height: 18),
                      ],

                      // Description
                      if (course['description'] != null) ...[
                        Text(
                          'Description',
                          style: GoogleFonts.outfit(
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                            color: Colors.blueGrey[900],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[50],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            course['description'],
                            style: GoogleFonts.outfit(
                              fontSize: 15,
                              color: Colors.blueGrey[800],
                              height: 1.4,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],

                      // Modern Action Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _GradientButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icons.arrow_back,
                            label: 'Back',
                            gradient: const LinearGradient(
                              colors: [Colors.grey, Colors.blueGrey],
                            ),
                            textColor: Colors.white,
                          ),
                          _GradientButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Feature coming soon!',
                                    style: GoogleFonts.outfit(),
                                  ),
                                ),
                              );
                            },
                            icon: Icons.check_circle_outline,
                            label: 'Action',
                            gradient: const LinearGradient(
                              colors: [Color(0xFF1976D2), Color(0xFF64B5F6)],
                            ),
                            textColor: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'cleared':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'not cleared':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status.toLowerCase()) {
      case 'cleared':
        return Icons.check_circle;
      case 'pending':
        return Icons.hourglass_top;
      case 'not cleared':
        return Icons.cancel;
      default:
        return Icons.help_outline;
    }
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final String label;
  final String value;
  final Color? valueColor;

  const _InfoRow({
    required this.icon,
    this.iconColor,
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: 22),
        const SizedBox(width: 10),
        Text(
          '$label: ',
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: Colors.grey[800],
          ),
        ),
        Flexible(
          child: Text(
            value,
            style: GoogleFonts.outfit(
              fontWeight: FontWeight.bold,
              color: valueColor ?? Colors.black87,
              fontSize: 15,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _GradientButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String label;
  final LinearGradient gradient;
  final Color textColor;

  const _GradientButton({
    required this.onPressed,
    required this.icon,
    required this.label,
    required this.gradient,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: gradient.colors.first.withValues(alpha: 0.18),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: textColor, size: 20),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: GoogleFonts.outfit(
                    color: textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
