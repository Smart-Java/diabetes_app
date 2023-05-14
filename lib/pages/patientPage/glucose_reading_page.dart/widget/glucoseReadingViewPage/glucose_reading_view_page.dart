import 'package:diabetes_care/pages/patientPage/glucose_reading_page.dart/widget/glucose_page_view_widget.dart';
import 'package:flutter/material.dart';

class GlucoseReadingViewPage extends StatelessWidget {
  const GlucoseReadingViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      top: false,
      bottom: false,
      left: false,
      right: false,
      child: Scaffold(
        body: GlucosePageViewWidget(),
      ),
    );
  }
}
