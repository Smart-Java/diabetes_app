import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class PatientPageHeaderWidget extends StatelessWidget {
  final Widget childWidget;
  const PatientPageHeaderWidget({Key? key, required this.childWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 170.0,
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
      ),
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

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();
    path.lineTo(width, height);
    // path.quadraticBezierTo(0, 0, width, height - 50);
    // path.quadraticBezierTo(width / 2, height, width, height - 50);
    path.lineTo(0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
