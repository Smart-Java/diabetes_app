import 'package:diabetes_care/pages/patientPage/dietPage/widget/dietDetailsPage/widget/diet_details_header_widget.dart';
import 'package:diabetes_care/pages/patientPage/dietPage/widget/dietDetailsPage/widget/diet_details_list_widget.dart';
import 'package:flutter/material.dart';

class DietDetailsPageViewWidget extends StatelessWidget {
  final String title;
  final String data;
  const DietDetailsPageViewWidget({
    Key? key,
    required this.data,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            DietDetailsHeaderWidget(title: title),
            DietDetailsListWidet(data: data),
          ],
        ),
      ),
    );
  }
}
