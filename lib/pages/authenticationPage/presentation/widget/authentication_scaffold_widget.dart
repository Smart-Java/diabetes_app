import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diabetes_care/pages/authenticationPage/bloc/authentication_page_bloc.dart';
import 'package:diabetes_care/pages/authenticationPage/bloc/event/authentication_page_event.dart';
import 'package:diabetes_care/pages/authenticationPage/bloc/state/authentication_page_state.dart';
import 'package:diabetes_care/pages/authenticationPage/presentation/widget/authentication_view_widget.dart';

class AuthenticationScaffoldWidget extends StatefulWidget {
  final bool? loginState;
  const AuthenticationScaffoldWidget({
    Key? key,
    this.loginState = true,
  }) : super(key: key);

  @override
  State<AuthenticationScaffoldWidget> createState() =>
      _AuthenticationScaffoldWidgetState();
}

class _AuthenticationScaffoldWidgetState
    extends State<AuthenticationScaffoldWidget> {
  bool loginState = true;
  bool userIsGivingAnInput = false;
  bool isLoading = false;

  bool authenticationIsSuccessful = false;

  @override
  void initState() {
    super.initState();
    if (widget.loginState != null) {
      setState(() {
        loginState = widget.loginState!;
      });
    }
    BlocProvider.of<AuthenticationPageBloc>(context)
        .add(ChangeAuthenticationStateEvent(changeToLoginState: loginState));
  }

  @override
  Widget build(BuildContext context) {
    var isKeyboardHidden = MediaQuery.of(context).viewInsets.bottom;
    if (isKeyboardHidden == 0.0) {
      userIsGivingAnInput = false;
    } else {
      userIsGivingAnInput = true;
    }
    return BlocConsumer<AuthenticationPageBloc, AuthenticationPageState>(
      listener: (context, state) {
        if (state.isItLoginState == true) {
          setState(() {
            loginState = state.isItLoginState!;
          });
        } else {
          if (state.isItLoginState != null) {
            setState(() {
              loginState = state.isItLoginState!;
            });
          }
        }

        if (state.isAuthenticationRequestSuccessful == true) {
          setState(() {
            authenticationIsSuccessful = true;
          });
        }

        debugPrint('authentication request is $authenticationIsSuccessful');

        if (state.isLoading == true) {
          isLoading = state.isLoading!;
        } else {
          isLoading = false;
        }
      },
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            bool goBack = false;
            setState(() {
              if (loginState == false) {
                goBack = false;
                BlocProvider.of<AuthenticationPageBloc>(context).add(
                    ChangeAuthenticationStateEvent(
                        changeToLoginState: !loginState));
              } else {
                goBack = true;
                exit(1);
              }
            });
            return goBack;
          },
          child: Scaffold(
            body: AuthenticationViewWidget(
              loginState: loginState,
              isUserEnteringData: userIsGivingAnInput,
              isLoading: isLoading,
            ),
          ),
        );
      },
    );
  }
}
