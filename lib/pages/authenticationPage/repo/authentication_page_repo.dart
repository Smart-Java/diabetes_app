import 'package:diabetes_care/pages/authenticationPage/model/requestModel/loginRequestModel/login_request_model.dart';
import 'package:flutter/foundation.dart';
import 'package:diabetes_care/localStorage/flutterSecureStorage/app_flutter_secure_storage.dart';
import 'package:diabetes_care/localStorage/localDataUtil/users_local_data_util.dart';
import 'package:diabetes_care/localStorage/sharedPreferences/app_shared_preferences.dart';
import 'package:injectable/injectable.dart';
import 'package:diabetes_care/pages/authenticationPage/data/authentication_page_data.dart';
import 'package:diabetes_care/pages/authenticationPage/model/responseModel/forgotPasswordModel/forgot_password_response_model.dart';
import 'package:diabetes_care/pages/authenticationPage/model/responseModel/loginResponseModel/login_response_model.dart';
import 'package:diabetes_care/pages/authenticationPage/model/responseModel/registerResponseModel/register_response_model.dart';
import 'package:diabetes_care/pages/authenticationPage/model/responseModel/resendVerificationEmailResponseModel/resend_verification_email_response_model.dart';
import 'package:diabetes_care/pages/authenticationPage/model/responseModel/sendEmailForForgotPasswordModel/send_email_for_forgot_password_response_model.dart';
import 'package:diabetes_care/pages/authenticationPage/model/responseModel/userCategoryResponseModel/user_category_response_model.dart';
import 'package:diabetes_care/pages/authenticationPage/repo/repoInterface/authentication_page_repo_interface.dart';

@Injectable(as: AuthenticationPageRepoInterface)
class AuthenticationPageRepo implements AuthenticationPageRepoInterface {
  final AuthenticationPageData authenticationPageData;
  final AppSharedPreferences appSharedPreferences;
  final UsersLocalDataUtil usersLocalDataUtil;
  final AppFlutterSecureStorage appFlutterSecureStorage;
  AuthenticationPageRepo(this.appSharedPreferences, this.authenticationPageData,
      this.appFlutterSecureStorage, this.usersLocalDataUtil);
  @override
  Future<LoginResponseModel?> loginAuthenticationRepoRequest(
      {required Map<String, dynamic> loginRequestJson}) async {
    LoginResponseModel? loginResponseModel;
    var isThereNetworkConnectionForProjectListRequest =
        await authenticationPageData.checkInternetConnectivity();
    if (isThereNetworkConnectionForProjectListRequest == true) {
      loginResponseModel = await authenticationPageData
          .responseOfLoginStatusCode(
        loginRequestJson: loginRequestJson,
      )
          .onError((error, stackTrace) async {
        loginResponseModel =
            const LoginResponseModel(message: 'An error occured, try again');
        return loginResponseModel;
      });

      String emailAddress = LoginRequestModel.fromJson(loginRequestJson).emailAddress;
      String password = LoginRequestModel.fromJson(loginRequestJson).password;

      if (loginResponseModel!.status == true) {
        var email = emailAddress;
        var userAuthToken = loginResponseModel!.data!['token'];
        var isUserAccountDisable = loginResponseModel!.data!['user']['disable'];
        var isUserAccountVerified =
            loginResponseModel!.data!['user']['email_verified_at'] != null
                ? true
                : false;

        if (isUserAccountVerified == true) {
          await appFlutterSecureStorage.setLoginEmailAddress(email);
          await appFlutterSecureStorage.setLoginPassword(password);
          await appFlutterSecureStorage.setLoginToken(userAuthToken);
        }

        var hasUserLogin =
            await appSharedPreferences.readUserLoginState() ?? false;
        debugPrint('this is the user login state $hasUserLogin');
        if (hasUserLogin == false) {
          await appFlutterSecureStorage.setLastLoginDate();
        }

        bool checkIfUserIsInStorage =
            await usersLocalDataUtil.isUserInDatabase(email) as bool;
        if (checkIfUserIsInStorage == false) {
          await usersLocalDataUtil.addUserToStorage(
            email: emailAddress,
            firstName: loginResponseModel!.data!['user']['name'],
            imagePath: loginResponseModel!.data!['user']['profileImage'],
            lastName: loginResponseModel!.data!['user']['lastName'],
            mainPhone: loginResponseModel!.data!['user']['phoneNumber'],
            userCategory: loginResponseModel!.data!['user']['category'],
          );
        } else {
          await usersLocalDataUtil.updateUserRecord(
            email: emailAddress,
            firstName: loginResponseModel!.data!['user']['name'],
            imagePath: loginResponseModel!.data!['user']['profileImage'],
            lastName: loginResponseModel!.data!['user']['lastName'],
            mainPhone: loginResponseModel!.data!['user']['phoneNumber'],
            userCategory: loginResponseModel!.data!['user']['category'],
          );
        }
        if (isUserAccountVerified == true) {
          await appSharedPreferences.cacheUserLoginState(true);
          await appSharedPreferences.cacheUserLogout(false);
          await appSharedPreferences.cacheAuthEmailAddress(email);
          await appSharedPreferences.cacheUserAccountEnableAndDisableState(
              isUserAccountDisable == 1 ? true : false);
        }
        debugPrint('this is the login  $isUserAccountDisable');
      }
    } else {
      loginResponseModel =
          const LoginResponseModel(message: 'Check your internet connection');
    }
    return loginResponseModel;
  }

