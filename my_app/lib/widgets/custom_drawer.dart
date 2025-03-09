import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/responsive/responsive.dart';

class CustomDrawer extends StatelessWidget {
  final Function(int) onItemTapped;

  const CustomDrawer({super.key, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    // bool isDesktop = MediaQuery.of(context).size.width > 800;

    return SizedBox(
      width: Responsive.isDesktop(context) ? 230.w : null,
      child: Drawer(
        shape:
            Responsive.isDesktop(context)
                ? RoundedRectangleBorder(
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(5), // Rounded edges on mobile
                  ),
                ) // No rounding on desktop
                : RoundedRectangleBorder(
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(16), // Rounded edges on mobile
                  ),
                ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.lightBlueAccent,
                    Color.fromARGB(221, 134, 70, 70),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'MicroFlux',
                      style: GoogleFonts.outfit(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'There\'s no Exit',
                      style: GoogleFonts.outfit(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildDrawerItem(
              Icons.checklist,
              'To-Do List',
              0,
              context,
              onItemTapped,
              Responsive.isTablet(context) || Responsive.isDesktop(context),
            ),
            _buildDrawerItem(
              Icons.message,
              'SMS',
              1,
              context,
              onItemTapped,
              Responsive.isTablet(context) || Responsive.isDesktop(context),
            ),
            _buildDrawerItem(
              Icons.person,
              'Profile',
              2,
              context,
              onItemTapped,
              Responsive.isTablet(context) || Responsive.isDesktop(context),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildDrawerItem(
  IconData icon,
  String title,
  int index,
  BuildContext context,
  Function(int) onItemTapped,
  bool isDesktop,
) {
  return ListTile(
    leading: Icon(icon),
    title: Text(title, style: GoogleFonts.outfit()),
    onTap: () {
      if (!isDesktop) Navigator.pop(context); // Only close drawer on mobile
      onItemTapped(index);
    },
  );
}
