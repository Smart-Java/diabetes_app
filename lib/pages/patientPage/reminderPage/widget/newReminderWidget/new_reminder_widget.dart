import 'package:diabetes_care/di/injection.dart';
import 'package:diabetes_care/pages/patientPage/reminderPage/bloc/reminder_page_bloc.dart';
import 'package:diabetes_care/pages/patientPage/reminderPage/widget/newReminderWidget/new_reminder_widget_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewReminderWidget extends StatelessWidget {
  const NewReminderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ReminderPageBloc>(),
      child: const NewReminderWidgetView(),
    );
  }
}
