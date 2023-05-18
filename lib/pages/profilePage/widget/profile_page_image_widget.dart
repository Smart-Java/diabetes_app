import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:flutter/material.dart';

class ProfilePageImageWidget extends StatelessWidget {
  const ProfilePageImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10.0,
      ),
      child: Container(
        height: 150.0,
        width: 100.0,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.primaryColor,
            width: 2.0,
          ),
        ),
        child: const Icon(
          Icons.person,
          color: AppColors.primaryColor,
          size: 90.0,
        ),
      ),
    );
  }
}
