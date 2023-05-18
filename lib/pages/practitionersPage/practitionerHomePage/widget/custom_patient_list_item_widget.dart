import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomPatientListItemWidget extends StatelessWidget {
  final String value;
  final String name;
  final String scheduleText;
  final VoidCallback scheduleFunctionality;
  final VoidCallback naviagationFunctionality;
  const CustomPatientListItemWidget({
    Key? key,
    required this.name,
    required this.value,
    required this.scheduleText,
    required this.naviagationFunctionality,
    required this.scheduleFunctionality,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.patientPortifolioColor,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              child: Container(
                height: 50.0,
                width: 50.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor,
                ),
                child: const Center(
                  child: Icon(
                    Icons.person,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                name,
                style: const TextStyle(
                  color: AppColors.dashboardTextColor,
                  fontSize: 18.00,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    color: AppColors.dashboardTextColor,
                    fontSize: 14.00,
                  ),
                ),
                const Text(
                  ' | mg/dL',
                  style: TextStyle(
                    color: AppColors.dashboardTextColor,
                    fontSize: 14.00,
                  ),
                ),
              ],
            ),
            Align(
              alignment: AlignmentDirectional.bottomStart,
              child: Row(
                children: [
                  TextButton(
                    onPressed: scheduleFunctionality,
                    child: Text(
                      scheduleText,
                      style: const TextStyle(
                        color: AppColors.secondaryColor,
                        fontSize: 16.00,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: GestureDetector(
                        onTap: naviagationFunctionality,
                        child: Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.textColor,
                          ),
                          child: const Center(
                              child: Icon(
                            Icons.arrow_forward,
                            color: AppColors.blackColor,
                          )),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
