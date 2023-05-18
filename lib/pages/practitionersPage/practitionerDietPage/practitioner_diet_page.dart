import 'package:diabetes_care/di/injection.dart';
import 'package:diabetes_care/pages/practitionersPage/practitionerDietPage/bloc/practitioner_diet_page_bloc.dart';
import 'package:diabetes_care/pages/practitionersPage/practitionerDietPage/widget/practitioner_diet_page_scaffold_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PractitionerDietPage extends StatelessWidget {
  final String patientAccessCode;
  const PractitionerDietPage({
    Key? key,
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
        create: (context) => getIt<PractitionerDietPageBloc>(),
        child: PractitionerDietPageScaffoldWidget(
          patientAccessCode: patientAccessCode,
        ),
      ),
    );
  }
}
