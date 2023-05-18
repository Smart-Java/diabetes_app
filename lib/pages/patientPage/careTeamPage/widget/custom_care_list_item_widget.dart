import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCareListItemWidget extends StatelessWidget {
  final String name;
  final String position;
  final String imagePath;
  final String emailAddress;
  final String contact;
  final VoidCallback givePermision;
  final String permissionText;
  const CustomCareListItemWidget({
    Key? key,
    required this.name,
    required this.position,
    required this.contact,
    required this.emailAddress,
    required this.imagePath,
    required this.givePermision,
    required this.permissionText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              height: 150.0,
              width: 130.0,
              decoration: const BoxDecoration(
                color: AppColors.bgCareTeamImageColor,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: imagePath.isEmpty
                  ? const Center(
                      child: Icon(
                        Icons.person,
                        color: AppColors.primaryColor,
                        size: 100.0,
                      ),
                    )
                  : Image.network(imagePath),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customTextWidget(
                      color: AppColors.dashboardTextColor,
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      text: name,
                    ),
                    customTextWidget(
                      color: AppColors.secondaryColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      text: position,
                    ),
                    customTextWidget(
                      color: AppColors.dashboardTextColor,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      text: emailAddress,
                    ),
                    customTextWidget(
                      color: AppColors.blackColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      text: contact,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: GestureDetector(
                        onTap: givePermision,
                        child: Container(
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                              child: Text(
                            permissionText,
                            style: Theme.of(context).textTheme.button,
                          )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customTextWidget({
    required String text,
    required Color color,
    required FontWeight fontWeight,
    required double fontSize,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
