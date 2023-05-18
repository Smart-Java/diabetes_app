import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:flutter/material.dart';

class PractitionerHeaderWidget extends StatelessWidget {
  final Widget childWidget;
  const PractitionerHeaderWidget({Key? key, required this.childWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150.0,
      decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.0),
          )),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
        ),
        child: Align(
          alignment: AlignmentDirectional.center,
          child: Row(
            children: [
              Expanded(
                child: childWidget,
              ),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: appHeaderExtraIcon(
                        iconData: Icons.notifications,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: appHeaderExtraIcon(
                        iconData: Icons.settings,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget appHeaderExtraIcon({required IconData iconData}) {
    return Icon(
      iconData,
      color: AppColors.whiteColor,
      size: 30.0,
    );
  }
}
