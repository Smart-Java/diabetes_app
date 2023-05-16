import 'package:auto_route/auto_route.dart';
import 'package:diabetes_care/config/appRouterHandler/app_router.dart';
import 'package:diabetes_care/pages/authenticationPage/presentation/widget/authenticationHeaderWidget/authentication_header_widget.dart';
import 'package:diabetes_care/util/appUIConstant/app_ui_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:diabetes_care/pages/authenticationPage/bloc/authentication_page_bloc.dart';
import 'package:diabetes_care/pages/authenticationPage/bloc/event/authentication_page_event.dart';
import 'package:diabetes_care/pages/authenticationPage/bloc/state/authentication_page_state.dart';
import 'package:diabetes_care/pages/authenticationPage/presentation/widget/successMessageWidget/authentication_success_message_dialog_widget_view.dart';

class AuthenticationLoginWidget extends StatefulWidget {
  const AuthenticationLoginWidget({Key? key}) : super(key: key);

  @override
  State<AuthenticationLoginWidget> createState() =>
      _AuthenticationLoginWidgetState();
}

class _AuthenticationLoginWidgetState extends State<AuthenticationLoginWidget> {
  final emailAddressController = TextEditingController();
  final passwordController = TextEditingController();

  final formStateKey = GlobalKey<FormState>();

  bool loading = false;
  bool passwordShouldBeInvisible = true;

  bool emailAddressVerified = true;

  bool isThereErrorForLoginPasswordField = false;
  bool isThereErrorForLoginEmailField = false;

  Size deviceSize = const Size(0.0, 0.0);

  @override
  void initState() {
    super.initState();
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

        if (state.isLoading == true) {
          loading = state.isLoading!;
        } else {
          loading = false;
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

        if (state.isAuthenticationRequestSuccessful == true) {
          var message = state.authenticationMessage as String;
          var isItAPatient = state.isItAPatient!;
          // var userCategory = state.userCategory!;
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AuthenticationSuccessMessageDialogWidgetView(
                routeFunctionality: () {
                  Future.delayed(const Duration()).then((value) {
                    Navigator.pop(context);
                  }).then((value) {
                    if (isItAPatient == true) {
                      context.router
                          .replaceAll([const PatientDashboardRoute()]);
                    }
                  });
                },
                message: message,
                title: 'Success',
                isItForRoutingToANewPage: false,
              );
            },
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  AuthenticationHeaderWidget(
                    description: 'Login to your account',
                    title: 'Welcome Back',
                    navFunctionality: () {},
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
                            controller: emailAddressController,
                            keyboardType: TextInputType.emailAddress,
                            enabled: !loading,
                            decoration: InputDecoration(
                              prefixIcon: loginIconForm(icon: Icons.email),
                              hintText: 'Email',
                              hintStyle: hintTextStyle,
                              errorText: emailAddressController.text.isNotEmpty
                                  ? emailAddressVerified == false
                                      ? 'Enter a vaild email address'
                                      : isThereErrorForLoginEmailField == true
                                          ? 'Enter a vaild email address'
                                          : null
                                  : isThereErrorForLoginEmailField == true
                                      ? 'Enter a vaild email address'
                                      : null,
                              errorStyle: errorTextStyle,
                              border: textFieldBorder,
                              disabledBorder: textFieldBorder,
                              enabledBorder: textFieldBorder,
                              focusedBorder: textFieldBorder,
                            ),
                            onChanged: (value) {
                              if (emailAddressController.text.isNotEmpty &&
                                  isThereErrorForLoginEmailField == true) {
                                setState(() {
                                  isThereErrorForLoginEmailField =
                                      !isThereErrorForLoginEmailField;
                                });
                              } else {
                                setState(() {
                                  isThereErrorForLoginEmailField = false;
                                });
                              }
                              BlocProvider.of<AuthenticationPageBloc>(context)
                                  .add(
                                ValidateEmailAddressForRegistrationAuthentication(
                                  emailAddress: emailAddressController.text,
                                  loginState: true,
                                ),
                              );
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
                              prefixIcon: loginIconForm(icon: Icons.lock),
                              hintText: 'Password',
                              hintStyle: hintTextStyle,
                              errorText:
                                  isThereErrorForLoginPasswordField == true
                                      ? 'Password is required'
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
                              if (passwordController.text.isNotEmpty &&
                                  isThereErrorForLoginPasswordField == true) {
                                setState(() {
                                  isThereErrorForLoginPasswordField =
                                      !isThereErrorForLoginPasswordField;
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      left: 5.0,
                      right: 5.0,
                    ),
                    child: GestureDetector(
                      onTap: loading == true
                          ? null
                          : () async {
                              await validateRequiredFields().then((value) {
                                loginUser(context: context);
                              });
                            },
                      child: Container(
                        height: 56.0,
                        decoration: const BoxDecoration(
                            color: AppColors.formBackgroundButtonColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            )),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                loading == true ? 'Processing...' : 'SIGN IN',
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

  Future<void> validateRequiredFields() async {
    var loginEmailAddress = emailAddressController.text;
    var loginPassword = passwordController.text;

    if (loginEmailAddress.isEmpty) {
      setState(() {
        isThereErrorForLoginEmailField = true;
      });
    } else {
      setState(() {
        isThereErrorForLoginEmailField = false;
      });
    }

    if (loginPassword.isEmpty) {
      setState(() {
        isThereErrorForLoginPasswordField = true;
      });
    } else {
      setState(() {
        isThereErrorForLoginPasswordField = false;
      });
    }
  }

  void loginUser({required BuildContext context}) {
    if (isThereErrorForLoginEmailField == false &&
        isThereErrorForLoginPasswordField == false &&
        emailAddressVerified == true) {
      BlocProvider.of<AuthenticationPageBloc>(context).add(
        LoginAuthenticationEvent(
          emailAddress: emailAddressController.text,
          password: passwordController.text,
          loginState: true,
        ),
      );
    } else {
      if (emailAddressVerified == false) {
        setState(() {
          emailAddressVerified = false;
        });
      }
    }
  }
}
