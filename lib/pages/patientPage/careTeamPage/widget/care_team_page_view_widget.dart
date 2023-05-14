import 'package:diabetes_care/pages/patientPage/careTeamPage/widget/care_team_header_widget.dart';
import 'package:diabetes_care/pages/patientPage/careTeamPage/widget/care_team_list_widget.dart';
import 'package:diabetes_care/pages/patientPage/careTeamPage/widget/care_team_search_widget.dart';
import 'package:flutter/material.dart';

class CareTeamPageViewWidget extends StatelessWidget {
  const CareTeamPageViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          CareTeamHeaderWidget(),
          CareTeamSearchWidget(),
          CareTeamListWidet(),
        ],
      ),
    );
  }
}
