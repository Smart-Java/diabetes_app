import 'package:diabetes_care/di/injection.dart';
import 'package:diabetes_care/pages/patientPage/dietPage/bloc/diet_page_bloc.dart';
import 'package:diabetes_care/pages/patientPage/dietPage/widget/diet_page_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DietPage extends StatelessWidget {
  const DietPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      left: false,
      right: false,
      child: BlocProvider(
        create: (context) => getIt<DietPageBloc>(),
        child: const DietPageViewWidget(),
      ),
    );
  }
}
