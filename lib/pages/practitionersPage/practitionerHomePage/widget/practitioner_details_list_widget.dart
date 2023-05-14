import 'package:diabetes_care/pages/practitionersPage/practitionerHomePage/widget/custom_patient_list_item_widget.dart';
import 'package:flutter/material.dart';

class PractitionerDetailsListWidget extends StatefulWidget {
  const PractitionerDetailsListWidget({Key? key}) : super(key: key);

  @override
  State<PractitionerDetailsListWidget> createState() =>
      _PractitionerDetailsListWidgetState();
}

class _PractitionerDetailsListWidgetState
    extends State<PractitionerDetailsListWidget> {
  List patientPortifiloList = [
    {
      'name': 'Adam Salisu',
      'value': '10.4',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        itemCount: patientPortifiloList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemBuilder: (context, index) {
          return CustomPatientListItemWidget(
            name: patientPortifiloList[index]['name'],
            value: patientPortifiloList[index]['value'],
          );
        },
      ),
    );
  }
}
