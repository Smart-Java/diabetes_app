import 'package:diabetes_care/pages/practitionersPage/dashboard/widget/care_giver_dashboard_page_scaffold.dart';
import 'package:flutter/material.dart';

class CareGiverDashboardPage extends StatelessWidget {
  const CareGiverDashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      top: false,
      bottom: false,
      left: false,
      right: false,
      child: CareGiverDashboardPageScaffoldWidget(),
    );
  }
}
