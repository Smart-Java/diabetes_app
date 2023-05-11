import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:diabetes_care/pages/authenticationPage/bloc/event/authentication_page_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:diabetes_care/pages/authenticationPage/bloc/authentication_page_bloc.dart';
import 'package:diabetes_care/pages/authenticationPage/bloc/state/authentication_page_state.dart';
import 'package:diabetes_care/pages/authenticationPage/presentation/widget/authentication_login_widget.dart';
import 'package:diabetes_care/pages/authenticationPage/presentation/widget/authentication_register_widget.dart';

class AuthenticationViewWidget extends StatefulWidget {
  final bool loginState;
  final bool isLoading;
  final bool isUserEnteringData;
  const AuthenticationViewWidget({
    Key? key,
    required this.loginState,
    required this.isLoading,
    required this.isUserEnteringData,
  }) : super(key: key);

  @override
  State<AuthenticationViewWidget> createState() =>
      _AuthenticationViewWidgetState();
}

class _AuthenticationViewWidgetState extends State<AuthenticationViewWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationPageBloc, AuthenticationPageState>(
      listener: (context, state) {},
      child: LoadingOverlay(
        isLoading: widget.isLoading,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: widget.loginState == true
                    ? const AuthenticationLoginWidget()
                    : const AuthenticationRegisterWidget(),
              ),
            ),
            widget.isUserEnteringData == false
                ? Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  widget.loginState == true
                                      ? 'Don\'t have an account?'
                                      : 'Already have an account?',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    height: 1.2,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<AuthenticationPageBloc>(
                                            context)
                                        .add(ChangeAuthenticationStateEvent(
                                      changeToLoginState: !widget.loginState,
                                    ));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      widget.loginState == true
                                          ? 'Sign Up'
                                          : 'Sign In',
                                      style: const TextStyle(
                                        color: AppColors.secondaryColor,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 18,
                                        height: 1.2,
                                        decoration: TextDecoration.underline,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
