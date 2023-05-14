import 'package:auto_route/auto_route.dart';
import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:flutter/material.dart';

class BloodGlucoseWidget extends StatefulWidget {
  const BloodGlucoseWidget({Key? key}) : super(key: key);

  @override
  State<BloodGlucoseWidget> createState() => _BloodGlucoseWidgetState();
}

class _BloodGlucoseWidgetState extends State<BloodGlucoseWidget> {
  List<String> glucoseList = [];
  List<String> descriptionList = [];

  String glucoseChoiceValue = '';
  String descriptionChoiceValue = '';

  bool isThereErrorForGlucoseField = false;
  bool isThereErrorForDescriptionField = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      if (glucoseList.isNotEmpty) {
        glucoseChoiceValue = glucoseList[0];
      }
      if (descriptionList.isNotEmpty) {
        descriptionChoiceValue = descriptionList[0];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
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
                  context.router.pop();
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
      content: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: [
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
                    contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 20),
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
                    contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 20),
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
                  Expanded(child: dayModeWidget(isItMorning: true)),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(child: dayModeWidget(isItMorning: false)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget dayModeWidget({required bool isItMorning}) {
  return Container(
    height: 45.0,
    // width: 130.0,
    decoration: BoxDecoration(
      color: AppColors.secondaryColor,
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
