import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/screens/course_details.dart';
import 'package:my_app/screens/inst_clearance.dart';

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theme.primaryColor,
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
                  padding: const EdgeInsets.all(16),
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
                      child: Card(
                        color: Colors.white,
                        elevation: 2,
                        margin: const EdgeInsets.only(bottom: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
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
                                      color: statusColor.withOpacity(0.1),
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
                              _buildInfoRow('Section', course['section']!),
                              _buildInfoRow(
                                  'Requirements', course['requirements']!),
                              _buildInfoRow(
                                  'Instructor', course['instructor']!),
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
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      headingRowColor: MaterialStateProperty.all(
                        theme.primaryColor,
                      ),
                      headingTextStyle: GoogleFonts.outfit(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                      dataRowColor: MaterialStateProperty.all(Colors.white),
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
                            DataCell(
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: statusColor.withOpacity(0.1),
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
          const Center(child: InstClearance()),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: GoogleFonts.outfit(
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
          Text(
            value,
            style: GoogleFonts.outfit(
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
