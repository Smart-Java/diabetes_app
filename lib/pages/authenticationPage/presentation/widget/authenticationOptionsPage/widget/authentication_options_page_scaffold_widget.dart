import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diabetes_care/pages/authenticationPage/bloc/authentication_page_bloc.dart';
import 'package:diabetes_care/pages/authenticationPage/bloc/event/authentication_page_event.dart';
import 'package:diabetes_care/pages/authenticationPage/bloc/state/authentication_page_state.dart';
import 'package:diabetes_care/pages/authenticationPage/presentation/widget/authenticationOptionsPage/widget/authentication_options_page_view_widget.dart';

class AuthenticationOptionsPageScaffoldWidget extends StatefulWidget {
  const AuthenticationOptionsPageScaffoldWidget({Key? key}) : super(key: key);

  @override
  State<AuthenticationOptionsPageScaffoldWidget> createState() =>
      _AuthenticationOptionsPageScaffoldWidgetState();
}

class _AuthenticationOptionsPageScaffoldWidgetState
    extends State<AuthenticationOptionsPageScaffoldWidget> {
  bool loginState = true;
  bool userIsGivingAnInput = false;
  bool isLoading = false;

  List userCatgories = [];

  @override
  void initState() {
    super.initState();
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

        if (state.isLoading == true) {
          isLoading = state.isLoading!;
        } else {
          isLoading = false;
        }
      },
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            bool exit = false;
            setState(() {
              if (loginState == false) {
                exit = false;
                BlocProvider.of<AuthenticationPageBloc>(context).add(
                    ChangeAuthenticationStateEvent(
                        changeToLoginState: !loginState));
              } else {
                exit = true;
              }
            });
            return exit;
          },
          child: Scaffold(
            body: AuthenticationOptionsPageViewWidget(
              loginState: loginState,
            ),
          ),
        );
      },
    );
  }
}
