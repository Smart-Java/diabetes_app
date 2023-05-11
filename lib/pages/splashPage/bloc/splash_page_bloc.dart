import 'dart:math';

import 'package:diabetes_care/pages/authenticationPage/model/requestModel/loginRequestModel/login_request_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:diabetes_care/localStorage/flutterSecureStorage/app_flutter_secure_storage.dart';
import 'package:diabetes_care/localStorage/localDataUtil/users_local_data_util.dart';
import 'package:diabetes_care/localStorage/sharedPreferences/app_shared_preferences.dart';
import 'package:diabetes_care/pages/authenticationPage/repo/repoInterface/authentication_page_repo_interface.dart';
import 'package:diabetes_care/pages/splashPage/bloc/event/splash_page_event.dart';
import 'package:diabetes_care/pages/splashPage/bloc/state/splash_page_state.dart';

@injectable
class SplashPageBloc extends Bloc<SplashPageEvent, SplashPageState> {
  final AppSharedPreferences appSharedPreferences;
  final AppFlutterSecureStorage appFlutterSecureStorage;
  final AuthenticationPageRepoInterface authenticationPageRepo;
  final UsersLocalDataUtil usersLocalDataUtil;

  String? message = '';
  SplashPageBloc(
    this.appSharedPreferences,
    this.usersLocalDataUtil,
    this.appFlutterSecureStorage,
    this.authenticationPageRepo,
  ) : super(const SplashPageState()) {
    on<LoadOnBoardingPageEvent>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
      ));
      await Future.delayed(const Duration(
        seconds: 3,
      ));
      var hasUserAcceptOnBoarding =
          await appSharedPreferences.readDeviceOnboarded() ?? false;
      debugPrint('onBoarded $hasUserAcceptOnBoarding');
      var hasUserLogin =
          await appSharedPreferences.readUserLoginState() ?? false;

      var hasUserLogout =
          await appSharedPreferences.readUserLogOutState() ?? false;
      bool hasDeviceBeenAuthenticated =
          await appSharedPreferences.readDeviceAuthState() ?? false;
      debugPrint(
          'this is logout state $hasUserLogout, device auth $hasDeviceBeenAuthenticated and login state $hasUserLogin');
      if (hasDeviceBeenAuthenticated == true) {
        if (hasUserLogout == true) {
          emit(state.copyWith(
            isLoading: false,
            // loadAuthenticationPage: true,
            hasDeviceBeenAuthenticated: false,
          ));
        } else {
          if (hasUserLogin == true) {
            emit(
              state.copyWith(
                isLoading: false,
                automateUserLogin: true,
              ),
            );
          } else {
            emit(
              state.copyWith(
                isLoading: false,
                loadOnBoardingPage: true,
                loadAuthenticationPage: hasUserAcceptOnBoarding,
              ),
            );
          }
        }
      } else {
        if (hasUserAcceptOnBoarding == true) {
          emit(
            state.copyWith(
              isLoading: false,
              hasDeviceBeenAuthenticated: hasDeviceBeenAuthenticated,
            ),
          );
        } else {
          emit(
            state.copyWith(
              isLoading: false,
              loadOnBoardingPage: true,
              loadAuthenticationPage: hasUserAcceptOnBoarding,
            ),
          );
        }
      }
      debugPrint('this is the ${state.loadOnBoardingPage.toString()}');
    });
    on<CheckUserLoginStatusEvent>((event, emit) async {
      bool userHasLogin =
          await appSharedPreferences.readUserLoginState() ?? false;
      bool hasDeviceBeenAuthenticated =
          await appSharedPreferences.readDeviceAuthState() ?? false;
      debugPrint('hello this is $userHasLogin');
      if (hasDeviceBeenAuthenticated == true) {
        if (userHasLogin == true) {
          emit(state.copyWith(
            isLoading: true,
            automateUserLogin: true,
          ));
        } else {
          emit(state.copyWith(
            isLoading: false,
            automateUserLogin: false,
            hasDeviceBeenAuthenticated: hasDeviceBeenAuthenticated,
          ));
        }
      } else {
        emit(state.copyWith(
          isLoading: false,
          automateUserLogin: false,
        ));
      }
    });
    on<AutomateUserLoginPageEvent>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
        loadAuthenticationPage: false,
      ));

      var emailAddress = await appFlutterSecureStorage.readLoginEmailAddress();
      var password = await appFlutterSecureStorage.readLoginPassword();

      var random = Random();
      int numberOfDaysForAutomatedLogin = 0;
      for (var i = 0; i < 10; i++) {
        numberOfDaysForAutomatedLogin = random.nextInt(20);
      }

      debugPrint('this is the emailaddress $emailAddress');

      var readSavedLastLoginDate =
          await appFlutterSecureStorage.readLastLoginDate();
      var lastLoginDate = DateTime.parse(readSavedLastLoginDate);
      var presentDate = DateTime.now();

      if ((lastLoginDate.month == presentDate.month) &&
          (lastLoginDate.year == presentDate.year)) {
        var lastLoginDateMonth = lastLoginDate.month;
        var lastLoginDateDay = lastLoginDate.day;
        bool isItLastDayOfTheMonth = false;
        int logoutDateDay;
        if (lastLoginDateMonth == 2) {
          var remainingDays = 28 - lastLoginDateDay;
          if (remainingDays > numberOfDaysForAutomatedLogin) {
            logoutDateDay = lastLoginDate.day + numberOfDaysForAutomatedLogin;
          } else {
            logoutDateDay = lastLoginDate.day + remainingDays;
            if (logoutDateDay == 28) {
              isItLastDayOfTheMonth = true;
            }
          }
        } else if ((lastLoginDateMonth == 4) ||
            (lastLoginDateMonth == 6) ||
            (lastLoginDateMonth == 9) ||
            (lastLoginDateMonth == 11)) {
          var remainingDays = 30 - lastLoginDateDay;
          if (remainingDays > numberOfDaysForAutomatedLogin) {
            logoutDateDay = lastLoginDate.day + numberOfDaysForAutomatedLogin;
          } else {
            logoutDateDay = lastLoginDate.day + remainingDays;
            if (logoutDateDay == 30) {
              isItLastDayOfTheMonth = true;
            }
          }
        } else {
          var remainingDays = 31 - lastLoginDateDay;
          if (remainingDays > numberOfDaysForAutomatedLogin) {
            logoutDateDay = lastLoginDate.day + numberOfDaysForAutomatedLogin;
          } else {
            logoutDateDay = lastLoginDate.day + remainingDays;
            if (logoutDateDay == 31) {
              isItLastDayOfTheMonth = true;
            }
          }
        }

        var presentDateDay = presentDate.day;

        debugPrint('logout date day is $logoutDateDay');
        debugPrint('present date day is $presentDateDay');

        if ((logoutDateDay == presentDateDay) &&
            isItLastDayOfTheMonth == false) {
          await appSharedPreferences.cacheUserLogout(true);
          emit(state.copyWith(
            isLoading: false,
            loadOnBoardingPage: false,
            loadAuthenticationPage: true,
          ));
        } else {
          String checkConnection = 'check your internet connection';

          String deviceName = '';

          LoginRequestModel loginRequestModel = LoginRequestModel(
            emailAddress: emailAddress,
            password: password,
            deviceName: deviceName,
          );

          var loginUserResponse =
              await authenticationPageRepo.loginAuthenticationRepoRequest(
                loginRequestJson: loginRequestModel.toJson()
              );
          // debugPrint('present date day is ${loginUserResponse!.status}');
          bool isAccountVerified = false;

          if (loginUserResponse!.status == true) {
              isAccountVerified =
                  loginUserResponse.data['user']['email_verified_at'] != null
                      ? true
                      : false;
              if (isAccountVerified == true) {
                await appSharedPreferences.cacheDeviceAuthState();
              }

              message = loginUserResponse.status == true
                  ? 'Login successfully done'
                  : loginUserResponse.message;

              emit(state.copyWith(
                isLoading: false,
                loginResponseModel: loginUserResponse,
                loadAuthenticationPage: loginUserResponse.status == false
                    ? true
                    : isAccountVerified == true
                        ? false
                        : true,
                message: isAccountVerified == true
                    ? message
                    : 'Account not Verified',
                isAuthenticationSuccessful: loginUserResponse.status == true
                    ? isAccountVerified == true
                        ? true
                        : false
                    : false,
                automateUserLogin: false,
              ));
          } else {
            if (loginUserResponse.message!.toLowerCase() != checkConnection) {
              emit(state.copyWith(
                isLoading: false,
                // loadAuthenticationPage: true,
                hasDeviceBeenAuthenticated: false,
              ));
            } else {
              emit(state.copyWith(
                isLoading: false,
                message: checkConnection.replaceFirst(
                    checkConnection[0], checkConnection[0].toUpperCase()),
                loadAuthenticationPage: false,
                automateUserLogin: false,
                isAuthenticationSuccessful: loginUserResponse.status ?? false,
              ));
            }
          }
        }
      } else {
        emit(state.copyWith(
          isLoading: false,
          loadOnBoardingPage: false,
          loadAuthenticationPage: true,
        ));
      }
    });
  }
}
