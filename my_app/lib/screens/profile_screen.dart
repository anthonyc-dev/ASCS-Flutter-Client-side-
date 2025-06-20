import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Profile Icon (Avatar) with Shadow Effect
            const CircleAvatar(
              radius: 80,
              backgroundColor:
                  Colors.blueAccent, // Background color for the icon
              child: Icon(
                Icons.person, // Replace with custom profile picture if needed
                size: 80,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),

            // User's Name
            Text(
              'John Doe', // Replace with dynamic name if needed
              style: GoogleFonts.lato(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),

            // User's Bio
            Text(
              'BSCS Students!',
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                fontSize: 16,
                color: Colors.black54, // Slightly lighter color for the bio
              ),
            ),
            const SizedBox(height: 30),

            // Card with profile actions (buttons)
            Card(
              // margin: const EdgeInsets.symmetric(horizontal: 30),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Button/Action: Edit Profile
                    TextButton(
                      onPressed: () {
                        // Handle Edit Profile action here
                      },
                      child: Text(
                        'Change password',
                        style: GoogleFonts.outfit(
                          fontSize: 18,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Divider(),

                    // // Button/Action: View Projects
                    // TextButton(
                    //   onPressed: () {
                    //     // Handle View Projects action here
                    //   },
                    //   child: Text(
                    //     'Change password',
                    //     style: GoogleFonts.outfit(
                    //       fontSize: 18,
                    //       color: Colors.blueAccent,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    // ),
                    // Divider(),

                    // Button/Action: Contact Me
                    TextButton(
                      onPressed: () {
                        // Handle Contact action here
                      },
                      child: Text(
                        'My Clearance',
                        style: GoogleFonts.outfit(
                          fontSize: 18,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
