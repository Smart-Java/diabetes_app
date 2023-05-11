import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:diabetes_care/di/injection.dart';
import 'package:diabetes_care/pages/splashPage/bloc/splash_page_bloc.dart';
import 'package:diabetes_care/pages/splashPage/presentation/widget/splash_view_widget.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      left: false,
      right: false,
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: BlocProvider(
            create: (context) => getIt<SplashPageBloc>(),
            child: const SplashViewWidget()),
      ),
    );
  }
}
