import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:diabetes_care/pages/splashPage/bloc/event/splash_page_event.dart';
import 'package:diabetes_care/pages/splashPage/bloc/splash_page_bloc.dart';
import 'package:diabetes_care/pages/splashPage/bloc/state/splash_page_state.dart';

class AuthenticationInfoMessageDialogWidget extends StatelessWidget {
  final String message;
  final VoidCallback doneFunctionality;
  final bool tryAgain;
  final String title;
  const AuthenticationInfoMessageDialogWidget({
    Key? key,
    required this.doneFunctionality,
    required this.message,
    required this.title,
    required this.tryAgain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashPageBloc, SplashPageState>(
      listener: (context, state) {
        if (state.isLoading == false &&
            state.isAuthenticationSuccessful == true) {
        }
      },
      child: WillPopScope(
        onWillPop: (() async => false),
        child: AlertDialog(
          title: Text(
            title,
            style: Theme.of(context).textTheme.headline4,
          ),
          actions: [
            TextButton(
              onPressed: tryAgain == true
                  ? () {
                      Future.delayed(const Duration()).then((value) {
                        Navigator.pop(context);
                      }).then((value) {
                        BlocProvider.of<SplashPageBloc>(context)
                            .add(const AutomateUserLoginPageEvent());
                      });
                    }
                  : doneFunctionality,
              child: const Text(
                'Try Again',
                style: TextStyle(
                  color: AppColors.actionColor,
                ),
              ),
            )
          ],
          content: Text(
            message,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
    );
  }
}
