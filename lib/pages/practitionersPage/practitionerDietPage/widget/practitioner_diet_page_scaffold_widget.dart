import 'package:diabetes_care/pages/practitionersPage/practitionerDietPage/widget/practitioner_diet_page_form_widget.dart';
import 'package:diabetes_care/util/pageHeaderWidget/practitioner_header_widget.dart';
import 'package:flutter/material.dart';

class PractitionerDietPageScaffoldWidget extends StatefulWidget {
  final String patientAccessCode;
  const PractitionerDietPageScaffoldWidget({
    Key? key,
    required this.patientAccessCode,
  }) : super(key: key);

  @override
  State<PractitionerDietPageScaffoldWidget> createState() =>
      _PractitionerDietPageScaffoldWidgetState();
}

class _PractitionerDietPageScaffoldWidgetState
    extends State<PractitionerDietPageScaffoldWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.topStart,
            child: PractitionerHeaderWidget(
              childWidget: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 5.0,
                      right: 5.0,
                    ),
                    child: Text(
                      'Recommend Diet',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150.0),
            child: PractitionerDietPageFormWidget(
              patientAccessCode: widget.patientAccessCode,
            ),
          )
        ],
      ),
    );
  }
}
