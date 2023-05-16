import 'package:diabetes_care/di/injection.dart';
import 'package:diabetes_care/pages/patientPage/homePage/bloc/home_page_bloc.dart';
import 'package:diabetes_care/pages/patientPage/homePage/widget/bloodGlucoseWidget/blood_glucose_widget_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BloodGlucoseWidegt extends StatelessWidget {
  const BloodGlucoseWidegt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomePageBloc>(),
      child: const BloodGlucoseWidgetView(),
    );
  }
}
