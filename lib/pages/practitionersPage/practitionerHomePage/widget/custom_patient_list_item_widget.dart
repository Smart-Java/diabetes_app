import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomPatientListItemWidget extends StatelessWidget {
  final String value;
  final String name;
  const CustomPatientListItemWidget({
    Key? key,
    required this.name,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.patientPortifolioColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Container(
            height: 100.0,
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
          Text(
            name,
            style: const TextStyle(
              color: AppColors.dashboardTextColor,
              fontSize: 20.49,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              Text(
                value,
                style: const TextStyle(
                  color: AppColors.dashboardTextColor,
                  fontSize: 20.49,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Text(
                'mg/dL',
                style: TextStyle(
                  color: AppColors.dashboardTextColor,
                  fontSize: 15.53,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
