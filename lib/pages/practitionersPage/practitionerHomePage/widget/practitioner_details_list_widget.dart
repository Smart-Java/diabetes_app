import 'package:auto_route/auto_route.dart';
import 'package:diabetes_care/config/appRouterHandler/app_router.dart';
import 'package:diabetes_care/config/appShimmerEffect/app_shimmer_effect.dart';
import 'package:diabetes_care/pages/practitionersPage/practitionerHomePage/bloc/practitioner_home_page_bloc.dart';
import 'package:diabetes_care/pages/practitionersPage/practitionerHomePage/bloc/state/practitoner_home_page_state.dart';
import 'package:diabetes_care/pages/practitionersPage/practitionerHomePage/widget/custom_patient_list_item_widget.dart';
import 'package:diabetes_care/pages/practitionersPage/practitionerHomePage/widget/scheduleWidget/patient_schedule_widget.dart';
import 'package:diabetes_care/util/listNotReadyWidget/list_not_ready_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PractitionerDetailsListWidget extends StatefulWidget {
  final bool isItForDietitian;
  const PractitionerDetailsListWidget(
      {Key? key, required this.isItForDietitian})
      : super(key: key);

  @override
  State<PractitionerDetailsListWidget> createState() =>
      _PractitionerDetailsListWidgetState();
}

class _PractitionerDetailsListWidgetState
    extends State<PractitionerDetailsListWidget> {
  List patientPortifiloList = [];

  bool loadShimmer = false;

  String practitionerEmptyListMessage = 'No Patients administering to';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PractitionerHomePageBloc, PractitionerHomePageState>(
      listener: (context, state) {
        if (state.patientDataList != null &&
            state.patientDataList!.isNotEmpty) {
          setState(() {
            patientPortifiloList = state.patientDataList!;
          });
        } else {
          setState(() {
            patientPortifiloList = [];
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
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: loadShimmer == true
              ? GridView.builder(
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 3 / 3.5,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const AppShimmerEffect.rectangular(
                        height: 80,
                        width: double.infinity,
                      ),
                    );
                  },
                )
              : patientPortifiloList.isNotEmpty
                  ? GridView.builder(
                      itemCount: patientPortifiloList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        childAspectRatio: 3 / 3.5,
                      ),
                      itemBuilder: (context, index) {
                        return CustomPatientListItemWidget(
                          name: patientPortifiloList[index]['patientName'],
                          value: '${patientPortifiloList[index]
                              ['patientLastGlucoseValue']}',
                          naviagationFunctionality: () {
                            context.router.push(
                              PatientsDetailsRoute(
                                patientEmail: patientPortifiloList[index]
                                    ['patientEmail'],
                                patientName: patientPortifiloList[index]
                                    ['patientName'],
                                patientAccessCode: patientPortifiloList[index]
                                    ['patientAccessCode'],
                                isItForCareGiver: false,
                                isItForDietitian: widget.isItForDietitian,
                              ),
                            );
                          },
                          scheduleFunctionality: () async {
                            await showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return PatientScheduleWidget(
                                  patientEmail: patientPortifiloList[index]
                                      ['patientEmail'],
                                  patientName: patientPortifiloList[index]
                                      ['patientName'],
                                );
                              },
                            );
                          },
                          scheduleText: 'Schedule',
                        );
                      },
                    )
                  : ListNotReadyWidget(message: practitionerEmptyListMessage),
        );
      },
    );
  }
}
