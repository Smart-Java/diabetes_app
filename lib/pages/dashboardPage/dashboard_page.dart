import 'package:diabetes_care/pages/dashboardPage/widget/dashboard_page_scaffold_widget.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      top: false,
      bottom: false,
      left: false,
      right: false,
      child: Scaffold(
        body: DashboardPageScaffoldWidget(),
      ),
    );
  }
}
