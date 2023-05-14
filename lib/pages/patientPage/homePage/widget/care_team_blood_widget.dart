import 'package:auto_route/auto_route.dart';
import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:diabetes_care/config/appRouterHandler/app_router.dart';
import 'package:diabetes_care/pages/patientPage/homePage/widget/bloodGlucoseWidget/blood_glucose_widget.dart';
import 'package:flutter/material.dart';

class CareTeamBloodWidget extends StatelessWidget {
  const CareTeamBloodWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              context.router.push(const CareTeamRoute());
            },
            child: customItemBgWidget(
              child: Row(
                children: const [
                  Expanded(
                    child: SizedBox(
                      height: 40.0,
                      child: Card(
                        elevation: 2.0,
                        color: AppColors.careTeamColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        ),
                        child: Icon(
                          Icons.people,
                          color: AppColors.dashboardTextColor,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Care Team',
                    style: TextStyle(
                      color: AppColors.dashboardTextColor,
                      fontSize: 15.39,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: AppColors.dashboardTextColor,
                    size: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: GestureDetector(
            onTap: () async {
              await showDialog(
                context: context,
                builder: (context) {
                  return const BloodGlucoseWidget();
                },
              );
            },
            child: customItemBgWidget(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      'INPUT BLOOD \nGLUCOSE LEVEL',
                      style: TextStyle(
                        color: AppColors.dashboardTextColor,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: Icon(
                      Icons.add_circle_outline,
                      color: AppColors.dashboardTextColor,
                      size: 30,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget customItemBgWidget({required Widget child}) {
    return Container(
      height: 80.0,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [
              AppColors.secondaryColor.withOpacity(1),
              AppColors.primaryColor.withOpacity(0.65),
            ],
          ),
          borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      ),
    );
  }
}
