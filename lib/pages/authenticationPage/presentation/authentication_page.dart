import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diabetes_care/di/injection.dart';
import 'package:diabetes_care/pages/authenticationPage/bloc/authentication_page_bloc.dart';
import 'package:diabetes_care/pages/authenticationPage/presentation/widget/authentication_scaffold_widget.dart';

class AuthenticationPage extends StatelessWidget {
  final bool? loginState;
  const AuthenticationPage({Key? key, this.loginState,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      left: false,
      right: false,
      child: BlocProvider(
          create: (context) => getIt<AuthenticationPageBloc>(),
          child: loginState != null ? AuthenticationScaffoldWidget(loginState: loginState,) : const AuthenticationScaffoldWidget()),
    );
  }
}
