import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:flutter/material.dart';

UnderlineInputBorder textFieldBorder = const UnderlineInputBorder(
  borderSide: BorderSide(
    color: AppColors.primaryColor,
  ),
);

TextStyle errorTextStyle = const TextStyle(
  fontSize: 14.0,
  color: AppColors.redColor,
);

TextStyle hintTextStyle = const TextStyle(fontWeight: FontWeight.bold);

Icon loginIconForm({required IconData icon}) {
  return Icon(
    icon,
    color: AppColors.formIconColor,
  );
}

RoundedRectangleBorder txtFieldBorder = const RoundedRectangleBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(
      15.0,
    ),
  ),
  side: BorderSide(
    color: AppColors.textFieldBorderColor,
  ),
);
