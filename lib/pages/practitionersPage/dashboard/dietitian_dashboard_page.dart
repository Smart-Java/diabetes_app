import 'package:diabetes_care/pages/practitionersPage/dashboard/widget/dietitian_dashboard_page_scaffold.dart';
import 'package:flutter/material.dart';

class DietitianDashboardPage extends StatelessWidget {
  const DietitianDashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      top: false,
      bottom: false,
      left: false,
      right: false,
      child: DietitianDashboardPageScaffoldWidget(),
    );
  }
}
