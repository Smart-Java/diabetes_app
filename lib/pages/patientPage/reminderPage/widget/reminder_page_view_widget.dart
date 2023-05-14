import 'package:diabetes_care/pages/patientPage/reminderPage/widget/reminders_list_widget.dart';
import 'package:diabetes_care/util/pageHeaderWidget/patient_page_header_widget.dart';
import 'package:flutter/material.dart';

class ReminderPageViewWidget extends StatelessWidget {
  const ReminderPageViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: AlignmentDirectional.topStart,
          child: PatientPageHeaderWidget(
            childWidget: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                'Reminder',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            top: 170.0,
            right: 5.0,
            left: 5.0,
          ),
          child: RemindersListWidet(),
        )
      ],
    );
  }
}
