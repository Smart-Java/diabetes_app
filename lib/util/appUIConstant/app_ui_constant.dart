import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:flutter/material.dart';

OutlineInputBorder textFieldBorder = const OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(10.0),
  ),
  borderSide: BorderSide(
    color: AppColors.textFieldBorderColor,
  ),
);

TextStyle errorTextStyle = const TextStyle(
  fontSize: 14.0,
  color: AppColors.redColor,
);

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
