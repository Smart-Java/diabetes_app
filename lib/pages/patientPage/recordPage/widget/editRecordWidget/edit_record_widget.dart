import 'package:diabetes_care/di/injection.dart';
import 'package:diabetes_care/pages/patientPage/recordPage/bloc/record_page_bloc.dart';
import 'package:diabetes_care/pages/patientPage/recordPage/widget/editRecordWidget/edit_record_widget_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditRecordWidegt extends StatelessWidget {
  final String cholesterolLevel;
  final String medications;
  final String weight;
  final String height;
  final String physicalActivities;
  final String insulinUsage;
  const EditRecordWidegt({
    Key? key,
    required this.cholesterolLevel,
    required this.height,
    required this.insulinUsage,
    required this.medications,
    required this.physicalActivities,
    required this.weight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RecordPageBloc>(),
      child: EditRecordWidgetView(
        cholesterolLevel: cholesterolLevel,
        height: height,
        insulinUsage: insulinUsage,
        medications: medications,
        physicalActivities: physicalActivities,
        weight: weight,
      ),
    );
  }
}
