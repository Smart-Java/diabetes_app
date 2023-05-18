import 'dart:async';

import 'package:diabetes_care/pages/patientPage/careTeamPage/bloc/care_team_page_bloc.dart';
import 'package:diabetes_care/pages/patientPage/careTeamPage/bloc/event/care_team_page_event.dart';
import 'package:diabetes_care/pages/patientPage/careTeamPage/widget/care_team_header_widget.dart';
import 'package:diabetes_care/pages/patientPage/careTeamPage/widget/care_team_list_widget.dart';
import 'package:diabetes_care/pages/patientPage/careTeamPage/widget/care_team_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CareTeamPageViewWidget extends StatefulWidget {
  const CareTeamPageViewWidget({Key? key}) : super(key: key);

  @override
  State<CareTeamPageViewWidget> createState() => _CareTeamPageViewWidgetState();
}

class _CareTeamPageViewWidgetState extends State<CareTeamPageViewWidget> {
  late Timer updateTimer;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CareTeamPageBloc>(context)
        .add(GetAllCareTeamsCareTeamPageEvent(
      isItForUpdate: false,
    ));
    updateCareTeamList();
  }

  void updateCareTeamList() {
    updateTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      BlocProvider.of<CareTeamPageBloc>(context)
          .add(GetAllCareTeamsCareTeamPageEvent(
        isItForUpdate: true,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            CareTeamHeaderWidget(),
            CareTeamSearchWidget(),
            CareTeamListWidet(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    updateTimer.cancel();
  }
}
