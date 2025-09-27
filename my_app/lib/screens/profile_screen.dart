import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentProfileScreen extends StatelessWidget {
  const StudentProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const themeColor = Color(0xFF0A84FF);

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Title moved from AppBar
            Text(
              'Student Profile',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black87,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 20),

            // Profile Picture with border and shadow
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: themeColor.withOpacity(0.25),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ],
                border: Border.all(
                  color: themeColor,
                  width: 3,
                ),
              ),
              child: const CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde',
                ),
              ),
            ),
            const SizedBox(height: 18),
            // Student Name & School ID
            Text(
              'Anthony Crausus',
              style: GoogleFonts.poppins(
                fontSize: 26,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
                letterSpacing: 1.1,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Bachelor of Science in Computer Science',
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
                letterSpacing: 1.1,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: themeColor.withOpacity(0.08),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'School ID: 2025001234',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            const SizedBox(height: 18),
            // Edit Profile Button
            ElevatedButton.icon(
              onPressed: () {
                // Navigate to edit profile page
              },
              icon: const Icon(Icons.edit, size: 20, color: Colors.white70),
              label: Text(
                'Edit Profile',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: themeColor,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 28),
            // Student Details Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Colors.black12, // Border color
                      width: 1, // Border width
                    ),
                    borderRadius: BorderRadius.circular(16)),
                shadowColor: themeColor.withOpacity(0.2),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.info_outline,
                              color: Colors.black87, size: 22),
                          const SizedBox(width: 7),
                          Text(
                            'Details',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      _buildDetailRow(
                          'Course', 'BS Computer Science', themeColor),
                      _buildDetailRow('Year', '3rd Year', themeColor),
                      _buildDetailRow(
                          'Email', 'janedoe@university.edu', themeColor),
                      _buildDetailRow('Phone', '+63 912 345 6789', themeColor),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 28),
            // Clearance Status Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.black12,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),
                shadowColor: themeColor.withOpacity(0.18),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.verified_user,
                              color: Colors.black87, size: 26),
                          const SizedBox(width: 8),
                          Text(
                            'Clearance Status',
                            style: GoogleFonts.poppins(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      _buildStatusRow('Library', 'Approved', Colors.green),
                      const SizedBox(height: 12),
                      _buildStatusRow('Finance', 'Pending', Colors.orange),
                      const SizedBox(height: 12),
                      _buildStatusRow('Department', 'Rejected', Colors.red),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  debugPrint('Button Pressed logout');
                },
                child: Text(
                  'Logout',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusRow(String department, String status, Color color) {
    IconData icon;
    switch (department) {
      case 'Library':
        icon = Icons.local_library;
        break;
      case 'Finance':
        icon = Icons.account_balance_wallet;
        break;
      case 'Department':
        icon = Icons.apartment;
        break;
      default:
        icon = Icons.business;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(width: 8),
            Text(
              department,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
          decoration: BoxDecoration(
            color: color.withOpacity(0.13),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: color.withOpacity(0.3), width: 1),
          ),
          child: Row(
            children: [
              Icon(
                status == 'Approved'
                    ? Icons.check_circle
                    : status == 'Pending'
                        ? Icons.hourglass_top
                        : Icons.cancel,
                color: color,
                size: 16,
              ),
              const SizedBox(width: 5),
              Text(
                status,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: color,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value, Color themeColor) {
    IconData? icon;
    switch (label) {
      case 'Course':
        icon = Icons.school;
        break;
      case 'Year':
        icon = Icons.calendar_today;
        break;
      case 'Email':
        icon = Icons.email_outlined;
        break;
      case 'Phone':
        icon = Icons.phone_android;
        break;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, color: themeColor, size: 18),
            const SizedBox(width: 8),
          ],
          Text(
            '$label: ',
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: 15,
                color: Colors.grey[700],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
