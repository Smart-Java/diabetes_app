import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:diabetes_care/util/appUIConstant/app_ui_constant.dart';
import 'package:flutter/material.dart';

class CareTeamSearchWidget extends StatefulWidget {
  const CareTeamSearchWidget({Key? key}) : super(key: key);

  @override
  State<CareTeamSearchWidget> createState() => _CareTeamSearchWidgetState();
}

class _CareTeamSearchWidgetState extends State<CareTeamSearchWidget> {
  final nameController = TextEditingController();

  final formStateKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      child: Form(
        key: formStateKey,
        child: Card(
          elevation: 2.0,
          shape: txtFieldBorder,
          child: TextField(
            controller: nameController,
            keyboardType: TextInputType.emailAddress,
            enabled: !isLoading,
            decoration: const InputDecoration(
              filled: true,
              fillColor: AppColors.textFieldFilledColor,
              prefixIcon: Icon(
                Icons.search,
                color: AppColors.secondaryColor,
                size: 35.0,
              ),
              hintText: 'Search by name',
              hintStyle: TextStyle(
                color: AppColors.searchTextColor,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
              ),
              border: InputBorder.none,
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
            onChanged: (value) {},
          ),
        ),
      ),
    );
  }
}
