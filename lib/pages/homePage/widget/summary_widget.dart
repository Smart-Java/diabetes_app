import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:flutter/material.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            rowItemChild(
              isItBad: true,
              title: 'Average',
              unit: 'mg/dL',
              unitValue: '6.2',
            ),
            rowItemChild(
              isItBad: false,
              title: 'Lowest AVG.',
              unit: 'mg/dL',
              unitValue: '6.2',
            ),
            rowItemChild(
              isItBad: false,
              title: 'Highest AVG.',
              unit: 'mg/dL',
              unitValue: '6.2',
            ),
          ],
        ),
      ),
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
