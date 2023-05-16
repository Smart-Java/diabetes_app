import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return Column(
      children: [
        Card(
          elevation: 0.0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
            side: BorderSide.none,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      color: AppColors.greenColor,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'asset/images/diet/diet.svg',
                        height: 20.0,
                      ),
                    ),
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.dashboardTextColor,
                    fontSize: 18.0,
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
        ),
        const Divider(
          color: AppColors.dividerColor,
          height: 2.0,
          thickness: 1.0,
        )
      ],
    );
  }
}
