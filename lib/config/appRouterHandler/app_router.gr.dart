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
    SplashRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
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
    AuthenticationOptionsRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const AuthenticationOptionsPage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const DashboardPage(),
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
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          SplashRoute.name,
          path: '/splash-page',
        ),
        RouteConfig(
          AuthenticationRoute.name,
          path: '/authentication-page',
        ),
        RouteConfig(
          AuthenticationOptionsRoute.name,
          path: '/authentication-options-page',
        ),
        RouteConfig(
          DashboardRoute.name,
          path: '/',
          children: [
            RouteConfig(
              HomeRoute.name,
              path: 'home-page',
              parent: DashboardRoute.name,
            ),
            RouteConfig(
              ReminderRoute.name,
              path: 'reminder-page',
              parent: DashboardRoute.name,
            ),
            RouteConfig(
              RecordRoute.name,
              path: 'record-page',
              parent: DashboardRoute.name,
            ),
            RouteConfig(
              DietRoute.name,
              path: 'diet-page',
              parent: DashboardRoute.name,
            ),
            RouteConfig(
              ProfileRoute.name,
              path: 'profile-page',
              parent: DashboardRoute.name,
            ),
          ],
        ),
        RouteConfig(
          TestRoute.name,
          path: '/test-page',
        ),
      ];
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/splash-page',
        );

  static const String name = 'SplashRoute';
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
/// [AuthenticationOptionsPage]
class AuthenticationOptionsRoute extends PageRouteInfo<void> {
  const AuthenticationOptionsRoute()
      : super(
          AuthenticationOptionsRoute.name,
          path: '/authentication-options-page',
        );

  static const String name = 'AuthenticationOptionsRoute';
}

/// generated route for
/// [DashboardPage]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';
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
