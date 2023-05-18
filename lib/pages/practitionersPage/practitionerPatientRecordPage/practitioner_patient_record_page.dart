import 'package:diabetes_care/pages/patientPage/recordPage/record_page.dart';
import 'package:flutter/material.dart';

class PractitionerPatientsRecordPage extends StatelessWidget {
  final String praPatientEmailOnPraView;
  const PractitionerPatientsRecordPage({Key? key, required this.praPatientEmailOnPraView,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      left: false,
      right: false,
      child: RecordPage(
        isItFromPatientsView: false,
        praPatientEmailOnPraView: praPatientEmailOnPraView,
      ),
    );
  }
}
