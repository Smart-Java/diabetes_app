import 'package:diabetes_care/util/pageHeaderWidget/patient_page_header_widget.dart';
import 'package:flutter/material.dart';

class RecordPageViewWidget extends StatelessWidget {
  const RecordPageViewWidget({Key? key}) : super(key: key);

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
                'Record',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
