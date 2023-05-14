import 'package:diabetes_care/pages/patientPage/careTeamPage/widget/care_team_page_view_widget.dart';
import 'package:flutter/material.dart';

class CareTeamPage extends StatelessWidget {
  const CareTeamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      top: false,
      bottom: false,
      left: false,
      right: false,
      child: Scaffold(
        body: CareTeamPageViewWidget(),
      ),
    );
  }
}
