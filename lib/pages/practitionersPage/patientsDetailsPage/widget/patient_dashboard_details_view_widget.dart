import 'package:diabetes_care/pages/practitionersPage/patientsDetailsPage/widget/medical_glucose_reading_diet_widget.dart';
import 'package:diabetes_care/pages/practitionersPage/patientsDetailsPage/widget/patients_summary_widget.dart';
import 'package:flutter/material.dart';

class PatientDashboardDetailsViewWidget extends StatelessWidget {
  final String patientEmail;
  final String patientAccessCode;
  final bool isItForDietitian;
  const PatientDashboardDetailsViewWidget({
    Key? key,
    required this.patientEmail,
    required this.patientAccessCode,
    required this.isItForDietitian,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
              ),
              child: MedicalGlucoseReadingDietWidget(
                patientEmail: patientEmail,
                isItForDietitian: isItForDietitian,
                patientAccessCode: patientAccessCode,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 20.0,
              ),
              child: PatientsSummaryWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
