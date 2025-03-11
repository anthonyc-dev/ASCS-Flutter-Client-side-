import 'package:flutter/material.dart';

class Clearance extends StatefulWidget {
  const Clearance({super.key});

  @override
  State<Clearance> createState() => _ClearanceState();
}

class _ClearanceState extends State<Clearance>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Dummy data for the table
  final List<Map<String, String>> courseData = [
    {
      'courseCode': 'CS101',
      'section': 'A',
      'requirements': 'Calculator program',
      'instructor': 'Girly Aguilar',
      'status': 'Sign',
    },
    {
      'courseCode': 'CC107',
      'section': 'B',
      'requirements': 'POS System',
      'instructor': 'Shayne Llup',
      'status': 'In complete',
    },
    {
      'courseCode': 'SE101',
      'section': 'A',
      'requirements': 'Hardware System',
      'instructor': 'Jone Casipong',
      'status': 'Sign',
    },
    {
      'courseCode': 'CS Elect 1',
      'section': 'C',
      'requirements': 'CS101',
      'instructor': 'Rosalyn Luzon',
      'status': 'Missing',
    },
    // Add more dummy data as needed
  ];

  // Method to get color based on status
  Color getStatusColor(String status) {
    switch (status) {
      case 'Sign':
        return Colors.green;
      case 'In complete':
        return Colors.orange;
      case 'Missing':
        return Colors.red;
      default:
        return Colors.black; // Default color
    }
  }

  @override
  void initState() {
    super.initState();
    // Initialize the TabController
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Check the screen width to decide the layout
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Clearance'),
        leading: const Icon(Icons.school),
        bottom: TabBar(
          indicatorColor: Colors.blue, // Set the indicator color to blue
          labelColor: Colors.blue,
          controller: _tabController,
          tabs: [
            Tab(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return isMobile
                      ? Column(
                        mainAxisSize:
                            MainAxisSize
                                .min, // Ensures it only takes necessary space
                        children: [
                          Icon(Icons.business),
                          const SizedBox(
                            height: 8,
                          ), // Space between icon and text
                          Expanded(
                            // This ensures the text fits without overflow
                            child: Text(
                              'Department Clearance',
                              style: TextStyle(
                                fontSize: 12, // Adjust text size for mobile
                              ),
                              overflow:
                                  TextOverflow
                                      .ellipsis, // Truncate text if necessary
                              maxLines: 1, // Limit to 1 line of text
                            ),
                          ),
                        ],
                      )
                      : Row(
                        mainAxisSize:
                            MainAxisSize
                                .min, // Ensures the row takes only the necessary space
                        children: [
                          Icon(Icons.business),
                          const SizedBox(
                            width: 8,
                          ), // Space between icon and text
                          Text(
                            'Department Clearance',
                            style: TextStyle(
                              fontSize: 16, // Adjust text size for desktop
                            ),
                            overflow:
                                TextOverflow
                                    .ellipsis, // Truncate text if necessary
                            maxLines: 1, // Limit to 1 line of text
                          ),
                        ],
                      );
                },
              ),
            ),

            Tab(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return isMobile
                      ? Column(
                        mainAxisSize:
                            MainAxisSize
                                .min, // Ensures it only takes necessary space
                        children: [
                          Icon(Icons.account_balance),
                          const SizedBox(
                            height: 8,
                          ), // Space between icon and text
                          Expanded(
                            // This ensures the text fits without overflow
                            child: Text(
                              'Institunal Clearance',
                              style: TextStyle(
                                fontSize: 12, // Adjust text size for mobile
                              ),
                              overflow:
                                  TextOverflow
                                      .ellipsis, // Truncate text if necessary
                              maxLines: 1, // Limit to 1 line of text
                            ),
                          ),
                        ],
                      )
                      : Row(
                        mainAxisSize:
                            MainAxisSize
                                .min, // Ensures the row takes only the necessary space
                        children: [
                          Icon(Icons.business),
                          const SizedBox(
                            width: 8,
                          ), // Space between icon and text
                          Text(
                            'Institunal Clearance',
                            style: TextStyle(
                              fontSize: 16, // Adjust text size for desktop
                            ),
                            overflow:
                                TextOverflow
                                    .ellipsis, // Truncate text if necessary
                            maxLines: 1, // Limit to 1 line of text
                          ),
                        ],
                      );
                },
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TabBarView(
          controller: _tabController,
          children: [
            // Department Clearance Tab
            isMobile
                ? ListView.builder(
                  itemCount: courseData.length,
                  itemBuilder: (context, index) {
                    final course = courseData[index];
                    Color statusColor = getStatusColor(course['status']!);

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Course Code: ${course['courseCode']}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text('Section: ${course['section']}'),
                              Text('Requirements: ${course['requirements']}'),
                              Text('Instructor: ${course['instructor']}'),
                              Row(
                                children: [
                                  const Text('Status: '),
                                  Text(
                                    course['status']!,
                                    style: TextStyle(color: statusColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
                : Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 7,
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columnSpacing: 20,
                      headingRowColor: MaterialStateProperty.all(
                        Colors.blueAccent,
                      ),
                      columns: const [
                        DataColumn(label: Text('Course Code')),
                        DataColumn(label: Text('Section')),
                        DataColumn(label: Text('Requirements')),
                        DataColumn(label: Text('Instructor')),
                        DataColumn(label: Text('Status')),
                      ],
                      rows:
                          courseData.map((course) {
                            Color statusColor = getStatusColor(
                              course['status']!,
                            );

                            return DataRow(
                              cells: [
                                DataCell(Text(course['courseCode']!)),
                                DataCell(Text(course['section']!)),
                                DataCell(Text(course['requirements']!)),
                                DataCell(Text(course['instructor']!)),
                                DataCell(
                                  Text(
                                    course['status']!,
                                    style: TextStyle(color: statusColor),
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                    ),
                  ),
                ),

            // Institutional Clearance Tab
            Center(child: Text("Institutional Clearance Content Here")),
          ],
        ),
      ),
    );
  }
}
