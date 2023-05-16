import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomGlucoseReadingItemWidget extends StatelessWidget {
  final String imagePath;
  final double glucoseLevel;
  final String time;
  final String date;
  final String rating;
  final String description;
  final bool isItBad;
  final bool isItNormal;
  const CustomGlucoseReadingItemWidget({
    Key? key,
    required this.description,
    required this.glucoseLevel,
    required this.imagePath,
    required this.rating,
    required this.time,
    required this.date,
    required this.isItBad,
    required this.isItNormal,
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
                      fontWeight: FontWeight.bold,
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
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 100.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        imagePath.isNotEmpty
                            ? SvgPicture.asset(
                                imagePath,
                              )
                            : const SizedBox(),
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
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          itemWidget(
                            title: 'Glucose Level',
                            unitValueOrDescription: '$glucoseLevel',
                            isThereAnyUnit: true,
                            isItTheLastElement: false,
                            isItBad: isItBad,
                            isItNormal: isItNormal,
                          ),
                          itemWidget(
                            title: 'Rating',
                            unitValueOrDescription: rating,
                            isThereAnyUnit: false,
                            isItTheLastElement: false,
                            isItBad: isItBad,
                            isItNormal: isItNormal,
                          ),
                          itemWidget(
                            title: 'Description',
                            unitValueOrDescription: description,
                            isThereAnyUnit: false,
                            isItTheLastElement: true,
                            isItBad: isItBad,
                            isItNormal: isItNormal,
                          ),
                        ],
                      ),
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
    required bool isItNormal,
    required bool isItBad,
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.dashboardTextColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(
                width: isThereAnyUnit == true ? 10.0 : 20.0,
              ),
              Row(
                children: [
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
                          style: TextStyle(
                            color: isItBad == true
                                ? AppColors.redColor
                                : isItNormal == true
                                    ? AppColors.greenColor
                                    : AppColors.secondaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 14.0,
                          ),
                          overflow: TextOverflow.clip,
                        ),
                ],
              ),
            ],
          ),
          isItTheLastElement == false
              ? Padding(
                  padding: const EdgeInsets.only(
                    top: 5.0,
                    bottom: 2.0,
                  ),
                  child: Container(
                    height: 1.5,
                    width: 195.0,
                    color: AppColors.blackColor,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
