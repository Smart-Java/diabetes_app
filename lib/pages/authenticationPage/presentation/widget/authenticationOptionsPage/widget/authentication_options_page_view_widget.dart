import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:diabetes_care/config/appRouterHandler/app_router.dart';
import 'package:diabetes_care/pages/authenticationPage/bloc/authentication_page_bloc.dart';
import 'package:diabetes_care/pages/authenticationPage/bloc/event/authentication_page_event.dart';

class AuthenticationOptionsPageViewWidget extends StatefulWidget {
  final bool loginState;
  const AuthenticationOptionsPageViewWidget({
    Key? key,
    required this.loginState,
  }) : super(key: key);

  @override
  State<AuthenticationOptionsPageViewWidget> createState() =>
      _AuthenticationOptionsPageViewWidgetState();
}

class _AuthenticationOptionsPageViewWidgetState
    extends State<AuthenticationOptionsPageViewWidget> {
  Size size = const Size(0.0, 0.0);
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    setState(() {
      size = deviceSize;
    });
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: deviceSize.height * 0.72,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
            ),
            child: descriptionMessageWidget(),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 10.0,
            ),
            child: Container(
              height: deviceSize.height * 0.28,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: optionButtonsWidget(),
            ),
          ),
        ],
      ),
    );
  }

  Widget optionButtonsWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            context.router.replace(AuthenticationRoute());
          },
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 10.0,
            ),
            child: Container(
              height: 56.0,
              decoration: const BoxDecoration(
                color: AppColors.formBackgroundButtonColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: Center(
                child: Text(
                  'Login With Feeback',
                  style: Theme.of(context).textTheme.button,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            context.router
                .replace(AuthenticationRoute(
              loginState: false,
            ))
                .then((value) {
              BlocProvider.of<AuthenticationPageBloc>(context).add(
                ChangeAuthenticationStateEvent(changeToLoginState: false),
              );
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(
              top: 30.0,
              left: 10.0,
              right: 10.0,
            ),
            child: Container(
              height: 56.0,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                border: Border.all(
                  color: AppColors.buttonBackgroundColor,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: const Center(
                child: Text(
                  'Join Feedback',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget descriptionMessageWidget() {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.topCenter,
          child: Container(
            height: 95.0,
            width: 70.0,
            decoration: const BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/logo/bg_logo.png',
                  height: 150.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: AlignmentDirectional.center,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.zero,
                  child: SizedBox(
                    height: size.height * 0.40,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/onBoarding/dispatcha_bikes.png',
                    ),
                  ),
                ),
                const Expanded(
                  child: Align(
                    alignment: AlignmentDirectional.center,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                      ),
                      child: Text(
                        'Dispatcha mobile app is a crucial tool for businesses and individuals to connect with drivers, simplify logistics, and improve customer satisfaction.',
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 16.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
