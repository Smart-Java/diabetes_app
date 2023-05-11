import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diabetes_care/di/injection.dart';
import 'package:diabetes_care/pages/splashPage/bloc/splash_page_bloc.dart';
import 'package:diabetes_care/pages/splashPage/presentation/widget/authentication_info_message_dialog_widget.dart';

class AuthenticationInfoMessageDialogWidgetView extends StatelessWidget {
  final VoidCallback doneFunctionality;
  final String message;
  final String title;
  final bool tryAgain;
  const AuthenticationInfoMessageDialogWidgetView({
    Key? key,
    required this.doneFunctionality,
    required this.message,
    required this.title,
    required this.tryAgain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SplashPageBloc>(),
      child: AuthenticationInfoMessageDialogWidget(
        doneFunctionality: doneFunctionality,
        message: message,
        title: title,
        tryAgain: tryAgain,
      ),
    );
  }
}
