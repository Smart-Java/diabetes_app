import 'package:diabetes_care/di/injection.dart';
import 'package:diabetes_care/pages/practitionersPage/practitionerHomePage/bloc/practitioner_home_page_bloc.dart';
import 'package:diabetes_care/pages/practitionersPage/practitionerHomePage/widget/scheduleWidget/patient_schedule_widget_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientScheduleWidget extends StatelessWidget {
  final String patientEmail;
  final String patientName;
  const PatientScheduleWidget({Key? key, required this.patientEmail, required this.patientName,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PractitionerHomePageBloc>(),
      child: PatientScheduleWidgetView(
        patientEmail: patientEmail,
        patientName: patientName,
      ),
    );
  }
}
