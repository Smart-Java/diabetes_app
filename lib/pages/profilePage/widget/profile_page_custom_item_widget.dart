import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:flutter/material.dart';

class ProfilePageCustomItemWidget extends StatelessWidget {
  final String text;
  const ProfilePageCustomItemWidget({
    Key? key,
    required this.text,
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
        child: SizedBox(
          width: double.infinity,
          child: Text(
            text,
            style: const TextStyle(
              color: AppColors.dashboardTextColor,
              fontSize: 16.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
