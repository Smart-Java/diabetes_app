import 'package:diabetes_care/pages/patientPage/reminderPage/bloc/event/reminder_page_event.dart';
import 'package:diabetes_care/pages/patientPage/reminderPage/bloc/reminder_page_bloc.dart';
import 'package:diabetes_care/pages/patientPage/reminderPage/widget/reminders_list_widget.dart';
import 'package:diabetes_care/util/pageHeaderWidget/patient_page_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReminderPageViewWidget extends StatefulWidget {
  const ReminderPageViewWidget({Key? key}) : super(key: key);

  @override
  State<ReminderPageViewWidget> createState() => _ReminderPageViewWidgetState();
}

class _ReminderPageViewWidgetState extends State<ReminderPageViewWidget> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ReminderPageBloc>(context).add(const GetAllRemindersReminderPageEvent());
  }
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
            top: 150.0,
            right: 10.0,
            left: 10.0,
          ),
          child: RemindersListWidet(),
        )
      ],
    );
  }
}
