import 'package:auto_route/auto_route.dart';
import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:flutter/material.dart';

class CareTeamHeaderWidget extends StatelessWidget {
  const CareTeamHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 70.0,
        left: 20.0,
        bottom: 20.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: AlignmentDirectional.topStart,
            child: GestureDetector(
              onTap: () {
                context.router.pop();
              },
              child: Container(
                height: 60.0,
                width: 50.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.center,
                    colors: [
                      AppColors.navContainerColor.withOpacity(0.68),
                      AppColors.navContainerColor.withOpacity(0.17),
                    ],
                  ),
                ),
                child: const Icon(
                  Icons.arrow_back,
                  size: 26.0,
                  color: AppColors.arrowBackColor,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 30.0,
          ),
          const Text(
            'Care Team',
            style: TextStyle(
              color: AppColors.dashboardTextColor,
              fontSize: 20.00,
              fontWeight: FontWeight.w800,
            ),
          )
        ],
      ),
    );
  }
}
