import 'package:diabetes_care/pages/homePage/widget/care_team_blood_widget.dart';
import 'package:diabetes_care/pages/homePage/widget/glucose_view_widget.dart';
import 'package:diabetes_care/pages/homePage/widget/summary_widget.dart';
import 'package:flutter/material.dart';

class DashboardDetailsViewWidget extends StatelessWidget {
  const DashboardDetailsViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.only(
                top: 10.0,
              ),
              child: GlucoseViewWidget(),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10.0,
              ),
              child: CareTeamBloodWidget(),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10.0,
              ),
              child: SummaryWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
