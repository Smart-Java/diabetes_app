import 'package:diabetes_care/pages/practitionersPage/dashboard/widget/doctor_dashboard_page_scaffold.dart';
import 'package:flutter/material.dart';

class DoctorDashboardPage extends StatelessWidget {
  const DoctorDashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      top: false,
      bottom: false,
      left: false,
      right: false,
      child: DoctorDashboardPageScaffoldWidget(),
    );
  }
}
