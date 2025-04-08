import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/mentor_list_program.dart';
import '../../widgets/planned_programs_widget.dart';
import '../../widgets/program_status_metrics_chart.dart';
import '../../widgets/mis_program_widget.dart';
import '../../widgets/program_typechart.dart';
import '../../widgets/program_model_chart.dart';
import './custom_sidebar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); 

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;

    switch (index) {
      case 0:
        setState(() {
          _selectedIndex = 0;
        });
        context.go('/home'); 
        break;
      case 1:
        context.go('/programs');
        break;
      case 2:
        context.go('/users');
        break;
      case 3:
        context.go('/requests');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    double commonHeight = 500.h;
    double chartHeight = 300.h;

    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomSidebar( 
        onClose: () => _scaffoldKey.currentState?.closeDrawer(),
        userName: "John Doe",
        userRole: "Mentor",
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, color: Colors.white, size: 20),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.search, color: Colors.black),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.notifications, color: Colors.black),
                onPressed: () {},
              ),
              IconButton( 
                icon: const Icon(Icons.menu, color: Colors.black),
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              ),
            ],
          ),
        ),
      ),


      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isTablet = constraints.maxWidth > 600;

            if (isTablet) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: PlannedProgramsWidget(height: commonHeight)),
                        SizedBox(width: 16.w),
                        Expanded(child: ProgramStatusMetricsChart(height: commonHeight)),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    ProgramWidget(),
                    SizedBox(height: 20.h),
                    MentorWidget(),
                    SizedBox(height: 20.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: SizedBox(height: chartHeight, child: ProgramTypeChart())),
                        SizedBox(width: 16.w),
                        Expanded(child: SizedBox(height: chartHeight, child: ProgramModeChart())),
                      ],
                    ),
                  ],
                ),
              );
            }

            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  PlannedProgramsWidget(height: commonHeight),
                  SizedBox(height: 20.h),
                  ProgramStatusMetricsChart(height: commonHeight),
                  SizedBox(height: 20.h),
                  ProgramWidget(),
                  SizedBox(height: 20.h),
                  MentorWidget(),
                  SizedBox(height: 20.h),
                  SizedBox(height: chartHeight, child: ProgramTypeChart()),
                  SizedBox(height: 20.h),
                  SizedBox(height: chartHeight, child: ProgramModeChart()),
                ],
              ),
            );
          },
        ),
      ),


      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color(0xFF246BFD),
        unselectedItemColor: Colors.black87,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard_customize), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Programs'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Users'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Requests'),
        ],
      ),
    );
  }
}
