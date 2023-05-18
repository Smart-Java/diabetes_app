import 'package:auto_route/auto_route.dart';
import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:diabetes_care/config/appRouterHandler/app_router.dart';
import 'package:diabetes_care/pages/practitionersPage/patientsDetailsPage/bloc/patients_details_page_bloc.dart';
import 'package:diabetes_care/pages/practitionersPage/patientsDetailsPage/bloc/state/patients_details_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicalGlucoseReadingDietWidget extends StatefulWidget {
  final String patientEmail;
  final String patientAccessCode;
  final bool isItForDietitian;
  const MedicalGlucoseReadingDietWidget({
    Key? key,
    required this.patientEmail,
    required this.isItForDietitian,
    required this.patientAccessCode,
  }) : super(key: key);

  @override
  State<MedicalGlucoseReadingDietWidget> createState() =>
      _MedicalGlucoseReadingDietWidgetState();
}

class _MedicalGlucoseReadingDietWidgetState
    extends State<MedicalGlucoseReadingDietWidget> {
  List glucoseReadings = [];

  @override
  Widget build(BuildContext context) {
    return BlocListener<PatientsDetailsPageBloc, PatientsDetailsPageState>(
      listener: (context, state) {
        if (state.readingsDataList != null &&
            state.readingsDataList!.isNotEmpty) {
          setState(() {
            glucoseReadings = state.readingsDataList!;
          });
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    context.router.push(PractitionerPatientsRecordRoute(
                      praPatientEmailOnPraView: widget.patientEmail,
                    ));
                  },
                  child: customItemBgWidget(
                    child: Row(
                      children: const [
                        SizedBox(
                          height: 50.0,
                          width: 50.0,
                          child: Card(
                            elevation: 2.0,
                            color: AppColors.careTeamColor,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)),
                            ),
                            child: Icon(
                              Icons.bookmark_add,
                              color: AppColors.dashboardTextColor,
                            ),
                          ),
                        ),
                        Text(
                          'Medical\nRecord',
                          style: TextStyle(
                            color: AppColors.dashboardTextColor,
                            fontSize: 15.39,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    context.router.push(
                        GlucoseReadingRoute(dataReading: glucoseReadings));
                  },
                  child: customItemBgWidget(
                    child: Row(
                      children: const [
                        SizedBox(
                          height: 50.0,
                          width: 50.0,
                          child: Card(
                            elevation: 2.0,
                            color: AppColors.careTeamColor,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)),
                            ),
                            child: Icon(
                              Icons.water_drop_sharp,
                              color: AppColors.dashboardTextColor,
                            ),
                          ),
                        ),
                        Text(
                          'Glucose \nReadings',
                          style: TextStyle(
                            color: AppColors.dashboardTextColor,
                            fontSize: 15.39,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          widget.isItForDietitian == true
              ? Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    bottom: 10.0,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      context.router.push(PractitionerDietRoute(
                        patientAccessCode: widget.patientAccessCode,
                      ));
                    },
                    child: Center(
                      child: Container(
                        height: 80.0,
                        width: 130.0,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.center,
                              colors: [
                                AppColors.secondaryColor.withOpacity(1),
                                AppColors.primaryColor.withOpacity(0.65),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              SizedBox(
                                height: 50.0,
                                width: 50.0,
                                child: Card(
                                  elevation: 2.0,
                                  color: AppColors.careTeamColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25.0)),
                                  ),
                                  child: Icon(
                                    Icons.food_bank,
                                    color: AppColors.dashboardTextColor,
                                  ),
                                ),
                              ),
                              Text(
                                'Diets\nPlan',
                                style: TextStyle(
                                  color: AppColors.dashboardTextColor,
                                  fontSize: 15.39,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  Widget customItemBgWidget({required Widget child}) {
    return Container(
      height: 80.0,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [
              AppColors.secondaryColor.withOpacity(1),
              AppColors.primaryColor.withOpacity(0.65),
            ],
          ),
          borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      ),
    );
  }
}
