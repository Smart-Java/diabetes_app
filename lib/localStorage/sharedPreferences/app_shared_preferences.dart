import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class AppSharedPreferences {
  Future cacheAuthEmailAddress(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
  }

  Future cacheDeviceOnboarded(bool onboarded) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDeviceOnBoarded', onboarded);
  }

  Future cacheUserLoginState(bool login) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isUserLogin', login);
  }
  
  Future cacheDeviceAuthState() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('deviceAuthState', true);
  }

  Future cacheUserLogout(bool logout) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isUserLogout', logout);
  }

  Future cacheUserTokenAfterSuccessfulAuth(String userToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userAuthToken', userToken);
  }

  Future cacheUserDriverVehicleName(String vehicleName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userDriverVehicleName', vehicleName);
  }
  
  Future cacheUserDriverFormerLocationAddress(String locationAddress) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userDriverFormerLocationAddress', locationAddress);
  }

  Future cacheUserDriverApprovedState(bool approvedState) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
      'cacheUserDriverApprovedState',
      approvedState,
    );
  }

  Future cacheUserDriverGoOnlineDateTimeState(String goOnlineDateTime) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      'cacheUserDriverGoOnlineDateTimeState',
      goOnlineDateTime,
    );
  }

  Future cacheUserDriverGoOfflineDateTimeState(String goOfflineDateTime) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      'cacheUserDriverGoOfflineDateTimeState',
      goOfflineDateTime,
    );
  }

  Future cacheUserDriverAssetState(bool hasAssetBeenSubmitted) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
      'cacheUserDriverAssetState',
      hasAssetBeenSubmitted,
    );
  }

  Future cacheUserAccountEnableAndDisableState(bool isItADisableState) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
      'cacheUserAccountEnableAndDisableState',
      isItADisableState,
    );
  }

  Future cacheUserDriverOnlineState(bool onlineState) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
      'cacheUserDriverOnlineState',
      onlineState,
    );
  }

  Future cacheUserDriverLocationLatitudeState(
      double driverLocationLatitude) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(
      'cacheUserDriverLocationLatitudeState',
      driverLocationLatitude,
    );
  }

  Future cacheUserDriverLocationLongitudeState(
      double driverLocationLongitude) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(
      'cacheUserDriverLocationLongitudeState',
      driverLocationLongitude,
    );
  }

  Future cacheUserDriverWaitingOrderListLengthState(
      int driverWaitingOrderListLength) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(
      'cacheUserDriverWaitingOrderListLengthState',
      driverWaitingOrderListLength,
    );
  }

  Future cacheUserDriverCurrentOrderListLengthState(
      int driverCurrentOrderListLength) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(
      'cacheUserDriverCurrentOrderListLengthState',
      driverCurrentOrderListLength,
    );
  }

  Future cacheUserDriverCompletedOrderListLengthState(
      int driverCompletedOrderListLength) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(
      'cacheUserDriverCompletedOrderListLengthState',
      driverCompletedOrderListLength,
    );
  }

  Future cacheUserDriverAssignedOrderListLengthState(
      int driverAssignedOrderListLength) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(
      'cacheUserDriverAssignedOrderListLengthState',
      driverAssignedOrderListLength,
    );
  }

  Future cacheUserCustomerAllOrderListLengthState(
      int customerAllOrderListLength) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(
      'cacheUserCustomerAllOrderListLengthState',
      customerAllOrderListLength,
    );
  }

  Future readAuthEmailAddress() async {
    final prefs = await SharedPreferences.getInstance();
    var email = prefs.getString('email');
    return email;
  }

  Future readDeviceOnboarded() async {
    final prefs = await SharedPreferences.getInstance();
    var isDeviceOnBoarded = prefs.getBool('isDeviceOnBoarded');
    return isDeviceOnBoarded;
  }

  Future readUserLoginState() async {
    final prefs = await SharedPreferences.getInstance();
    var isUserLogin = prefs.getBool('isUserLogin');
    return isUserLogin;
  }
  
  Future readDeviceAuthState() async {
    final prefs = await SharedPreferences.getInstance();
    var hasDeviceBeenAuthenticated = prefs.getBool('deviceAuthState');
    return hasDeviceBeenAuthenticated;
  }

  Future readUserLogOutState() async {
    final prefs = await SharedPreferences.getInstance();
    var isUserLogout = prefs.getBool('isUserLogout');
    return isUserLogout;
  }

  Future readUserAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    var userAuthToken = prefs.getString('userAuthToken');
    return userAuthToken;
  }

  Future readUserDriverApprovedState() async {
    final prefs = await SharedPreferences.getInstance();
    var userCacheUserDriverApprovedState =
        prefs.getBool('cacheUserDriverApprovedState');
    return userCacheUserDriverApprovedState;
  }

  Future readUserDriverGoOfflineDateTimeState() async {
    final prefs = await SharedPreferences.getInstance();
    var driverGoOfflineDateTimeState =
        prefs.getString('cacheUserDriverGoOfflineDateTimeState');
    return driverGoOfflineDateTimeState;
  }

  Future readUserDriverGoOnlineDateTimeState() async {
    final prefs = await SharedPreferences.getInstance();
    var driverGoOnlineDateTimeState =
        prefs.getString('cacheUserDriverGoOnlineDateTimeState');
    return driverGoOnlineDateTimeState;
  }

  Future readUserDriverAssetState() async {
    final prefs = await SharedPreferences.getInstance();
    var hasDriverAssetBeenSubmitted =
        prefs.getBool('cacheUserDriverAssetState');
    return hasDriverAssetBeenSubmitted;
  }

  Future readUserDriverEnableDisableAccountState() async {
    final prefs = await SharedPreferences.getInstance();
    var isAccountDisable =
        prefs.getBool('cacheUserAccountEnableAndDisableState');
    return isAccountDisable;
  }

  Future readUserDriverOnlineState() async {
    final prefs = await SharedPreferences.getInstance();
    var userCacheUserDriverOnlineState =
        prefs.getBool('cacheUserDriverOnlineState');
    return userCacheUserDriverOnlineState;
  }

  Future readUserDriverLocationLatitudeState() async {
    final prefs = await SharedPreferences.getInstance();
    var userCacheUserDriverLocationLatitudeState =
        prefs.getDouble('cacheUserDriverLocationLatitudeState');
    return userCacheUserDriverLocationLatitudeState;
  }

  Future readUserDriverLocationLongitudeState() async {
    final prefs = await SharedPreferences.getInstance();
    var userCacheUserDriverLocationLongitudeState =
        prefs.getDouble('cacheUserDriverLocationLongitudeState');
    return userCacheUserDriverLocationLongitudeState;
  }

  Future readUserDriverVehicleName() async {
    final prefs = await SharedPreferences.getInstance();
    var userCacheUserDriverVehicleName =
        prefs.getString('userDriverVehicleName');
    return userCacheUserDriverVehicleName;
  }
  
  Future readUserDriverFormerLocationAddress() async {
    final prefs = await SharedPreferences.getInstance();
    var userCacheUserDriverVehicleName =
        prefs.getString('userDriverFormerLocationAddress');
    return userCacheUserDriverVehicleName;
  }

  Future readUserDriverWaitingOrderListLength() async {
    final prefs = await SharedPreferences.getInstance();
    var cacheUserDriverWaitingOrderListLength =
        prefs.getInt('cacheUserDriverWaitingOrderListLengthState');
    return cacheUserDriverWaitingOrderListLength;
  }

  Future readUserDriverCurrentOrderListLength() async {
    final prefs = await SharedPreferences.getInstance();
    var cacheUserDriverCurrentOrderListLength =
        prefs.getInt('cacheUserDriverCurrentOrderListLengthState');
    return cacheUserDriverCurrentOrderListLength;
  }

  Future readUserDriverCompletedOrderListLength() async {
    final prefs = await SharedPreferences.getInstance();
    var cacheUserDriverCompletedOrderListLength =
        prefs.getInt('cacheUserDriverCompletedOrderListLengthState');
    return cacheUserDriverCompletedOrderListLength;
  }

  Future readUserDriverAssignedOrderListLength() async {
    final prefs = await SharedPreferences.getInstance();
    var cacheUserDriverAssignedOrderListLength =
        prefs.getInt('cacheUserDriverAssignedOrderListLengthState');
    return cacheUserDriverAssignedOrderListLength;
  }

  Future readUserCustomerAllOrderListLength() async {
    final prefs = await SharedPreferences.getInstance();
    var cacheUserCustomerAllOrderListLength =
        prefs.getInt('cacheUserCustomerAllOrderListLengthState');
    return cacheUserCustomerAllOrderListLength;
  }
}

