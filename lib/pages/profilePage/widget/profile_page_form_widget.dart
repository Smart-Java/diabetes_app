import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:diabetes_care/pages/profilePage/widget/profile_page_custom_item_widget.dart';
import 'package:diabetes_care/util/appUIConstant/app_ui_constant.dart';
import 'package:flutter/material.dart';

class ProfilePageFormWidget extends StatefulWidget {
  const ProfilePageFormWidget({Key? key}) : super(key: key);

  @override
  State<ProfilePageFormWidget> createState() => _ProfilePageFormWidgetState();
}

class _ProfilePageFormWidgetState extends State<ProfilePageFormWidget> {
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final accessNumberController = TextEditingController();

  final formStateKey = GlobalKey<FormState>();

  bool isThereErrorInName = false;
  bool isThereErrorInUsername = false;
  bool isThereErrorInAccessNumber = false;

  bool editProfile = false;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: formStateKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 15.0,
                ),
                child: editProfile == true
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Card(
                            elevation: 2.0,
                            shape: txtFieldBorder,
                            child: TextField(
                              controller: nameController,
                              keyboardType: TextInputType.emailAddress,
                              enabled: !isLoading,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.textFieldFilledColor,
                                prefixIcon: loginIconForm(icon: Icons.email),
                                hintText: 'Name',
                                border: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                              onChanged: (value) {
                                if (nameController.text.isNotEmpty &&
                                    isThereErrorInName == true) {
                                  setState(() {
                                    isThereErrorInName = !isThereErrorInName;
                                  });
                                } else {
                                  setState(() {
                                    isThereErrorInName = false;
                                  });
                                }
                              },
                            ),
                          ),
                          isThereErrorInName == true
                              ? Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      'Enter your name',
                                      style: errorTextStyle,
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      )
                    : const ProfilePageCustomItemWidget(text: 'Name'),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 15.0,
                ),
                child: editProfile == true
                    ? Column(
                        children: [
                          Card(
                            elevation: 2.0,
                            shape: txtFieldBorder,
                            child: TextField(
                              controller: usernameController,
                              keyboardType: TextInputType.text,
                              enabled: !isLoading,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.textFieldFilledColor,
                                prefixIcon: loginIconForm(icon: Icons.person),
                                hintText: 'Username',
                                border: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                              onChanged: (value) {
                                if (usernameController.text.isNotEmpty &&
                                    isThereErrorInUsername == true) {
                                  setState(() {
                                    isThereErrorInUsername =
                                        !isThereErrorInUsername;
                                  });
                                }
                              },
                            ),
                          ),
                          isThereErrorInUsername == true
                              ? Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      'Enter your username',
                                      style: errorTextStyle,
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      )
                    : const ProfilePageCustomItemWidget(text: 'Username'),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 15.0,
                ),
                child: editProfile == true
                    ? Column(
                        children: [
                          Card(
                            elevation: 2.0,
                            shape: txtFieldBorder,
                            child: TextField(
                              controller: accessNumberController,
                              keyboardType: TextInputType.text,
                              enabled: !isLoading,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.textFieldFilledColor,
                                prefixIcon: loginIconForm(icon: Icons.numbers),
                                hintText: 'Access number',
                                border: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                              onChanged: (value) {
                                if (accessNumberController.text.isNotEmpty &&
                                    isThereErrorInAccessNumber == true) {
                                  setState(() {
                                    isThereErrorInAccessNumber =
                                        !isThereErrorInAccessNumber;
                                  });
                                }
                              },
                            ),
                          ),
                          isThereErrorInAccessNumber == true
                              ? Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      'Enter your access number',
                                      style: errorTextStyle,
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      )
                    : const ProfilePageCustomItemWidget(text: 'Access number'),
              ),
            ],
          ),
        )
      ],
    );
  }
}
