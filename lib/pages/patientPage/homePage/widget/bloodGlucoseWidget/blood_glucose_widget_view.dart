import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:diabetes_care/pages/patientPage/homePage/bloc/event/home_page_event.dart';
import 'package:diabetes_care/pages/patientPage/homePage/bloc/home_page_bloc.dart';
import 'package:diabetes_care/pages/patientPage/homePage/bloc/state/home_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BloodGlucoseWidgetView extends StatefulWidget {
  const BloodGlucoseWidgetView({Key? key}) : super(key: key);

  @override
  State<BloodGlucoseWidgetView> createState() => _BloodGlucoseWidgetViewState();
}

class _BloodGlucoseWidgetViewState extends State<BloodGlucoseWidgetView> {
  List<String> glucoseList = [
    '',
  ];
  List<String> descriptionList = ['', 'Before Meal', 'Pre-Meal', 'Post-Meal'];

  List<String> timeList = [];

  String glucoseChoiceValue = '';
  String descriptionChoiceValue = '';

  bool isThereErrorForGlucoseField = false;
  bool isThereErrorForDescriptionField = false;

  bool isMorningHoursSelected = true;

  bool isRequestInProgress = false;

  bool isRequestSuccessful = false;

  int selectedTimeIndex = 0;

  String selectedTime = '';

  String errorSuccessText = '';

  Size deviceSize = const Size(0, 0);

