import 'package:diabetes_care/di/injection.dart';
import 'package:diabetes_care/pages/patientPage/careTeamPage/bloc/care_team_page_bloc.dart';
import 'package:diabetes_care/pages/patientPage/careTeamPage/widget/care_team_page_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CareTeamPage extends StatelessWidget {
  const CareTeamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      left: false,
      right: false,
      child: BlocProvider(
        create: (context) => getIt<CareTeamPageBloc>(),
        child: const CareTeamPageViewWidget(),
      ),
    );
  }
}