Future cacheAppLastPrimaryRoute(String appPrimaryRoute) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('appPrimaryRoute', appPrimaryRoute);
}

Future cacheProminentDisclosureState() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('prominentDisclosureState', true);
}

Future cacheIfLastAccountIsLogout(bool logout) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('accountLogout', logout);
}

Future cacheIfUserHasReadTheInstruction() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('instructionRead', true);
}

Future readAppLastPrimaryMainRoute() async {
  final prefs = await SharedPreferences.getInstance();
  var appLastRoute = prefs.getString('appPrimaryRoute');
  return appLastRoute;
}

Future readProminentDisclosureState() async {
  final prefs = await SharedPreferences.getInstance();
  var prominentDisclosureState = prefs.getBool('prominentDisclosureState');
  return prominentDisclosureState;
}

Future readIfLastAccountIsLogout() async {
  final prefs = await SharedPreferences.getInstance();
  var appLastRoute = prefs.getBool('accountLogout');
  return appLastRoute;
}

Future readIfUserHasReadInstruction() async {
  final prefs = await SharedPreferences.getInstance();
  var readInstruction = prefs.getBool('instructionRead');
  return readInstruction;
}

Future<int> getAutomationState() async {
  int nextState = 0;
  var random = Random();
  await Future.delayed(
    const Duration(seconds: 0),
  ).then((value) {
    for (var i = 0; i < 10; i++) {
      nextState = random.nextInt(2);
      debugPrint('auto $i $nextState');
    }
  });
  return nextState;
}

Future readAllowAutomation() async {
  final prefs = await SharedPreferences.getInstance();
  
  int automationState = await getAutomationState();

  await prefs.setBool(
    'allowAutomationAuth',
    automationState == 0 ? false : true,
  );
  var appLastRoute = prefs.getBool('allowAutomationAuth');
  return appLastRoute;
}
