import 'package:diabetes_care/pages/patientPage/recordPage/widget/record_page_view_widget.dart';
import 'package:flutter/material.dart';

class RecordPage extends StatelessWidget {
  const RecordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      top: false,
      bottom: false,
      left: false,
      right: false,
      child: Scaffold(
        body: RecordPageViewWidget(),
      ),
    );
  }
}