  @override
  void initState() {
    super.initState();
    for (int value = 1; value <= 100; value++) {
      glucoseList.add('$value');
    }
    for (int timeValue = 1; timeValue <= 12; timeValue++) {
      timeList.add('$timeValue:00');
    }
    setState(() {
      if (glucoseList.isNotEmpty) {
        glucoseChoiceValue = glucoseList[0];
      }
      if (descriptionList.isNotEmpty) {
        descriptionChoiceValue = descriptionList[0];
      }
      if (timeList.isNotEmpty) {
        selectedTime = isMorningHoursSelected == true
            ? '${timeList[0]} AM'
            : '${timeList[0]} PM';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    setState(() {
      deviceSize = size;
    });
    return BlocConsumer<HomePageBloc, HomePageState>(
      listener: (context, state) {
        if (state.isAddRequestInProgress == true) {
          setState(() {
            isRequestInProgress = state.isAddRequestInProgress!;
          });
        } else {
          if (state.isAddRequestInProgress == false) {
            setState(() {
              isRequestInProgress = state.isAddRequestInProgress!;
            });
          }
        }

        if (state.requestMessage != null && state.requestMessage!.isNotEmpty) {
          setState(() {
            errorSuccessText = state.requestMessage!;
          });
        }

        if (state.isAddRequestSuccessful == true) {
          setState(() {
            isRequestSuccessful = true;
          });
          Navigator.pop(context);
          displayMessage(context, state.requestMessage!);
        }
      },
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: AlertDialog(
            contentPadding: const EdgeInsets.all(15.0),
            title: Padding(
              padding: const EdgeInsets.only(
                top: 0.0,
                left: 5.0,
                bottom: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 60.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.center,
                            colors: [
                              AppColors.navContainerColor.withOpacity(0.68),
                              AppColors.navContainerColor.withOpacity(0.17),
                            ],
                          ),
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          size: 26.0,
                          color: AppColors.arrowBackColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Text(
                    'Blood Glucose\nMeasurement',
                    style: TextStyle(
                      color: AppColors.dashboardTextColor,
                      fontSize: 18.00,
                      fontWeight: FontWeight.w800,
                    ),
                  )
                ],
              ),
            ),
            // content: Padding(
            //   padding: const EdgeInsets.only(top: 8.0),
            //   child: timeSchedules(context: context),
            // ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        errorSuccessText,
                        style: TextStyle(
                          color: isRequestSuccessful == true
                              ? AppColors.greenColor
                              : AppColors.redColor,
                          fontSize: 14.00,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  choiceCardWidget(
                    child: DropdownButtonFormField(
                      items: glucoseList.map((String choice) {
                        return DropdownMenuItem(
                            value: choice,
                            child: Text(
                              choice,
                              style: const TextStyle(
                                color: AppColors.popUpDropDownColor,
                              ),
                            ));
                      }).toList(),
                      onChanged: (value) {
                        var newGlucoseChoiceValue = value as String;

                        setState(() {
                          if (newGlucoseChoiceValue.isNotEmpty &&
                              isThereErrorForGlucoseField == true) {
                            isThereErrorForGlucoseField =
                                !isThereErrorForGlucoseField;
                          }
                          glucoseChoiceValue = newGlucoseChoiceValue;
                        });
                      },
                      value: glucoseChoiceValue,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                        filled: true,
                        fillColor: AppColors.textFieldFilledColor,
                      ),
                    ),
                    iconData: Icons.water_drop_sharp,
                  ),
                  choiceCardWidget(
                    child: DropdownButtonFormField(
                      items: descriptionList.map((String choice) {
                        return DropdownMenuItem(
                            value: choice,
                            child: Text(
                              choice,
                              style: const TextStyle(
                                color: AppColors.popUpDropDownColor,
                              ),
                            ));
                      }).toList(),
                      onChanged: (value) {
                        var newDescriptionChoiceValue = value as String;

                        setState(() {
                          if (newDescriptionChoiceValue.isNotEmpty &&
                              isThereErrorForDescriptionField == true) {
                            isThereErrorForDescriptionField =
                                !isThereErrorForDescriptionField;
                          }
                          descriptionChoiceValue = newDescriptionChoiceValue;
                        });
                      },
                      value: descriptionChoiceValue,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                        filled: true,
                        fillColor: AppColors.textFieldFilledColor,
                      ),
                    ),
                    iconData: Icons.book,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        'Time',
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: isRequestInProgress == false
                              ? () {
                                  setState(() {
                                    isMorningHoursSelected = true;
                                    selectedTime = '${timeList[0]} AM';
                                  });
                                }
                              : null,
                          child: dayModeWidget(
                            isItMorning: true,
                            color: isMorningHoursSelected == true
                                ? AppColors.secondaryColor
                                : AppColors.secondaryColor.withOpacity(0.5),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: isRequestInProgress == false
                              ? () {
                                  setState(() {
                                    isMorningHoursSelected = false;
                                    selectedTime = '${timeList[0]} PM';
                                  });
                                }
                              : null,
                          child: dayModeWidget(
                            isItMorning: false,
                            color: isMorningHoursSelected == false
                                ? AppColors.secondaryColor
                                : AppColors.secondaryColor.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: timeSchedules(context: context),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 10.0,
                    ),
                    child: GestureDetector(
                      onTap: isRequestInProgress == false
                          ? () {
                              validateRequiredFields(context: context);
                            }
                          : null,
                      child: Container(
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryColor,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Center(
                          child: Text(
                            isRequestInProgress == true
                                ? 'Processing...'
                                : 'Add',
                            style: Theme.of(context).textTheme.button,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget timeSchedules({required BuildContext context}) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: timeList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 2.0,
        mainAxisSpacing: 2.0,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedTimeIndex = index;
              selectedTime = isMorningHoursSelected == true
                  ? '${timeList[index]} AM'
                  : '${timeList[index]} PM';
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: selectedTimeIndex == index
                  ? AppColors.secondaryColor
                  : AppColors.whiteColor,
              borderRadius: BorderRadius.circular(3.0),
              border: Border.all(
                color: selectedTimeIndex == index
                    ? AppColors.secondaryColor
                    : AppColors.dividerColor,
              ),
            ),
            child: Center(
              child: Text(
                isMorningHoursSelected == true
                    ? '${timeList[index]} AM'
                    : '${timeList[index]} PM',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: selectedTimeIndex == index
                      ? AppColors.whiteColor
                      : AppColors.textColor,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> validateRequiredFields({required BuildContext context}) async {
    if (glucoseChoiceValue.isNotEmpty &&
        descriptionChoiceValue.isNotEmpty &&
        selectedTime.isNotEmpty) {
      setState(() {
        errorSuccessText = '';
      });
      await submitNewGlucoseReading(context: context);
    } else {
      setState(() {
        errorSuccessText = 'All fields are required';
      });
    }
  }

  void displayMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(message),
        ),
        duration: const Duration(
          seconds: 2,
        ),
        backgroundColor: AppColors.snackBarBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.only(
          bottom: deviceSize.height - 100,
          right: 10.0,
          left: 10.0,
        ),
      ),
    );
  }

  Future<void> submitNewGlucoseReading({required BuildContext context}) async {
    BlocProvider.of<HomePageBloc>(context).add(
      AddGlucoseReadingHomePageEvent(
        description: descriptionChoiceValue,
        glucoseValue: double.parse(glucoseChoiceValue),
        time: selectedTime,
      ),
    );
  }
}

Widget dayModeWidget({
  required bool isItMorning,
  required Color color,
}) {
  return Container(
    height: 45.0,
    // width: 130.0,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 27.0,
            width: 28.0,
            decoration: BoxDecoration(
              color: AppColors.timeDesColor,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Icon(
              isItMorning == true ? Icons.light_mode : Icons.mode_night,
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(
            width: 2.0,
          ),
          Text(
            isItMorning == true ? 'Morning' : 'Evening',
            style: const TextStyle(
              color: AppColors.timeDesColor,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    ),
  );
}

Widget choiceCardWidget({required Widget child, required IconData iconData}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10.0),
    child: SizedBox(
      height: 60.0,
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 35.0,
                width: 35.0,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Center(
                  child: Icon(
                    iconData,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
            ),
            Expanded(child: child),
          ],
        ),
      ),
    ),
  );
}
