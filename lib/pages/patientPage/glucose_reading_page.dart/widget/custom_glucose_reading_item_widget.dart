import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomGlucoseReadingItemWidget extends StatelessWidget {
  final String imagePath;
  final String glucoseLevel;
  final String time;
  final String date;
  final String unit;
  final String rating;
  final String description;
  const CustomGlucoseReadingItemWidget({
    Key? key,
    required this.description,
    required this.glucoseLevel,
    required this.imagePath,
    required this.rating,
    required this.time,
    required this.unit,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Container(
                height: 30.0,
                width: 200.0,
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    date,
                    style: const TextStyle(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Card(
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      imagePath.isNotEmpty
                          ? Image.asset(
                              imagePath,
                              height: 80.0,
                              width: 100.0,
                            )
                          : const SizedBox(
                              height: 80.0,
                              width: 100,
                            ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Center(
                          child: Text(
                            time,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        itemWidget(
                          title: 'Glucose Level',
                          unitValueOrDescription: glucoseLevel,
                          isThereAnyUnit: true,
                          isItTheLastElement: false,
                        ),
                        itemWidget(
                          title: 'Rating',
                          unitValueOrDescription: rating,
                          isThereAnyUnit: false,
                          isItTheLastElement: false,
                        ),
                        itemWidget(
                          title: 'Description',
                          unitValueOrDescription: description,
                          isThereAnyUnit: false,
                          isItTheLastElement: true,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget itemWidget({
    required String title,
    required String unitValueOrDescription,
    required bool isThereAnyUnit,
    required bool isItTheLastElement,
  }) {
    return Padding(
      padding: isItTheLastElement == true
          ? EdgeInsets.zero
          : const EdgeInsets.only(bottom: 5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.dashboardTextColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              isThereAnyUnit == true
                  ? Row(
                      children: [
                        Text(
                          unitValueOrDescription,
                          style: const TextStyle(
                            color: AppColors.orangeColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Text(
                          'mg/dl',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.0,
                          ),
                        )
                      ],
                    )
                  : Text(
                      unitValueOrDescription,
                      style: const TextStyle(
                        color: AppColors.dashboardTextColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.0,
                      ),
                    ),
            ],
          ),
          isItTheLastElement == false
              ? const Divider(
                  height: 2,
                  thickness: 2.0,
                  color: AppColors.dashboardTextColor,
                )
              : Container(),
        ],
      ),
    );
  }
}
