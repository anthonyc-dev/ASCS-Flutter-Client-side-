import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/widgets/event/event_card.dart';

class EventsPage extends StatelessWidget {
  EventsPage({super.key});

  final List<Map<String, dynamic>> events = [
    {
      "title": "Parents Meeting",
      "description":
          "Please tell your parents about the upcoming meeting. Attendance is a must.",
      "date": "Apr 10, 2025 • 6:30 PM",
    },
    {
      "title": "Sports Day",
      "description":
          "Join us for an exciting sports day filled with fun games!",
      "date": "May 2, 2025 • 9:00 AM",
    },
    {
      "title": "Graduation Ceremony",
      "description": "Celebrate the achievements of our graduates with us.",
      "date": "Jun 15, 2025 • 2:00 PM",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: events.length + 1, // +1 for the header card
        itemBuilder: (context, index) {
          if (index == 0) {
            // Header card with "Events" title
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [Color(0xFF42a5f5), Color(0xFF1976D2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.25),
                    blurRadius: 18,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  "Events",
                  style: GoogleFonts.outfit(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          } else {
            // Event cards
            final event = events[index - 1];
            return EventCard(event: event);
          }
        },
      ),
    );
  }
}
