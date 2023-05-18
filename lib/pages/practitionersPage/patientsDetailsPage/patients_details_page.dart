import 'package:diabetes_care/di/injection.dart';
import 'package:diabetes_care/pages/practitionersPage/patientsDetailsPage/bloc/patients_details_page_bloc.dart';
import 'package:diabetes_care/pages/practitionersPage/patientsDetailsPage/widget/patient_details_page_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientsDetailsPage extends StatelessWidget {
  final String patientName;
  final String patientEmail;
  final String patientAccessCode;
  final bool isItForCareGiver;
  final bool isItForDietitian;
  const PatientsDetailsPage({
    Key? key,
    required this.patientEmail,
    required this.patientName,
    required this.isItForCareGiver,
    required this.isItForDietitian,
    required this.patientAccessCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      left: false,
      right: false,
      child: BlocProvider(
        create: (context) => getIt<PatientsDetailsPageBloc>(),
        child: PatientDetailsPageViewWidget(
          patientEmail: patientEmail,
          patientName: patientName,
          isItForCareGiver: isItForCareGiver,
          isItForDietitian: isItForDietitian,
          patientAccessCode: patientAccessCode,
        ),
      ),
    );
  }
}
