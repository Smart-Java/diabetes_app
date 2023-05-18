import 'package:diabetes_care/pages/authenticationPage/presentation/widget/authenticationHeaderWidget/authentication_header_widget.dart';
import 'package:diabetes_care/util/appUIConstant/app_ui_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:diabetes_care/pages/authenticationPage/bloc/authentication_page_bloc.dart';
import 'package:diabetes_care/pages/authenticationPage/bloc/event/authentication_page_event.dart';
import 'package:diabetes_care/pages/authenticationPage/bloc/state/authentication_page_state.dart';
import 'package:diabetes_care/pages/authenticationPage/presentation/widget/successMessageWidget/authentication_success_message_dialog_widget_view.dart';

class AuthenticationRegisterWidget extends StatefulWidget {
  const AuthenticationRegisterWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<AuthenticationRegisterWidget> createState() =>
      _AuthenticationRegisterWidgetState();
}

class _AuthenticationRegisterWidgetState
    extends State<AuthenticationRegisterWidget> {
  final userNameController = TextEditingController();
  final emailAddressController = TextEditingController();
  final passwordController = TextEditingController();
  final retypePasswordController = TextEditingController();

  final formStateKey = GlobalKey<FormState>();

  List<String> users = [
    '',
    'Patient',
    'Doctor',
    'Dietitain',
    'Care Giver',
  ];

  String userChoice = '';

  bool? emailAddressVerified = true;

  bool? isUserPasswordPermitted = true;

  bool loading = false;

  bool isPasswordMismatched = false;

  bool passwordShouldBeInvisible = true;
  bool retypePasswordShouldBeInvisible = true;

  bool isThereErrorForRegisterEmailField = false;
  bool isThereErrorForRegisterPasswordField = false;
  bool isThereErrorForRegisterRetypePasswordField = false;
  bool isThereErrorForRegisterUsernameField = false;
  bool isThereErrorForRegisterCategoryField = false;

  bool isEmailFieldEmpty = true;
  bool isPasswordFieldEmpty = true;

  Size deviceSize = const Size(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    users = users.toSet().toList();
    if (users.isNotEmpty) {
      userChoice = users[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    setState(() {
      deviceSize = size;
    });

    return BlocListener<AuthenticationPageBloc, AuthenticationPageState>(
      listener: (context, state) {
        if (state.authenticationMessage != null &&
            (state.isAuthenticationRequestSuccessful == false ||
                state.isAuthenticationRequestSuccessful == null)) {
          _displayMessage(context, state.authenticationMessage!);
        }
        debugPrint('from view ${state.isEmailAddressFormatTrue}');
        if (state.isEmailAddressFormatTrue == true) {
          setState(() {
            emailAddressVerified = state.isEmailAddressFormatTrue!;
          });
        } else {
          setState(() {
            if (state.isEmailAddressFormatTrue != null) {
              emailAddressVerified = false;
            }
          });
        }

        if (state.isPasswordGivenPermitted == true) {
          setState(() {
            isUserPasswordPermitted = state.isPasswordGivenPermitted;
          });
        } else {
          if (state.isPasswordGivenPermitted != null) {
            setState(() {
              isUserPasswordPermitted = false;
            });
          }
        }

        if (state.isPasswordMismatched == true) {
          setState(() {
            isPasswordMismatched = state.isPasswordMismatched!;
          });
        } else {
          setState(() {
            isPasswordMismatched = false;
          });
        }

        if (state.isLoading == true) {
          loading = state.isLoading!;
        } else {
          loading = false;
          if (state.isAuthenticationRequestSuccessful == true &&
              state.redirectToLoginComponent == true &&
              (state.authenticationMessage != null &&
                  state.authenticationMessage!.isNotEmpty)) {
            var message = state.authenticationMessage as String;
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AuthenticationSuccessMessageDialogWidgetView(
                  isItForRoutingToANewPage: true,
                  message: message,
                  title: 'Success',
                );
              },
            );  
          }
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AuthenticationHeaderWidget(
                description: 'Create New Account',
                title: 'Register',
                navFunctionality: () {
                  debugPrint('move');
                  BlocProvider.of<AuthenticationPageBloc>(context).add(
                    ChangeAuthenticationStateEvent(
                      changeToLoginState: true,
                    ),
                  );
                },
              ),
              Form(
                key: formStateKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 30.0,
                      ),
                      child: TextField(
                        controller: userNameController,
                        keyboardType: TextInputType.text,
                        enabled: !loading,
                        decoration: InputDecoration(
                          prefixIcon: loginIconForm(
                            icon: Icons.person,
                          ),
                          hintText: 'Fullname',
                          hintStyle: hintTextStyle,
                          errorText:
                              isThereErrorForRegisterUsernameField == true
                                  ? 'Username is required'
                                  : null,
                          border: textFieldBorder,
                          disabledBorder: textFieldBorder,
                          enabledBorder: textFieldBorder,
                          focusedBorder: textFieldBorder,
                        ),
                        onChanged: (value) {
                          if (userNameController.text.isNotEmpty &&
                              isThereErrorForRegisterUsernameField == true) {
                            setState(() {
                              isThereErrorForRegisterUsernameField =
                                  !isThereErrorForRegisterUsernameField;
                            });
                          } else {
                            setState(() {
                              isThereErrorForRegisterUsernameField = false;
                            });
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 30.0,
                      ),
                      child: TextField(
                        controller: emailAddressController,
                        keyboardType: TextInputType.emailAddress,
                        enabled: !loading,
                        decoration: InputDecoration(
                          prefixIcon: loginIconForm(
                            icon: Icons.email,
                          ),
                          hintText: 'Email',
                          hintStyle: hintTextStyle,
                          errorText: isEmailFieldEmpty == true
                              ? isThereErrorForRegisterEmailField == true
                                  ? 'Enter a vaild email address'
                                  : null
                              : emailAddressVerified == false
                                  ? 'Enter a vaild email address'
                                  : isThereErrorForRegisterEmailField == true
                                      ? 'Enter a vaild email address'
                                      : null,
                          errorStyle: errorTextStyle,
                          border: textFieldBorder,
                          disabledBorder: textFieldBorder,
                          enabledBorder: textFieldBorder,
                          focusedBorder: textFieldBorder,
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            setState(() {
                              isEmailFieldEmpty = false;
                            });
                            if (value.isNotEmpty &&
                                isThereErrorForRegisterEmailField == true) {
                              setState(() {
                                isThereErrorForRegisterEmailField =
                                    !isThereErrorForRegisterEmailField;
                              });
                            }
                            BlocProvider.of<AuthenticationPageBloc>(context)
                                .add(
                              ValidateEmailAddressForRegistrationAuthentication(
                                emailAddress: emailAddressController.text,
                                loginState: false,
                              ),
                            );
                          } else {
                            setState(() {
                              isEmailFieldEmpty = true;
                            });
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 30.0,
                      ),
                      child: TextField(
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        enabled: !loading,
                        obscureText: passwordShouldBeInvisible,
                        decoration: InputDecoration(
                          prefixIcon: loginIconForm(
                            icon: Icons.lock,
                          ),
                          hintText: 'Enter password',
                          hintStyle: hintTextStyle,
                          errorText: isPasswordFieldEmpty == true
                              ? isThereErrorForRegisterPasswordField == true
                                  ? 'Password is required'
                                  : null
                              : isThereErrorForRegisterPasswordField == true
                                  ? 'Password is required'
                                  : isUserPasswordPermitted == false
                                      ? 'Minimum of eight characters required, at least: \nOne uppercase letter, \nOne lowercase letter, \nOne number and one special character'
                                      : null,
                          errorStyle: errorTextStyle,
                          border: textFieldBorder,
                          disabledBorder: textFieldBorder,
                          enabledBorder: textFieldBorder,
                          focusedBorder: textFieldBorder,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                passwordShouldBeInvisible =
                                    !passwordShouldBeInvisible;
                              });
                            },
                            icon: Icon(
                              passwordShouldBeInvisible == false
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: AppColors.passwordVisibilityColor,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            setState(() {
                              isPasswordFieldEmpty = false;
                            });
                            if (value.isNotEmpty &&
                                isThereErrorForRegisterPasswordField == true) {
                              setState(() {
                                isThereErrorForRegisterPasswordField =
                                    !isThereErrorForRegisterPasswordField;
                              });
                            }
                            BlocProvider.of<AuthenticationPageBloc>(context)
                                .add(
                              ValidatePasswordForRegistrationAuthentication(
                                  password: passwordController.text),
                            );
                          } else {
                            setState(() {
                              isThereErrorForRegisterPasswordField = false;
                              isPasswordFieldEmpty = true;
                            });
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 30.0,
                      ),
                      child: TextField(
                        controller: retypePasswordController,
                        keyboardType: TextInputType.text,
                        enabled: !loading,
                        obscureText: retypePasswordShouldBeInvisible,
                        decoration: InputDecoration(
                          prefixIcon: loginIconForm(
                            icon: Icons.lock,
                          ),
                          hintText: 'Retype password',
                          hintStyle: hintTextStyle,
                          errorText:
                              isThereErrorForRegisterRetypePasswordField == true
                                  ? 'Retype password is required'
                                  : null,
                          errorStyle: errorTextStyle,
                          border: textFieldBorder,
                          enabledBorder: textFieldBorder,
                          disabledBorder: textFieldBorder,
                          focusedBorder: textFieldBorder,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                retypePasswordShouldBeInvisible =
                                    !retypePasswordShouldBeInvisible;
                              });
                            },
                            icon: Icon(
                              retypePasswordShouldBeInvisible == false
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: AppColors.passwordVisibilityColor,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty &&
                              isThereErrorForRegisterRetypePasswordField ==
                                  true) {
                            setState(() {
                              isThereErrorForRegisterRetypePasswordField =
                                  !isThereErrorForRegisterRetypePasswordField;
                            });
                          } else {
                            setState(() {
                              isThereErrorForRegisterRetypePasswordField =
                                  false;
                            });
                          }
                          if (isUserPasswordPermitted == true) {
                            BlocProvider.of<AuthenticationPageBloc>(context)
                                .add(
                              PasswordAndRetypePasswordConfirmationAuthenticationEvent(
                                password: passwordController.text,
                                retypePassword: retypePasswordController.text,
                              ),
                            );
                          } else {
                            setState(() {
                              isUserPasswordPermitted = false;
                            });
                          }
                        },
                        onSubmitted: (value) {
                          if (isUserPasswordPermitted == true) {
                            BlocProvider.of<AuthenticationPageBloc>(context)
                                .add(
                              PasswordAndRetypePasswordConfirmationAuthenticationEvent(
                                password: passwordController.text,
                                retypePassword: retypePasswordController.text,
                              ),
                            );
                          } else {
                            setState(() {
                              isUserPasswordPermitted = false;
                            });
                          }
                        },
                      ),
                    ),
                    users.length > 1
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DropdownButtonFormField(
                                  items: users.map((String choice) {
                                    return DropdownMenuItem(
                                      value: choice,
                                      child: Text(
                                        choice,
                                        style: hintTextStyle,
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    var newUserChoice = value as String;
                                    if (newUserChoice.isNotEmpty &&
                                        isThereErrorForRegisterCategoryField ==
                                            true) {
                                      setState(() {
                                        isThereErrorForRegisterCategoryField =
                                            !isThereErrorForRegisterCategoryField;
                                      });
                                    }
                                    setState(() {
                                      userChoice = newUserChoice;
                                    });
                                  },
                                  value: userChoice,
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                    ),
                                    focusedBorder: textFieldBorder,
                                    disabledBorder: textFieldBorder,
                                    enabledBorder: textFieldBorder,
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        10, 20, 10, 20),
                                  ),
                                ),
                                isThereErrorForRegisterCategoryField == true
                                    ? const Padding(
                                        padding: EdgeInsets.only(
                                          left: 12.0,
                                          top: 8.0,
                                        ),
                                        child: Text(
                                          'Category is required',
                                          style: TextStyle(
                                            color: AppColors.redColor,
                                            fontSize: 13.0,
                                          ),
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 5.0,
                  right: 5.0,
                  top: 10.0,
                ),
                child: GestureDetector(
                  onTap: loading == true
                      ? null
                      : () async {
                          await validateRequiredFieldsAndRegisterUser()
                              .then((value) {
                            registerUser(context: context);
                          });
                        },
                  child: Container(
                    height: 56.0,
                    decoration: const BoxDecoration(
                      color: AppColors.formBackgroundButtonColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(2.0),
                      ),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            loading == true ? 'Processing...' : 'SIGN UP',
                            style: Theme.of(context).textTheme.button,
                          ),
                          loading == true
                              ? Container()
                              : const Icon(
                                  Icons.arrow_forward,
                                  color: AppColors.whiteColor,
                                )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _displayMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(message),
        ),
        duration: const Duration(
          seconds: 2,
        ),
        backgroundColor: AppColors.snackBarBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.only(
          bottom: deviceSize.height - 100,
          right: 10.0,
          left: 10.0,
        ),
      ),
    );
  }

  Future<void> validateRequiredFieldsAndRegisterUser() async {
    var registerEmailAddress = emailAddressController.text;
    var registerPassword = passwordController.text;
    var registerRetypePassword = retypePasswordController.text;
    var registerUsername = userNameController.text;

    if (registerEmailAddress.isEmpty ||
        registerPassword.isEmpty ||
        registerRetypePassword.isEmpty ||
        registerUsername.isEmpty) {
      _displayMessage(context, 'All fields are required');
    }

    if (registerEmailAddress.isEmpty) {
      setState(() {
        isThereErrorForRegisterEmailField = true;
      });
    } else {
      setState(() {
        isThereErrorForRegisterEmailField = false;
      });
    }

    if (registerPassword.isEmpty) {
      setState(() {
        isThereErrorForRegisterPasswordField = true;
      });
    } else {
      setState(() {
        isThereErrorForRegisterPasswordField = false;
      });
    }

    if (registerRetypePassword.isEmpty) {
      setState(() {
        isThereErrorForRegisterRetypePasswordField = true;
      });
    } else {
      setState(() {
        isThereErrorForRegisterRetypePasswordField = false;
      });
    }

    if (registerUsername.isEmpty) {
      setState(() {
        isThereErrorForRegisterUsernameField = true;
      });
    } else {
      setState(() {
        isThereErrorForRegisterUsernameField = false;
      });
    }

    if (userChoice.isEmpty) {
      setState(() {
        isThereErrorForRegisterCategoryField = true;
      });
    } else {
      setState(() {
        isThereErrorForRegisterCategoryField = false;
      });
    }
  }

  void registerUser({required BuildContext context}) {
    if (isThereErrorForRegisterEmailField == false &&
        isThereErrorForRegisterPasswordField == false &&
        isThereErrorForRegisterRetypePasswordField == false &&
        isThereErrorForRegisterUsernameField == false &&
        isUserPasswordPermitted == true &&
        isThereErrorForRegisterCategoryField == false &&
        emailAddressVerified == true) {
      BlocProvider.of<AuthenticationPageBloc>(context).add(
        RegisterAuthenticationEvent(
          emailAddress: emailAddressController.text,
          fullName: userNameController.text,
          loginState: false,
          password: passwordController.text,
          retypePassword: retypePasswordController.text,
          category: userChoice,
        ),
      );
    } else {
      if (isUserPasswordPermitted == false) {
        setState(() {
          isUserPasswordPermitted = false;
        });
      } else if (emailAddressVerified == false) {
        setState(() {
          emailAddressVerified = false;
        });
      }
    }
  }
}
