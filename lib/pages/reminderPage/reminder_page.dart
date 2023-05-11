import 'package:diabetes_care/pages/reminderPage/widget/reminder_page_view_widget.dart';
import 'package:flutter/material.dart';

class ReminderPage extends StatelessWidget {
  const ReminderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      top: false,
      bottom: false,
      left: false,
      right: false,
      child: Scaffold(
        body: ReminderPageViewWidget(),
      ),
    );
  }
}
