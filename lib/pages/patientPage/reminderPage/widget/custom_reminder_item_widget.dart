import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomReminderItemWidget extends StatelessWidget {
  final String title;
  final String date;
  final String time;
  final String reminderMode;
  const CustomReminderItemWidget({
    Key? key,
    required this.date,
    required this.time,
    required this.title,
    required this.reminderMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: AppColors.dashboardTextColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    date,
                    style: const TextStyle(
                      color: AppColors.reminderColor,
                      fontSize: 12.00,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      time,
                      style: const TextStyle(
                        color: AppColors.secondaryColor,
                        fontSize: 14.00,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      reminderMode,
                      style: const TextStyle(
                        color: AppColors.dashboardTextColor,
                        fontSize: 14.00,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_vert,
                        color: AppColors.reminderColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(
          color: AppColors.dividerColor,
          height: 2.0,
          thickness: 1.0,
        ),
      ],
    );
  }
}