  @override
  Future<ResendVerificationEmailResponseModel?>
      resendVerificationEmailAuthenticationRepoRequest({
    required Map<String, dynamic> verificationEmailRequestJson,
  }) async {
    ResendVerificationEmailResponseModel? resendVerificationEmailResponseModel;
    var isThereNetworkConnectionForProjectListRequest =
        await authenticationPageData.checkInternetConnectivity();
    if (isThereNetworkConnectionForProjectListRequest == true) {
      resendVerificationEmailResponseModel = await authenticationPageData
          .responseOfResendVerificationEmailAuthStatusCode(
              verificationEmailRequestJson: verificationEmailRequestJson)
          .onError((error, stackTrace) {
        resendVerificationEmailResponseModel =
            const ResendVerificationEmailResponseModel(
                message: 'An error occured, try again');
        return resendVerificationEmailResponseModel;
      });
    } else {
      resendVerificationEmailResponseModel =
          const ResendVerificationEmailResponseModel(
              message: 'Check your internet connection');
    }
    return resendVerificationEmailResponseModel;
  }

  @override
  Future<RegisterResponseModel?> registerAuthenticationRepoRequest({
    required Map<String, dynamic> registerRequestJson,
  }) async {
    RegisterResponseModel? registerResponseModel;
    var isThereNetworkConnectionForProjectListRequest =
        await authenticationPageData.checkInternetConnectivity();
    if (isThereNetworkConnectionForProjectListRequest == true) {
      registerResponseModel = await authenticationPageData
          .responseOfRegistrationStatusCode(
              registerRequestJson: registerRequestJson)
          .onError((error, stackTrace) async {
        registerResponseModel =
            const RegisterResponseModel(message: 'An error occured, try again');
        return registerResponseModel;
      });

      return registerResponseModel;
    } else {
      registerResponseModel = const RegisterResponseModel(
          message: 'Check your internet connection');
    }
    return registerResponseModel;
  }

