import 'package:diabetes_care/pages/patientPage/glucoseReadingPage/widget/glucose_reading_list_widget.dart';
import 'package:diabetes_care/util/pageHeaderWidget/patient_page_header_widget.dart';
import 'package:flutter/material.dart';

class GlucosePageViewWidget extends StatelessWidget {
  final List dataReading;
  const GlucosePageViewWidget({
    Key? key,
    required this.dataReading,
  }) : super(key: key);

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
                'Glucose Readings',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 150.0,
            right: 5.0,
            left: 5.0,
          ),
          child: GlucoseReadingListWidet(
            dataReading: dataReading,
          ),
        )
      ],
    );
  }
}
