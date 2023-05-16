import 'package:diabetes_care/di/injection.dart';
import 'package:diabetes_care/pages/patientPage/reminderPage/bloc/reminder_page_bloc.dart';
import 'package:diabetes_care/pages/patientPage/reminderPage/widget/reminder_page_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReminderPage extends StatelessWidget {
  const ReminderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      left: false,
      right: false,
      child: BlocProvider(
        create: (context) => getIt<ReminderPageBloc>(),
        child: const ReminderPageViewWidget(),
      ),
    );
  }
}
