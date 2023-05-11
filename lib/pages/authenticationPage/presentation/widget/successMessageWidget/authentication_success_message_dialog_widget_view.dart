import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diabetes_care/di/injection.dart';
import 'package:diabetes_care/pages/authenticationPage/bloc/authentication_page_bloc.dart';
import 'package:diabetes_care/pages/authenticationPage/presentation/widget/successMessageWidget/authentication_success_message_dialog_widget.dart';

class AuthenticationSuccessMessageDialogWidgetView extends StatelessWidget {
  final String message;
  final String title;
  final bool? isItForRoutingToANewPage;
  final VoidCallback? routeFunctionality;
  const AuthenticationSuccessMessageDialogWidgetView({
    Key? key,
    required this.message,
    required this.title,
    required this.isItForRoutingToANewPage,
    this.routeFunctionality,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthenticationPageBloc>(),
      child: AuthenticationSuccessMessageDialogWidget(
        message: message,
        title: title,
        isItForRoutingToANewPage: isItForRoutingToANewPage,
        routeFunctionality: routeFunctionality,
      ),
    );
  }
}
