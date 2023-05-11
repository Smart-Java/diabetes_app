import 'package:diabetes_care/config/appRouterHandler/app_router.dart';
import 'package:diabetes_care/config/appTheme/app_theme.dart';
import 'package:flutter/material.dart';

final _appRouter = AppRouter();

class DiabetesCareApp extends StatelessWidget {
  const DiabetesCareApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.day(),
      themeMode: ThemeMode.light,
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(
      ),
    );
  }
}
