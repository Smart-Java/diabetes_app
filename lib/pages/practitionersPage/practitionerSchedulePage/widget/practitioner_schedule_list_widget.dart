import 'package:diabetes_care/config/appShimmerEffect/app_shimmer_effect.dart';
import 'package:diabetes_care/pages/practitionersPage/practitionerSchedulePage/bloc/practitioner_schedule_page_bloc.dart';
import 'package:diabetes_care/pages/practitionersPage/practitionerSchedulePage/bloc/state/practitoner_schedule_page_state.dart';
import 'package:diabetes_care/pages/practitionersPage/practitionerSchedulePage/widget/custom_schedule_list_item_widget.dart';
import 'package:diabetes_care/util/listNotReadyWidget/list_not_ready_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PractitionerScheduleListWidget extends StatefulWidget {
  const PractitionerScheduleListWidget({Key? key}) : super(key: key);

  @override
  State<PractitionerScheduleListWidget> createState() =>
      _PractitionerScheduleListWidgetState();
}

class _PractitionerScheduleListWidgetState
    extends State<PractitionerScheduleListWidget> {
  List scheduleList = [
    {
      'patientEmail': 'Adam Salisu',
      'scheduleTime': '10.00 - 11.00',
    },
  ];

  bool scheduleListReady = true;

  bool loadShimmer = false;

  String emptyScheduleList = 'No schedule list yet';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PractitionerSchedulePageBloc, PractitionerSchedulePageState>(builder: (context, state) {
      return loadShimmer == true
          ? ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 5.0),
                  child: const AppShimmerEffect.rectangular(
                    height: 70,
                    width: double.infinity,
                  ),
                );
              })
          : (scheduleList.isNotEmpty && scheduleListReady == true)
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: ListView.builder(
                    itemCount: scheduleList.length,
                    itemBuilder: (context, index) {
                      return CustomScheduleListItemWidget(
                        scheduleTitle: scheduleList[index]['patientName'],
                        scheduleDuration: scheduleList[index]
                            ['scheduleTime'],
                      );
                    },
                  ),
                )
              : ListNotReadyWidget(
                  message: emptyScheduleList,
                );
    }, listener: (context, state) {
      if (state.patientDataList != null && state.patientDataList!.isNotEmpty) {
        setState(() {
          scheduleList = state.patientDataList!;
        });
      } else {
        setState(() {
          scheduleList = [];
        });
      }

      if (state.isLoading == true) {
        setState(() {
          loadShimmer = state.isLoading!;
        });
      } else {
        if (state.isLoading == false) {
          setState(() {
            loadShimmer = state.isLoading!;
          });
        }
      }
    });
  }
}
