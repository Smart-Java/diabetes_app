import 'package:diabetes_care/pages/patientPage/glucoseReadingPage/widget/glucose_page_view_widget.dart';
import 'package:flutter/material.dart';

class GlucoseReadingViewPage extends StatelessWidget {
  final List dataReading;
  const GlucoseReadingViewPage({Key? key, required this.dataReading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      left: false,
      right: false,
      child: Scaffold(
        body: GlucosePageViewWidget(
          dataReading: dataReading,
        ),
      ),
    );
  }
}
