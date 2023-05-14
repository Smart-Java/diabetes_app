import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDietItemWidget extends StatelessWidget {
  final String title;
  final String date;
  const CustomDietItemWidget({
    Key? key,
    required this.date,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                color: AppColors.dashboardTextColor,
                fontSize: 16.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Align(
                alignment: AlignmentDirectional.topEnd,
                child: Text(
                  date,
                  style: const TextStyle(
                    color: AppColors.secondaryColor,
                    fontSize: 14.00,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
