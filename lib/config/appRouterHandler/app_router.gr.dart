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
      final args = routeData.argsAs<GlucoseReadingRouteArgs>();
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: GlucoseReadingPage(
          key: args.key,
          dataReading: args.dataReading,
        ),
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
    DietDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<DietDetailsRouteArgs>();
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: DietDetailsPage(
          key: args.key,
          data: args.data,
          title: args.title,
        ),
      );
    },
    PatientsDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<PatientsDetailsRouteArgs>();
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: PatientsDetailsPage(
          key: args.key,
          patientEmail: args.patientEmail,
          patientName: args.patientName,
          isItForCareGiver: args.isItForCareGiver,
          isItForDietitian: args.isItForDietitian,
          patientAccessCode: args.patientAccessCode,
        ),
      );
    },
    PractitionerDietRoute.name: (routeData) {
      final args = routeData.argsAs<PractitionerDietRouteArgs>();
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: PractitionerDietPage(
          key: args.key,
          patientAccessCode: args.patientAccessCode,
        ),
      );
    },
    PractitionerPatientsRecordRoute.name: (routeData) {
      final args = routeData.argsAs<PractitionerPatientsRecordRouteArgs>();
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: PractitionerPatientsRecordPage(
          key: args.key,
          praPatientEmailOnPraView: args.praPatientEmailOnPraView,
        ),
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
      final args = routeData.argsAs<RecordRouteArgs>();
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: RecordPage(
          key: args.key,
          isItFromPatientsView: args.isItFromPatientsView,
          praPatientEmailOnPraView: args.praPatientEmailOnPraView,
        ),
      );
    },
    DietRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const DietPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>();
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: ProfilePage(
          key: args.key,
          isItAPatient: args.isItAPatient,
        ),
      );
    },
    GlucoseReadingViewRoute.name: (routeData) {
      final args = routeData.argsAs<GlucoseReadingViewRouteArgs>();
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: GlucoseReadingViewPage(
          key: args.key,
          dataReading: args.dataReading,
        ),
      );
    },
    PractitionerHomeRoute.name: (routeData) {
      final args = routeData.argsAs<PractitionerHomeRouteArgs>();
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: PractitionerHomePage(
          key: args.key,
          isItForDietitian: args.isItForDietitian,
        ),
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
    CarePatientDetailsRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const CarePatientDetailsPage(),
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
              CarePatientDetailsRoute.name,
              path: 'care-patient-details-page',
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
          DietDetailsRoute.name,
          path: '/diet-details-page',
        ),
        RouteConfig(
          PatientsDetailsRoute.name,
          path: '/patients-details-page',
        ),
        RouteConfig(
          PractitionerDietRoute.name,
          path: '/practitioner-diet-page',
        ),
        RouteConfig(
          PractitionerPatientsRecordRoute.name,
          path: '/practitioner-patients-record-page',
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
class GlucoseReadingRoute extends PageRouteInfo<GlucoseReadingRouteArgs> {
  GlucoseReadingRoute({
    Key? key,
    required List<dynamic> dataReading,
    List<PageRouteInfo>? children,
  }) : super(
          GlucoseReadingRoute.name,
          path: '/glucose-reading-page',
          args: GlucoseReadingRouteArgs(
            key: key,
            dataReading: dataReading,
          ),
          initialChildren: children,
        );

  static const String name = 'GlucoseReadingRoute';
}

class GlucoseReadingRouteArgs {
  const GlucoseReadingRouteArgs({
    this.key,
    required this.dataReading,
  });

  final Key? key;

  final List<dynamic> dataReading;

  @override
  String toString() {
    return 'GlucoseReadingRouteArgs{key: $key, dataReading: $dataReading}';
  }
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
/// [DietDetailsPage]
class DietDetailsRoute extends PageRouteInfo<DietDetailsRouteArgs> {
  DietDetailsRoute({
    Key? key,
    required String data,
    required String title,
  }) : super(
          DietDetailsRoute.name,
          path: '/diet-details-page',
          args: DietDetailsRouteArgs(
            key: key,
            data: data,
            title: title,
          ),
        );

  static const String name = 'DietDetailsRoute';
}

class DietDetailsRouteArgs {
  const DietDetailsRouteArgs({
    this.key,
    required this.data,
    required this.title,
  });

  final Key? key;

  final String data;

  final String title;

  @override
  String toString() {
    return 'DietDetailsRouteArgs{key: $key, data: $data, title: $title}';
  }
}

/// generated route for
/// [PatientsDetailsPage]
class PatientsDetailsRoute extends PageRouteInfo<PatientsDetailsRouteArgs> {
  PatientsDetailsRoute({
    Key? key,
    required String patientEmail,
    required String patientName,
    required bool isItForCareGiver,
    required bool isItForDietitian,
    required String patientAccessCode,
  }) : super(
          PatientsDetailsRoute.name,
          path: '/patients-details-page',
          args: PatientsDetailsRouteArgs(
            key: key,
            patientEmail: patientEmail,
            patientName: patientName,
            isItForCareGiver: isItForCareGiver,
            isItForDietitian: isItForDietitian,
            patientAccessCode: patientAccessCode,
          ),
        );

  static const String name = 'PatientsDetailsRoute';
}

class PatientsDetailsRouteArgs {
  const PatientsDetailsRouteArgs({
    this.key,
    required this.patientEmail,
    required this.patientName,
    required this.isItForCareGiver,
    required this.isItForDietitian,
    required this.patientAccessCode,
  });

  final Key? key;

  final String patientEmail;

  final String patientName;

  final bool isItForCareGiver;

  final bool isItForDietitian;

  final String patientAccessCode;

  @override
  String toString() {
    return 'PatientsDetailsRouteArgs{key: $key, patientEmail: $patientEmail, patientName: $patientName, isItForCareGiver: $isItForCareGiver, isItForDietitian: $isItForDietitian, patientAccessCode: $patientAccessCode}';
  }
}

/// generated route for
/// [PractitionerDietPage]
class PractitionerDietRoute extends PageRouteInfo<PractitionerDietRouteArgs> {
  PractitionerDietRoute({
    Key? key,
    required String patientAccessCode,
  }) : super(
          PractitionerDietRoute.name,
          path: '/practitioner-diet-page',
          args: PractitionerDietRouteArgs(
            key: key,
            patientAccessCode: patientAccessCode,
          ),
        );

  static const String name = 'PractitionerDietRoute';
}

class PractitionerDietRouteArgs {
  const PractitionerDietRouteArgs({
    this.key,
    required this.patientAccessCode,
  });

  final Key? key;

  final String patientAccessCode;

  @override
  String toString() {
    return 'PractitionerDietRouteArgs{key: $key, patientAccessCode: $patientAccessCode}';
  }
}

/// generated route for
/// [PractitionerPatientsRecordPage]
class PractitionerPatientsRecordRoute
    extends PageRouteInfo<PractitionerPatientsRecordRouteArgs> {
  PractitionerPatientsRecordRoute({
    Key? key,
    required String praPatientEmailOnPraView,
  }) : super(
          PractitionerPatientsRecordRoute.name,
          path: '/practitioner-patients-record-page',
          args: PractitionerPatientsRecordRouteArgs(
            key: key,
            praPatientEmailOnPraView: praPatientEmailOnPraView,
          ),
        );

  static const String name = 'PractitionerPatientsRecordRoute';
}

class PractitionerPatientsRecordRouteArgs {
  const PractitionerPatientsRecordRouteArgs({
    this.key,
    required this.praPatientEmailOnPraView,
  });

  final Key? key;

  final String praPatientEmailOnPraView;

  @override
  String toString() {
    return 'PractitionerPatientsRecordRouteArgs{key: $key, praPatientEmailOnPraView: $praPatientEmailOnPraView}';
  }
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
class RecordRoute extends PageRouteInfo<RecordRouteArgs> {
  RecordRoute({
    Key? key,
    required bool isItFromPatientsView,
    String? praPatientEmailOnPraView,
  }) : super(
          RecordRoute.name,
          path: 'record-page',
          args: RecordRouteArgs(
            key: key,
            isItFromPatientsView: isItFromPatientsView,
            praPatientEmailOnPraView: praPatientEmailOnPraView,
          ),
        );

  static const String name = 'RecordRoute';
}

class RecordRouteArgs {
  const RecordRouteArgs({
    this.key,
    required this.isItFromPatientsView,
    this.praPatientEmailOnPraView,
  });

  final Key? key;

  final bool isItFromPatientsView;

  final String? praPatientEmailOnPraView;

  @override
  String toString() {
    return 'RecordRouteArgs{key: $key, isItFromPatientsView: $isItFromPatientsView, praPatientEmailOnPraView: $praPatientEmailOnPraView}';
  }
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
class ProfileRoute extends PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    Key? key,
    required bool isItAPatient,
  }) : super(
          ProfileRoute.name,
          path: 'profile-page',
          args: ProfileRouteArgs(
            key: key,
            isItAPatient: isItAPatient,
          ),
        );

  static const String name = 'ProfileRoute';
}

class ProfileRouteArgs {
  const ProfileRouteArgs({
    this.key,
    required this.isItAPatient,
  });

  final Key? key;

  final bool isItAPatient;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, isItAPatient: $isItAPatient}';
  }
}

