import 'package:auto_route/auto_route.dart';
import 'package:diabetes_care/pages/authenticationPage/presentation/authentication_page.dart';
import 'package:diabetes_care/pages/authenticationPage/presentation/widget/authenticationOptionsPage/authentication_options_page.dart';
import 'package:diabetes_care/pages/dashboardPage/dashboard_page.dart';
import 'package:diabetes_care/pages/dietPage/diet_page.dart';
import 'package:diabetes_care/pages/homePage/home_page.dart';
import 'package:diabetes_care/pages/profilePage/profile_page.dart';
import 'package:diabetes_care/pages/recordPage/record_page.dart';
import 'package:diabetes_care/pages/reminderPage/reminder_page.dart';
import 'package:diabetes_care/pages/splashPage/presentation/splash_page.dart';
import 'package:diabetes_care/pages/testPage/test_page.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: SplashPage,
    ),
    AutoRoute(
      page: AuthenticationPage,
    ),
    AutoRoute(
      page: AuthenticationOptionsPage,
    ),
    AutoRoute(
      page: DashboardPage,
      children: [
        AutoRoute(
          page: HomePage,
        ),
        AutoRoute(
          page: ReminderPage,
        ),
        AutoRoute(
          page: RecordPage,
        ),
        AutoRoute(
          page: DietPage,
        ),
        AutoRoute(
          page: ProfilePage,
        ),
      ],
      initial: true,
    ),
    AutoRoute(
      page: TestPage,
    ),
  ],
)
class AppRouter extends _$AppRouter {}
