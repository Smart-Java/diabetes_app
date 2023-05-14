// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    AuthenticationRoute.name: (routeData) {
      final args = routeData.argsAs<AuthenticationRouteArgs>(
          orElse: () => const AuthenticationRouteArgs());
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: AuthenticationPage(
          key: args.key,
          loginState: args.loginState,
        ),
      );
    },
    GetStartedRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const GetStartedPage(),
      );
    },
    PatientDashboardRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const PatientDashboardPage(),
      );
    },
    GlucoseReadingRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const GlucoseReadingPage(),
      );
    },
    DoctorDashboardRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const DoctorDashboardPage(),
      );
    },
    DietitianDashboardRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const DietitianDashboardPage(),
      );
    },
    CareGiverDashboardRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const CareGiverDashboardPage(),
      );
    },
    CareTeamRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const CareTeamPage(),
      );
    },
    TestRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const TestPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    ReminderRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const ReminderPage(),
      );
    },
    RecordRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const RecordPage(),
      );
    },
    DietRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const DietPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const ProfilePage(),
      );
    },
    GlucoseReadingViewRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const GlucoseReadingViewPage(),
      );
    },
    PractitionerHomeRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const PractitionerHomePage(),
      );
    },
    PractitionerScheduleRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const PractitionerSchedulePage(),
      );
    },
    PractitionerProfileRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const PractitionerProfilePage(),
      );
    },
    PractitionerDietRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const PractitionerDietPage(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          AuthenticationRoute.name,
          path: '/authentication-page',
        ),
        RouteConfig(
          GetStartedRoute.name,
          path: '/',
        ),
        RouteConfig(
          PatientDashboardRoute.name,
          path: '/patient-dashboard-page',
          children: [
            RouteConfig(
              HomeRoute.name,
              path: 'home-page',
              parent: PatientDashboardRoute.name,
            ),
            RouteConfig(
              ReminderRoute.name,
              path: 'reminder-page',
              parent: PatientDashboardRoute.name,
            ),
            RouteConfig(
              RecordRoute.name,
              path: 'record-page',
              parent: PatientDashboardRoute.name,
            ),
            RouteConfig(
              DietRoute.name,
              path: 'diet-page',
              parent: PatientDashboardRoute.name,
            ),
            RouteConfig(
              ProfileRoute.name,
              path: 'profile-page',
              parent: PatientDashboardRoute.name,
            ),
          ],
        ),
        RouteConfig(
          GlucoseReadingRoute.name,
          path: '/glucose-reading-page',
          children: [
            RouteConfig(
              GlucoseReadingViewRoute.name,
              path: 'glucose-reading-view-page',
              parent: GlucoseReadingRoute.name,
            ),
            RouteConfig(
              ReminderRoute.name,
              path: 'reminder-page',
              parent: GlucoseReadingRoute.name,
            ),
            RouteConfig(
              RecordRoute.name,
              path: 'record-page',
              parent: GlucoseReadingRoute.name,
            ),
            RouteConfig(
              DietRoute.name,
              path: 'diet-page',
              parent: GlucoseReadingRoute.name,
            ),
            RouteConfig(
              ProfileRoute.name,
              path: 'profile-page',
              parent: GlucoseReadingRoute.name,
            ),
          ],
        ),
        RouteConfig(
          DoctorDashboardRoute.name,
          path: '/doctor-dashboard-page',
          children: [
            RouteConfig(
              PractitionerHomeRoute.name,
              path: 'practitioner-home-page',
              parent: DoctorDashboardRoute.name,
            ),
            RouteConfig(
              PractitionerScheduleRoute.name,
              path: 'practitioner-schedule-page',
              parent: DoctorDashboardRoute.name,
            ),
            RouteConfig(
              PractitionerProfileRoute.name,
              path: 'practitioner-profile-page',
              parent: DoctorDashboardRoute.name,
            ),
          ],
        ),
        RouteConfig(
          DietitianDashboardRoute.name,
          path: '/dietitian-dashboard-page',
          children: [
            RouteConfig(
              PractitionerHomeRoute.name,
              path: 'practitioner-home-page',
              parent: DietitianDashboardRoute.name,
            ),
            RouteConfig(
              PractitionerScheduleRoute.name,
              path: 'practitioner-schedule-page',
              parent: DietitianDashboardRoute.name,
            ),
            RouteConfig(
              PractitionerDietRoute.name,
              path: 'practitioner-diet-page',
              parent: DietitianDashboardRoute.name,
            ),
            RouteConfig(
              PractitionerProfileRoute.name,
              path: 'practitioner-profile-page',
              parent: DietitianDashboardRoute.name,
            ),
          ],
        ),
        RouteConfig(
          CareGiverDashboardRoute.name,
          path: '/care-giver-dashboard-page',
          children: [
            RouteConfig(
              PractitionerHomeRoute.name,
              path: 'practitioner-home-page',
              parent: CareGiverDashboardRoute.name,
            ),
            RouteConfig(
              PractitionerProfileRoute.name,
              path: 'practitioner-profile-page',
              parent: CareGiverDashboardRoute.name,
            ),
          ],
        ),
        RouteConfig(
          CareTeamRoute.name,
          path: '/care-team-page',
        ),
        RouteConfig(
          TestRoute.name,
          path: '/test-page',
        ),
      ];
}

/// generated route for
/// [AuthenticationPage]
class AuthenticationRoute extends PageRouteInfo<AuthenticationRouteArgs> {
  AuthenticationRoute({
    Key? key,
    bool? loginState,
  }) : super(
          AuthenticationRoute.name,
          path: '/authentication-page',
          args: AuthenticationRouteArgs(
            key: key,
            loginState: loginState,
          ),
        );

