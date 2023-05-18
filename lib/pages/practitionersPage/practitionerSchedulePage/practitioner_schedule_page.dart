import 'package:diabetes_care/di/injection.dart';
import 'package:diabetes_care/pages/practitionersPage/practitionerSchedulePage/bloc/practitioner_schedule_page_bloc.dart';
import 'package:diabetes_care/pages/practitionersPage/practitionerSchedulePage/widget/practitioner_schedule_page_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PractitionerSchedulePage extends StatelessWidget {
  const PractitionerSchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        left: false,
        right: false,
        child: BlocProvider(
          create: (context) => getIt<PractitionerSchedulePageBloc>(),
          child: const PractitionerSchedulePageViewWidget()),
      );
  }
}
