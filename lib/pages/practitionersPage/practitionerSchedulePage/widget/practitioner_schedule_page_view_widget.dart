import 'dart:async';

import 'package:diabetes_care/pages/practitionersPage/practitionerSchedulePage/bloc/event/practitioner_schedule_page_event.dart';
import 'package:diabetes_care/pages/practitionersPage/practitionerSchedulePage/bloc/practitioner_schedule_page_bloc.dart';
import 'package:diabetes_care/pages/practitionersPage/practitionerSchedulePage/widget/practitioner_schedule_list_widget.dart';
import 'package:diabetes_care/util/pageHeaderWidget/practitioner_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PractitionerSchedulePageViewWidget extends StatefulWidget {
  const PractitionerSchedulePageViewWidget({Key? key}) : super(key: key);

  @override
  State<PractitionerSchedulePageViewWidget> createState() => _PractitionerSchedulePageViewWidgetState();
}

class _PractitionerSchedulePageViewWidgetState extends State<PractitionerSchedulePageViewWidget> {
  
  late Timer updateTimer;
  
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PractitionerSchedulePageBloc>(context)
        .add(GetPraPatientsSchedulePageEvent(isItForUpdate: false));
    updateReadingListings();
  }

  void updateReadingListings() {
    updateTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      BlocProvider.of<PractitionerSchedulePageBloc>(context)
          .add(GetPraPatientsSchedulePageEvent(isItForUpdate: true));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: AlignmentDirectional.topStart,
          child: PractitionerHeaderWidget(
            childWidget: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                'Schedules',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 150.0),
          child: PractitionerScheduleListWidget(),
        )
      ],
    );
  }
}
