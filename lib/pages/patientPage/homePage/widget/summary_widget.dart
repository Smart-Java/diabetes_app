import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:diabetes_care/config/appShimmerEffect/app_shimmer_effect.dart';
import 'package:diabetes_care/pages/patientPage/homePage/bloc/home_page_bloc.dart';
import 'package:diabetes_care/pages/patientPage/homePage/bloc/state/home_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SummaryWidget extends StatefulWidget {
  const SummaryWidget({Key? key}) : super(key: key);

  @override
  State<SummaryWidget> createState() => _SummaryWidgetState();
}

class _SummaryWidgetState extends State<SummaryWidget> {
  double averageGlucoseValue = 0.0;
  double highestGlucoseValue = 0.0;
  double lowestGlucoseValue = 0.0;
  bool isRequestInProgress = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageBloc, HomePageState>(
      listener: (context, state) {
        if (state.lastTwoWeeksAvgGlucoseLevel != null &&
            state.lastTwoWeeksAvgGlucoseLevel != 0.0) {
          setState(() {
            averageGlucoseValue = state.lastTwoWeeksAvgGlucoseLevel!;
          });
        }

        if (state.lastTwoWeeksHighGlucoseLevel != null &&
            state.lastTwoWeeksHighGlucoseLevel != 0.0) {
          setState(() {
            highestGlucoseValue = state.lastTwoWeeksHighGlucoseLevel!;
          });
        }

        if (state.lastTwoWeeksLowGlucoseLevel != null &&
            state.lastTwoWeeksLowGlucoseLevel != 0.0) {
          setState(() {
            lowestGlucoseValue = state.lastTwoWeeksLowGlucoseLevel!;
          });
        }

        if (state.isLastTwoWeeksRequestInProgress == true) {
          setState(() {
            isRequestInProgress = state.isLastTwoWeeksRequestInProgress!;
          });
        } else {
          if (state.isLastTwoWeeksRequestInProgress == false) {
            setState(() {
              isRequestInProgress = state.isLastTwoWeeksRequestInProgress!;
            });
          }
        }
      },
      builder: (context, state) {
        return Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                giveConstantPaddingToChild(
                  child: const Text(
                    'How do you feel today? Here is a summary for the last 14 days',
                    style: TextStyle(
                      color: AppColors.dashboardTextColor,
                    ),
                  ),
                ),
                isRequestInProgress == false
                    ? rowItemChild(
                        isItBad: averageGlucoseValue < 5.0 ? true : false,
                        title: 'Average',
                        unit: 'mg/dL',
                        unitValue: averageGlucoseValue.toStringAsFixed(2),
                      )
                    : giveConstantPaddingToChild(
                        child:
                            const AppShimmerEffect.rectangular(height: 20.0)),
                isRequestInProgress == false
                    ? rowItemChild(
                        isItBad: false,
                        title: 'Lowest Value.',
                        unit: 'mg/dL',
                        unitValue: '$lowestGlucoseValue',
                      )
                    : giveConstantPaddingToChild(
                        child:
                            const AppShimmerEffect.rectangular(height: 20.0)),
                isRequestInProgress == false
                    ? rowItemChild(
                        isItBad: false,
                        title: 'Highest Value.',
                        unit: 'mg/dL',
                        unitValue: '$highestGlucoseValue',
                      )
                    : giveConstantPaddingToChild(
                        child:
                            const AppShimmerEffect.rectangular(height: 20.0)),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget giveConstantPaddingToChild({required Widget child}) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20.0,
      ),
      child: child,
    );
  }

  Widget rowItemChild(
      {required String title,
      required bool isItBad,
      required String unit,
      required String unitValue}) {
    return giveConstantPaddingToChild(
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 11.65,
                    color: AppColors.dashboardTextColor,
                  ),
                ),
                isItBad == true
                    ? Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                        ),
                        child: Container(
                          height: 20.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                            color: AppColors.redColor,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: const Center(
                            child: Text(
                              'Bad',
                              style: TextStyle(
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: Row(
              children: [
                Text(
                  unit,
                  style: const TextStyle(
                      fontSize: 9.71, fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 5.0,
                  ),
                  child: Text(
                    unitValue,
                    style: const TextStyle(
                      color: AppColors.dashboardTextColor,
                      fontSize: 15.53,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