/// generated route for
/// [GlucoseReadingViewPage]
class GlucoseReadingViewRoute
    extends PageRouteInfo<GlucoseReadingViewRouteArgs> {
  GlucoseReadingViewRoute({
    Key? key,
    required List<dynamic> dataReading,
  }) : super(
          GlucoseReadingViewRoute.name,
          path: 'glucose-reading-view-page',
          args: GlucoseReadingViewRouteArgs(
            key: key,
            dataReading: dataReading,
          ),
        );

  static const String name = 'GlucoseReadingViewRoute';
}

class GlucoseReadingViewRouteArgs {
  const GlucoseReadingViewRouteArgs({
    this.key,
    required this.dataReading,
  });

  final Key? key;

  final List<dynamic> dataReading;

  @override
  String toString() {
    return 'GlucoseReadingViewRouteArgs{key: $key, dataReading: $dataReading}';
  }
}

/// generated route for
/// [PractitionerHomePage]
class PractitionerHomeRoute extends PageRouteInfo<PractitionerHomeRouteArgs> {
  PractitionerHomeRoute({
    Key? key,
    required bool isItForDietitian,
  }) : super(
          PractitionerHomeRoute.name,
          path: 'practitioner-home-page',
          args: PractitionerHomeRouteArgs(
            key: key,
            isItForDietitian: isItForDietitian,
          ),
        );

  static const String name = 'PractitionerHomeRoute';
}

class PractitionerHomeRouteArgs {
  const PractitionerHomeRouteArgs({
    this.key,
    required this.isItForDietitian,
  });

  final Key? key;

  final bool isItForDietitian;

  @override
  String toString() {
    return 'PractitionerHomeRouteArgs{key: $key, isItForDietitian: $isItForDietitian}';
  }
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
/// [CarePatientDetailsPage]
class CarePatientDetailsRoute extends PageRouteInfo<void> {
  const CarePatientDetailsRoute()
      : super(
          CarePatientDetailsRoute.name,
          path: 'care-patient-details-page',
        );

  static const String name = 'CarePatientDetailsRoute';
}
