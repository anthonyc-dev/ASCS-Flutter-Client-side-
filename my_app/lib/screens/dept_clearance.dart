import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/screens/course_details.dart';
import 'package:my_app/screens/inst_clearance.dart';
import 'package:my_app/widgets/clearance/build_info_row.dart';

class DeptClearance extends StatefulWidget {
  const DeptClearance({super.key});

  @override
  State<DeptClearance> createState() => _DeptClearanceState();
}

class _DeptClearanceState extends State<DeptClearance>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Dummy data for the table
  final List<Map<String, String>> courseData = [
    {
      'courseCode': 'CS101',
      'requirements': 'Calculator program',
      'instructor': 'Girly Aguilar',
      'status': 'Sign',
      "dueDate": '2024-10-01',
    },
    {
      'courseCode': 'CC107',
      'requirements': 'POS System',
      'instructor': 'Shayne Llup',
      'status': 'In complete',
      "dueDate": '2024-10-05',
    },
    {
      'courseCode': 'SE101',
      'requirements': 'Hardware System',
      'instructor': 'Jone Casipong',
      'status': 'Sign',
      "dueDate": '2024-10-03',
    },
    {
      'courseCode': 'CS Elect 1',
      'requirements': 'CS101',
      'instructor': 'Rosalyn Luzon',
      'status': 'Missing',
      "dueDate": '2024-10-07',
    },
  ];

  Color getStatusColor(String status) {
    switch (status) {
      case 'Sign':
        return Colors.green;
      case 'In complete':
        return Colors.orange;
      case 'Missing':
        return Colors.red;
      default:
        return Colors.black;
    }
  }

  IconData getStatusIcon(String status) {
    switch (status) {
      case 'Sign':
        return Icons.check_circle;
      case 'In complete':
        return Icons.pending;
      case 'Missing':
        return Icons.error;
      default:
        return Icons.info;
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        title: Text(
          'Clearance',
          style: GoogleFonts.outfit(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: [
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.business),
                  const SizedBox(width: 8),
                  Text(
                    "Department",
                    style: GoogleFonts.outfit(fontSize: 14),
                  ),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.account_balance),
                  const SizedBox(width: 8),
                  Text(
                    "Institutional",
                    style: GoogleFonts.outfit(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Department Clearance Tab
          isMobile
              ? ListView.builder(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16,
                    bottom:
                        100, // Add bottom margin to show content above bottom navigation
                  ),
                  itemCount: courseData.length,
                  itemBuilder: (context, index) {
                    final course = courseData[index];
                    Color statusColor = getStatusColor(course['status']!);
                    IconData statusIcon = getStatusIcon(course['status']!);

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CourseDetailsScreen(course: course),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.class_, size: 20),
                                      const SizedBox(width: 8),
                                      Text(
                                        course['courseCode']!,
                                        style: GoogleFonts.outfit(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: statusColor.withValues(alpha: 0.1),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          statusIcon,
                                          color: statusColor,
                                          size: 16,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          course['status']!,
                                          style: GoogleFonts.outfit(
                                            color: statusColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              InfoRow(
                                icon: Icons.person,
                                label: 'Instructor',
                                value: course['instructor']!,
                              ),
                              InfoRow(
                                icon: Icons.assignment,
                                label: 'Requirements',
                                value: course['requirements']!,
                              ),
                              InfoRow(
                                icon: Icons.schedule,
                                label: 'Due Date',
                                value: course['dueDate']!,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              : Container(
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      headingRowColor: WidgetStateProperty.all(
                        theme.primaryColor,
                      ),
                      headingTextStyle: GoogleFonts.outfit(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                      dataRowColor: WidgetStateProperty.all(Colors.white),
                      columns: const [
                        DataColumn(
                          label: Row(
                            children: [
                              Icon(Icons.class_, color: Colors.white),
                              SizedBox(width: 8),
                              Text('Course Code'),
                            ],
                          ),
                        ),
                        DataColumn(
                          label: Row(
                            children: [
                              Icon(Icons.group, color: Colors.white),
                              SizedBox(width: 8),
                              Text('Section'),
                            ],
                          ),
                        ),
                        DataColumn(
                          label: Row(
                            children: [
                              Icon(Icons.assignment, color: Colors.white),
                              SizedBox(width: 8),
                              Text('Requirements'),
                            ],
                          ),
                        ),
                        DataColumn(
                          label: Row(
                            children: [
                              Icon(Icons.person, color: Colors.white),
                              SizedBox(width: 8),
                              Text('Instructor'),
                            ],
                          ),
                        ),
                        DataColumn(
                          label: Row(
                            children: [
                              Icon(Icons.info, color: Colors.white),
                              SizedBox(width: 8),
                              Text('Status'),
                            ],
                          ),
                        ),
                      ],
                      rows: courseData.map((course) {
                        Color statusColor = getStatusColor(course['status']!);
                        IconData statusIcon = getStatusIcon(course['status']!);
                        return DataRow(
                          cells: [
                            DataCell(Row(
                              children: [
                                const Icon(Icons.class_, size: 16),
                                const SizedBox(width: 8),
                                Text(course['courseCode']!),
                              ],
                            )),
                            DataCell(Row(
                              children: [
                                const Icon(Icons.group, size: 16),
                                const SizedBox(width: 8),
                                Text(course['section']!),
                              ],
                            )),
                            DataCell(Row(
                              children: [
                                const Icon(Icons.assignment, size: 16),
                                const SizedBox(width: 8),
                                Text(course['requirements']!),
                              ],
                            )),
                            DataCell(Row(
                              children: [
                                const Icon(Icons.person, size: 16),
                                const SizedBox(width: 8),
                                Text(course['instructor']!),
                              ],
                            )),
                            DataCell(Row(
                              children: [
                                const Icon(Icons.person, size: 16),
                                const SizedBox(width: 8),
                                Text(course['dueDate']!),
                              ],
                            )),
                            DataCell(
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: statusColor.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      statusIcon,
                                      color: statusColor,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      course['status']!,
                                      style: TextStyle(color: statusColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),

          // Institutional Clearance Tab
          const Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: InstClearance(),
            ),
          ),
        ],
      ),
    );
  }
}
