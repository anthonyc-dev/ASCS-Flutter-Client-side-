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
    {
      "title": "Open House",
      "description":
          "Come and explore our campus and facilities. Meet our staff and students too!",
      "date": "Jul 1, 2025 • 10:00 AM",
    },
    {
      "title": "Welcome Back Party",
      "description":
          "Join us as we welcome back our students from the summer break. There will be food, drinks, and fun games!",
      "date": "Aug 24, 2025 • 3:00 PM",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Events',
            style: GoogleFonts.outfit(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return EventCard(event: event);
        },
      ),
    );
  }
}
