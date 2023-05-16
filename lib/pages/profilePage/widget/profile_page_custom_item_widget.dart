import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:flutter/material.dart';

class ProfilePageCustomItemWidget extends StatelessWidget {
  final String title;
  final String description;
  const ProfilePageCustomItemWidget({
    Key? key,
    required this.title,
    required this.description,
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
          child: Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.dashboardTextColor,
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    description,
                    style: const TextStyle(
                      color: AppColors.secondaryColor,
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.clip,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