  static const String name = 'AuthenticationRoute';
}

class AuthenticationRouteArgs {
  const AuthenticationRouteArgs({
    this.key,
    this.loginState,
  });

  final Key? key;

  final bool? loginState;

  @override
  String toString() {
    return 'AuthenticationRouteArgs{key: $key, loginState: $loginState}';
  }
}

/// generated route for
/// [GetStartedPage]
class GetStartedRoute extends PageRouteInfo<void> {
  const GetStartedRoute()
      : super(
          GetStartedRoute.name,
          path: '/',
        );

  static const String name = 'GetStartedRoute';
}

/// generated route for
/// [PatientDashboardPage]
class PatientDashboardRoute extends PageRouteInfo<void> {
  const PatientDashboardRoute({List<PageRouteInfo>? children})
      : super(
          PatientDashboardRoute.name,
          path: '/patient-dashboard-page',
          initialChildren: children,
        );

  static const String name = 'PatientDashboardRoute';
}

/// generated route for
/// [GlucoseReadingPage]
class GlucoseReadingRoute extends PageRouteInfo<void> {
  const GlucoseReadingRoute({List<PageRouteInfo>? children})
      : super(
          GlucoseReadingRoute.name,
          path: '/glucose-reading-page',
          initialChildren: children,
        );

  static const String name = 'GlucoseReadingRoute';
}

/// generated route for
/// [DoctorDashboardPage]
class DoctorDashboardRoute extends PageRouteInfo<void> {
  const DoctorDashboardRoute({List<PageRouteInfo>? children})
      : super(
          DoctorDashboardRoute.name,
          path: '/doctor-dashboard-page',
          initialChildren: children,
        );

  static const String name = 'DoctorDashboardRoute';
}

/// generated route for
/// [DietitianDashboardPage]
class DietitianDashboardRoute extends PageRouteInfo<void> {
  const DietitianDashboardRoute({List<PageRouteInfo>? children})
      : super(
          DietitianDashboardRoute.name,
          path: '/dietitian-dashboard-page',
          initialChildren: children,
        );

  static const String name = 'DietitianDashboardRoute';
}

/// generated route for
/// [CareGiverDashboardPage]
class CareGiverDashboardRoute extends PageRouteInfo<void> {
  const CareGiverDashboardRoute({List<PageRouteInfo>? children})
      : super(
          CareGiverDashboardRoute.name,
          path: '/care-giver-dashboard-page',
          initialChildren: children,
        );

  static const String name = 'CareGiverDashboardRoute';
}

/// generated route for
/// [CareTeamPage]
class CareTeamRoute extends PageRouteInfo<void> {
  const CareTeamRoute()
      : super(
          CareTeamRoute.name,
          path: '/care-team-page',
        );

  static const String name = 'CareTeamRoute';
}

/// generated route for
/// [TestPage]
class TestRoute extends PageRouteInfo<void> {
  const TestRoute()
      : super(
          TestRoute.name,
          path: '/test-page',
        );

  static const String name = 'TestRoute';
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home-page',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [ReminderPage]
class ReminderRoute extends PageRouteInfo<void> {
  const ReminderRoute()
      : super(
          ReminderRoute.name,
          path: 'reminder-page',
        );

  static const String name = 'ReminderRoute';
}

/// generated route for
/// [RecordPage]
class RecordRoute extends PageRouteInfo<void> {
  const RecordRoute()
      : super(
          RecordRoute.name,
          path: 'record-page',
        );

  static const String name = 'RecordRoute';
}

/// generated route for
/// [DietPage]
class DietRoute extends PageRouteInfo<void> {
  const DietRoute()
      : super(
          DietRoute.name,
          path: 'diet-page',
        );

  static const String name = 'DietRoute';
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: 'profile-page',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [GlucoseReadingViewPage]
class GlucoseReadingViewRoute extends PageRouteInfo<void> {
  const GlucoseReadingViewRoute()
      : super(
          GlucoseReadingViewRoute.name,
          path: 'glucose-reading-view-page',
        );

  static const String name = 'GlucoseReadingViewRoute';
}

/// generated route for
/// [PractitionerHomePage]
class PractitionerHomeRoute extends PageRouteInfo<void> {
  const PractitionerHomeRoute()
      : super(
          PractitionerHomeRoute.name,
          path: 'practitioner-home-page',
        );

  static const String name = 'PractitionerHomeRoute';
}

/// generated route for
/// [PractitionerSchedulePage]
class PractitionerScheduleRoute extends PageRouteInfo<void> {
  const PractitionerScheduleRoute()
      : super(
          PractitionerScheduleRoute.name,
          path: 'practitioner-schedule-page',
        );

  static const String name = 'PractitionerScheduleRoute';
}

/// generated route for
/// [PractitionerProfilePage]
class PractitionerProfileRoute extends PageRouteInfo<void> {
  const PractitionerProfileRoute()
      : super(
          PractitionerProfileRoute.name,
          path: 'practitioner-profile-page',
        );

  static const String name = 'PractitionerProfileRoute';
}

/// generated route for
/// [PractitionerDietPage]
class PractitionerDietRoute extends PageRouteInfo<void> {
  const PractitionerDietRoute()
      : super(
          PractitionerDietRoute.name,
          path: 'practitioner-diet-page',
        );

  static const String name = 'PractitionerDietRoute';
}
