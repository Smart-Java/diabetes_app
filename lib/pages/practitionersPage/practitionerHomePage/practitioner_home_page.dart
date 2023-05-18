import 'package:diabetes_care/di/injection.dart';
import 'package:diabetes_care/pages/practitionersPage/practitionerHomePage/bloc/practitioner_home_page_bloc.dart';
import 'package:diabetes_care/pages/practitionersPage/practitionerHomePage/widget/practitioner_home_page_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PractitionerHomePage extends StatelessWidget {
  final bool isItForDietitian;
  const PractitionerHomePage({Key? key, required this.isItForDietitian,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      left: false,
      right: false,
      child: BlocProvider(
        create: (context) => getIt<PractitionerHomePageBloc>(),
        child: PractitionerHomePageViewWidget(
          isItForDietitian: isItForDietitian,
        ),
      ),
    );
  }
}
