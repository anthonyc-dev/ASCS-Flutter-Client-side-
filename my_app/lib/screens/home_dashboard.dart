import 'package:flutter/material.dart';

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Light background
      // appBar: AppBar(
      //   title: const Text(
      //     "Dashboard",
      //     style: TextStyle(fontWeight: FontWeight.bold),
      //   ),
      //   backgroundColor: Colors.deepPurple,
      //   elevation: 0,
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.notifications, color: Colors.white),
      //       onPressed: () {},
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.only(right: 10),
      //       child: CircleAvatar(
      //         backgroundImage: NetworkImage("https://via.placeholder.com/150"),
      //       ),
      //     ),
      //   ],
      // ),
      body: Column(
        children: [
          // Header Card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.blueAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Welcome Back NCMCIAN!",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Here's your dashboard",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),

          // Grid Menu
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  DashboardCard(title: "Profile", icon: Icons.person),
                  DashboardCard(title: "Settings", icon: Icons.settings),
                  DashboardCard(title: "Clearance", icon: Icons.description),
                  // DashboardCard(title: "Analytics", icon: Icons.bar_chart),
                  DashboardCard(
                    title: "Notifications",
                    icon: Icons.notifications,
                  ),
                  DashboardCard(title: "Logout", icon: Icons.logout),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Dashboard Card Widget
class DashboardCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const DashboardCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
