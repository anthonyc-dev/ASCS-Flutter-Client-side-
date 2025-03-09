import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/widgets/bottom_navigation.dart';
import 'package:my_app/widgets/custom_drawer.dart';

class BuildMobileLayout extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  final List<Widget> screens;

  const BuildMobileLayout({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
    required this.screens,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(
          'To-Do & SMS App',
          style: GoogleFonts.outfit(fontWeight: FontWeight.normal),
        ),
      ),
      drawer: CustomDrawer(onItemTapped: onItemTapped),
      body: screens[selectedIndex],
      bottomNavigationBar: CustomBottomNavigation(
        selectedIndex: selectedIndex,
        onItemTapped: onItemTapped,
      ),
    );
  }
}
