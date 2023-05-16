import 'package:auto_route/auto_route.dart';
import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:diabetes_care/config/appRouterHandler/app_router.dart';
import 'package:diabetes_care/config/appShimmerEffect/app_shimmer_effect.dart';
import 'package:diabetes_care/pages/patientPage/homePage/bloc/home_page_bloc.dart';
import 'package:diabetes_care/pages/patientPage/homePage/bloc/state/home_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GlucoseViewWidget extends StatefulWidget {
  const GlucoseViewWidget({Key? key}) : super(key: key);

  @override
  State<GlucoseViewWidget> createState() => _GlucoseViewWidgetState();
}

class _GlucoseViewWidgetState extends State<GlucoseViewWidget> {
  String time = '';
  String rating = '';
  double glucoseValue = 0.0;
  bool isRequestInProgress = false;
  List glucoseReadingData = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageBloc, HomePageState>(
      listener: (context, state) {
        if (state.lastGlucoseLevel != null &&
            state.lastGlucoseLevel!.isNotEmpty) {
          setState(() {
            glucoseValue = double.parse(state.lastGlucoseLevel!);
          });
        }

        if (state.lastGlucoseRating != null &&
            state.lastGlucoseRating!.isNotEmpty) {
          setState(() {
            rating = state.lastGlucoseRating!;
          });
        }

        if (state.isLastReadingRequestInProgress == true) {
          setState(() {
            isRequestInProgress = state.isLastReadingRequestInProgress!;
          });
        } else {
          if (state.isLastReadingRequestInProgress == false) {
            setState(() {
              isRequestInProgress = state.isLastReadingRequestInProgress!;
            });
          }
        }

        if (state.readingsDataList != null &&
            state.readingsDataList!.isNotEmpty) {
          setState(() {
            glucoseReadingData = state.readingsDataList!;
          });
        }

        if (state.lastGlucoseTime != null &&
            state.lastGlucoseTime!.isNotEmpty) {
          // DateTime lastDateTime = DateTime.parse(state.lastGlucoseTime!);
          // TimeOfDay timeOfDay = TimeOfDay.fromDateTime(lastDateTime);
          setState(() {
            time = state.lastGlucoseTime!;
            // time = timeOfDay.format(context);
          });
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.router.push(GlucoseReadingRoute(
              dataReading: glucoseReadingData,
            ));
          },
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 7.0,
                vertical: 5.0,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Glucose',
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                                const Text(
                                  'mg/dL',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.0,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      isRequestInProgress == false
                          ? Align(
                              alignment: AlignmentDirectional.topEnd,
                              child: glucoseValue != 0.0
                                  ? Row(
                                      children: [
                                        Text(
                                          'Last monitoring at $time',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.0,
                                              color: AppColors.whiteColor),
                                        ),
                                        const Icon(
                                          Icons.arrow_forward,
                                          size: 20.0,
                                          color: AppColors.whiteColor,
                                        ),
                                      ],
                                    )
                                  : Container(),
                            )
                          : const Align(
                              alignment: AlignmentDirectional.topEnd,
                              child: AppShimmerEffect.rectangular(
                                height: 20.0,
                                width: 40.0,
                              ),
                            ),
                    ],
                  ),
                  Center(
                    child: isRequestInProgress == false
                        ? Text(
                            '$glucoseValue',
                            style: const TextStyle(
                              fontSize: 36.0,
                              fontWeight: FontWeight.bold,
                              color: AppColors.whiteColor,
                            ),
                          )
                        : const Center(
                            child: AppShimmerEffect.rectangular(
                              height: 20.0,
                              width: 30.0,
                            ),
                          ),
                  ),
                  isRequestInProgress == false
                      ? glucoseValue != 0.0
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Checkbox(
                                  value: true,
                                  checkColor: AppColors.whiteColor,
                                  activeColor: AppColors.normalIconTextColor,
                                  onChanged: (value) {},
                                ),
                                Text(
                                  rating,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.normalIconTextColor,
                                    fontSize: 16.0,
                                  ),
                                )
                              ],
                            )
                          : Container()
                      : const Align(
                          alignment: AlignmentDirectional.bottomEnd,
                          child: AppShimmerEffect.rectangular(
                              height: 20.0, width: 40.0),
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
