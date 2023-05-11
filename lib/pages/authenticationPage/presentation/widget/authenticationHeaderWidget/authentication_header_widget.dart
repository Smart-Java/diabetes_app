import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:flutter/material.dart';

class AuthenticationHeaderWidget extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback navFunctionality;
  const AuthenticationHeaderWidget({
    Key? key,
    required this.description,
    required this.title,
    required this.navFunctionality,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 50.0,
        bottom: 40.0,
      ),
      child: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 40.0,
              ),
              child: GestureDetector(
                onTap: navFunctionality,
                child: Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        AppColors.navContainerColor.withOpacity(0.68),
                        AppColors.navContainerColor.withOpacity(0.17),
                      ],
                    ),
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 26.0,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.center,
            child: Column(
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  description,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