  @override
  Future<bool?> logoutUserOrDriverAuthenticationRepoRequest() async {
    bool? isUserRequestSuccessful;
    var isThereNetworkConnectionForProjectListRequest =
        await authenticationPageData.checkInternetConnectivity();
    var cacheEmail = await appSharedPreferences.readAuthEmailAddress();
    if (isThereNetworkConnectionForProjectListRequest == true) {
      isUserRequestSuccessful = await authenticationPageData
          .responseFromLogOutRequestStatusCode()
          .onError((error, stackTrace) {
        isUserRequestSuccessful = false;
        return isUserRequestSuccessful;
      });
      if (isUserRequestSuccessful == true) {
        await appSharedPreferences.cacheUserLoginState(false);
      }
      if (isUserRequestSuccessful == true) {
        await usersLocalDataUtil.updateUserRecordForLogoutState(cacheEmail);
        await appSharedPreferences.cacheUserLoginState(false);
        await appSharedPreferences.cacheUserLogout(true);
      }
    } else {
      isUserRequestSuccessful = false;
    }
    return isUserRequestSuccessful;
  }

  @override
  Future<UserCategoryResponseModel?>
      getUserCatgoriesForAuthenticationRepoRequest() async {
    UserCategoryResponseModel? userCategoryResponseModel;
    var isThereNetworkConnectionForProjectListRequest =
        await authenticationPageData.checkInternetConnectivity();
    if (isThereNetworkConnectionForProjectListRequest == true) {
      userCategoryResponseModel = await authenticationPageData
          .responseFromGettingUserCategoriesForAuthStatusCode()
          .onError((error, stackTrace) {
        userCategoryResponseModel = const UserCategoryResponseModel(
            message: 'An error occured, try again');
        return userCategoryResponseModel;
      });
    } else {
      userCategoryResponseModel = const UserCategoryResponseModel(
          message: 'Check your internet connection');
    }
    return userCategoryResponseModel;
  }

  @override
  Future<ForgotPasswordResponseModel?> forgotPasswordAuthenticationRepoRequest(
      {required Map<String, dynamic> forgotPasswordRequestJson}) async {
    ForgotPasswordResponseModel? forgotPasswordResponseModel;
    var isThereNetworkConnectionForProjectListRequest =
        await authenticationPageData.checkInternetConnectivity();
    if (isThereNetworkConnectionForProjectListRequest == true) {
      forgotPasswordResponseModel = await authenticationPageData
          .responseOfForgotPasswordAuthValidationStatusCode(
        forgotPasswordRequestJson: forgotPasswordRequestJson,
      )
          .onError((error, stackTrace) async {
        forgotPasswordResponseModel = const ForgotPasswordResponseModel(
            message: 'An error occured, try again');
        return forgotPasswordResponseModel;
      });
    } else {
      forgotPasswordResponseModel = const ForgotPasswordResponseModel(
          message: 'Check your internet connection');
    }
    return forgotPasswordResponseModel;
  }

  @override
  Future<SendEmailForForgotPasswordResponseModel?>
      sendTokenToEmailForForgotPasswordAuthenticationRepoRequest(
          {required Map<String, dynamic>
              forgotPasswordTokenRequestJson}) async {
    SendEmailForForgotPasswordResponseModel?
        sendEmailForForgotPasswordResponseModel;
    var isThereNetworkConnectionForProjectListRequest =
        await authenticationPageData.checkInternetConnectivity();
    if (isThereNetworkConnectionForProjectListRequest == true) {
      sendEmailForForgotPasswordResponseModel = await authenticationPageData
          .responseOfSendTokenToEmailForgotPasswordAuthValidationStatusCode(
        forgotPasswordTokenRequestJson: forgotPasswordTokenRequestJson,
      )
          .onError((error, stackTrace) async {
        sendEmailForForgotPasswordResponseModel =
            const SendEmailForForgotPasswordResponseModel(
                message: 'An error occured, try again');
        return sendEmailForForgotPasswordResponseModel;
      });
    } else {
      sendEmailForForgotPasswordResponseModel =
          const SendEmailForForgotPasswordResponseModel(
              message: 'Check your internet connection');
    }
    return sendEmailForForgotPasswordResponseModel;
  }
}
