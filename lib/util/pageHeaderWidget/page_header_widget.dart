import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class PageHeaderWidget extends StatelessWidget {
  final Widget childWidget;
  const PageHeaderWidget({Key? key, required this.childWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: DiagonalPathClipperOne(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 180.0,
        decoration: const BoxDecoration(
          color: AppColors.primaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              // top: .0,
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
