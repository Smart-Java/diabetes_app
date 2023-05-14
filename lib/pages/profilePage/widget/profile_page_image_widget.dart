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
        decoration: const BoxDecoration(
          color: AppColors.whiteColor,
          shape: BoxShape.circle,
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
