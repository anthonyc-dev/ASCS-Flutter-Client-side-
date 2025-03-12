import 'package:flutter/material.dart';

class InstClearance extends StatefulWidget {
  const InstClearance({super.key});

  @override
  State<InstClearance> createState() => _InstClearanceState();
}

class _InstClearanceState extends State<InstClearance>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Dummy data for the table
  final List<Map<String, String>> courseData = [
    {
      'inst_name': 'SOA',
      'name': 'Mariam Christine Abilla',
      'requirements': 'Sign by SGO and UMSA',
      'status': 'Sign',
    },
    {
      'inst_name': 'Registrar',
      'name': 'Salman Sultan',
      'requirements': 'Sign all Subject and form !#&',
      'status': 'In complete',
    },
    {
      'inst_name': 'Tailoring',
      'name': 'Bilinda Sahok',
      'requirements': 'Ncmc Uniform and Student ID',
      'status': 'Sign',
    },
    {
      'inst_name': 'Laboratory',
      'name': 'Romel Etang',
      'requirements': 'One mouse and keyboard',
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

    return TabBarView(
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
                            '${course['inst_name']}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text('Name: ${course['name']}'),
                          Text('Requirements: ${course['requirements']}'),

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
                  headingRowColor: MaterialStateProperty.all(Colors.blueAccent),
                  columns: const [
                    DataColumn(label: Text('Course Code')),
                    DataColumn(label: Text('Section')),
                    DataColumn(label: Text('Requirements')),
                    DataColumn(label: Text('Instructor')),
                    DataColumn(label: Text('Status')),
                  ],
                  rows:
                      courseData.map((course) {
                        Color statusColor = getStatusColor(course['status']!);

                        return DataRow(
                          cells: [
                            DataCell(Text(course['inst_name']!)),
                            DataCell(Text(course['name']!)),
                            DataCell(Text(course['requirements']!)),
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
        Center(child: InstClearance()),
      ],
    );
  }
}
