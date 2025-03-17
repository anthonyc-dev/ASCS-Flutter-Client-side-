import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting dates

class Event extends StatelessWidget {
  const Event({super.key});

  @override
  Widget build(BuildContext context) {
    // Example event data (you would typically fetch this from a database)
    String eventName = "Parents Meeting";
    String venue = "NCMC Gym";
    String description =
        "Please tell your parents about the upcoming meeting. Attendance is a must.";
    DateTime startDate = DateTime(2025, 4, 10, 18, 30); // Start Date with Time
    DateTime endDate = DateTime(2025, 4, 12, 22, 0); // End Date with Time

    // Date Format
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    final DateFormat timeFormat = DateFormat('HH:mm');

    return Scaffold(
      appBar: AppBar(
        title: const Text("Event Details"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Card(
            elevation: 5.0, // Add shadow to the card
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0), // Rounded corners
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Event Name with Icon
                  _buildDetailText(
                    label: 'Event Name',
                    value: eventName,
                    icon: Icons.event,
                  ),
                  const SizedBox(height: 16),

                  // Start Date and Time with Icon
                  _buildDetailText(
                    label: 'Start Date & Time',
                    value:
                        '${dateFormat.format(startDate)} ${timeFormat.format(startDate)}',
                    icon: Icons.calendar_today,
                  ),
                  const SizedBox(height: 16),

                  // End Date and Time with Icon
                  _buildDetailText(
                    label: 'End Date & Time',
                    value:
                        '${dateFormat.format(endDate)} ${timeFormat.format(endDate)}',
                    icon: Icons.calendar_today,
                  ),
                  const SizedBox(height: 16),

                  // Venue with Icon
                  _buildDetailText(
                    label: 'Venue',
                    value: venue,
                    icon: Icons.location_on,
                  ),
                  const SizedBox(height: 16),

                  // Description with Icon
                  _buildDetailText(
                    label: 'Description',
                    value: description,
                    icon: Icons.description,
                    maxLines: 5,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Reusable widget to display event details with an icon
  Widget _buildDetailText({
    required String label,
    required String value,
    required IconData icon,
    int maxLines = 1,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
      subtitle: Text(
        value,
        style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.7)),
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
