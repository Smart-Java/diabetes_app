import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:flutter/material.dart';

class GlucoseViewWidget extends StatelessWidget {
  const GlucoseViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      decoration: const BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(7.0),
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
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Row(
                    children: const [
                      Text(
                        'Last monitoring at 9:17',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                            color: AppColors.whiteColor),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 20.0,
                        color: AppColors.whiteColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Center(
              child: Text(
                '10.4',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Checkbox(
                  value: true,
                  checkColor: AppColors.whiteColor,
                  activeColor: AppColors.normalIconTextColor,
                  onChanged: (value) {},
                ),
                const Text(
                  'Normal',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.normalIconTextColor,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
