import 'package:diabetes_care/pages/practitionersPage/patientsDetailsPage/patients_details_page.dart';
import 'package:flutter/material.dart';

class CarePatientDetailsPage extends StatelessWidget {
  const CarePatientDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      top: false,
      bottom: false,
      left: false,
      right: false,
      child: PatientsDetailsPage(
        patientEmail: '',
            patientName: '',
            patientAccessCode: '',
            isItForCareGiver: true,
            isItForDietitian: false,
      ),
    );
  }
}
