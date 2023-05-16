import 'package:diabetes_care/pages/patientPage/dietPage/widget/dietDetailsPage/widget/diet_details_view_widget.dart';
import 'package:flutter/material.dart';

class DietDetailsPage extends StatelessWidget {
  final String title;
  final String data;
  const DietDetailsPage({Key? key, required this.data, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      left: false,
      right: false,
      child: DietDetailsPageViewWidget(
        title: title,
        data: data,
      ),
    );
  }
}
