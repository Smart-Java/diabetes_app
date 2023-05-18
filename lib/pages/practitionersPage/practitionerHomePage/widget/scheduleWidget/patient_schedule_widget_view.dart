// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:diabetes_care/pages/practitionersPage/practitionerHomePage/bloc/event/practitioner_home_page_event.dart';
import 'package:diabetes_care/pages/practitionersPage/practitionerHomePage/bloc/practitioner_home_page_bloc.dart';
import 'package:diabetes_care/pages/practitionersPage/practitionerHomePage/bloc/state/practitoner_home_page_state.dart';
import 'package:diabetes_care/util/appUIConstant/app_ui_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientScheduleWidgetView extends StatefulWidget {
  final String patientEmail;
  final String patientName;
  const PatientScheduleWidgetView({
    Key? key,
    required this.patientEmail,
    required this.patientName,
  }) : super(key: key);

  @override
  State<PatientScheduleWidgetView> createState() =>
      _PatientScheduleWidgetViewState();
}

class _PatientScheduleWidgetViewState extends State<PatientScheduleWidgetView> {
  final TextEditingController selectedDateController = TextEditingController();

  List<String> timeList = [];

  bool isMorningHoursSelected = true;

  bool isRequestInProgress = false;

  bool isRequestSuccessful = false;

  bool isThereErrorInDateSelection = false;

  int selectedTimeIndex = 0;

  String selectedTimeInterval = '';

  String selectedDate = '';

  String errorSuccessText = '';

  Size deviceSize = const Size(0, 0);

  @override
  void initState() {
    super.initState();
    for (int timeValue = 1; timeValue <= 12; timeValue++) {
      timeList.add('$timeValue:00');
    }
    setState(() {
      if (timeList.isNotEmpty) {
        selectedTimeInterval = isMorningHoursSelected == true
            ? '${timeList[0]} AM - ${timeList[1]} AM'
            : '${timeList[0]} PM - ${timeList[1]} PM';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    setState(() {
      deviceSize = size;
    });
    return BlocConsumer<PractitionerHomePageBloc, PractitionerHomePageState>(
      listener: (context, state) {
        if (state.isScheduleRequestInProgress == true) {
          setState(() {
            isRequestInProgress = state.isScheduleRequestInProgress!;
          });
        } else {
          if (state.isScheduleRequestInProgress == false) {
            setState(() {
              isRequestInProgress = state.isScheduleRequestInProgress!;
            });
          }
        }

        if (state.requestMessage != null && state.requestMessage!.isNotEmpty) {
          setState(() {
            errorSuccessText = state.requestMessage!;
          });
        }

        if (state.isScheduleRequestSuccessful == true) {
          setState(() {
            isRequestSuccessful = state.isScheduleRequestSuccessful!;
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
                    'Add New\nSchedule',
                    style: TextStyle(
                      color: AppColors.dashboardTextColor,
                      fontSize: 18.00,
                      fontWeight: FontWeight.w800,
                    ),
                  )
                ],
              ),
            ),
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
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: selectedDateController,
                      onTap: () {
                        _selectDate();
                      },
                      readOnly: true,
                      onChanged: (value) {
                        if (selectedDateController.text.isNotEmpty &&
                            isThereErrorInDateSelection == true) {
                          setState(() {
                            isThereErrorInDateSelection =
                                !isThereErrorInDateSelection;
                          });
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Select Date',
                        suffixIcon: IconButton(
                          onPressed: () async {
                            _selectDate();
                          },
                          icon: const Icon(
                            Icons.calendar_month,
                            color: AppColors.textFieldBorderColor,
                          ),
                        ),
                        errorText: isThereErrorInDateSelection == true
                            ? 'Select date'
                            : null,
                        errorStyle: errorTextStyle,
                        hintStyle: const TextStyle(
                          color: AppColors.blackColor,
                        ),
                        filled: true,
                        fillColor: AppColors.textFieldFilledColor,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                    isIconRequired: false,
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
                                    selectedTimeInterval =
                                        '${timeList[0]} AM - ${timeList[1]} AM';
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
                                    selectedTimeInterval =
                                        '${timeList[0]} PM - ${timeList[1]} PM';
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
              selectedTimeInterval = isMorningHoursSelected == true
                  ? '${timeList[index]} AM - ${timeList[index + 1]} AM'
                  : '${timeList[index]} PM - ${timeList[index + 1]} PM';
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

  void _selectDate() async {
    var today = DateTime.now();
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: today,
      firstDate: today,
      lastDate: today.add(
        const Duration(days: 30 * 3),
      ),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat.yMMMMEEEEd().format(pickedDate);

      setState(() {
        selectedDateController.text = formattedDate;
        selectedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  OutlineInputBorder dateTextFieldBorder = const OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.textFieldBorderColor,
    ),
  );

  Future<void> validateRequiredFields({required BuildContext context}) async {
    if (selectedDate.isNotEmpty && selectedTimeInterval.isNotEmpty) {
      setState(() {
        errorSuccessText = '';
      });
      await submitNewSchedule(context: context);
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

  Future<void> submitNewSchedule({required BuildContext context}) async {
    BlocProvider.of<PractitionerHomePageBloc>(context).add(
      AddScheduleHomePageEvent(
        patientEmail: widget.patientEmail,
        scheduleDate: selectedDate,
        scheduleTime: selectedTimeInterval,
        patientName: widget.patientName,
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

Widget choiceCardWidget({required Widget child, required bool isIconRequired}) {
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
            isIconRequired == true
                ? Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 35.0,
                      width: 35.0,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.bookmark,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),
                  )
                : Container(),
            Expanded(child: child),
          ],
        ),
      ),
    ),
  );
}
