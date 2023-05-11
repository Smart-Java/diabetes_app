import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:diabetes_care/api/apiEndpoints/api_end_points.dart';
import 'package:diabetes_care/api/apiRequestHelper/api_request_helper.dart';
import 'package:diabetes_care/localStorage/flutterSecureStorage/app_flutter_secure_storage.dart';
import 'package:diabetes_care/localStorage/sharedPreferences/app_shared_preferences.dart';
import 'package:diabetes_care/pages/authenticationPage/model/responseModel/forgotPasswordModel/forgot_password_response_model.dart';
import 'package:diabetes_care/pages/authenticationPage/model/responseModel/loginResponseModel/login_response_model.dart';
import 'package:diabetes_care/pages/authenticationPage/model/responseModel/registerResponseModel/register_response_model.dart';
import 'package:diabetes_care/pages/authenticationPage/model/responseModel/resendVerificationEmailResponseModel/resend_verification_email_response_model.dart';
import 'package:diabetes_care/pages/authenticationPage/model/responseModel/sendEmailForForgotPasswordModel/send_email_for_forgot_password_response_model.dart';
import 'package:diabetes_care/pages/authenticationPage/model/responseModel/userCategoryResponseModel/user_category_response_model.dart';
import 'package:diabetes_care/pages/authenticationPage/model/responseModel/userDataResponseModel/user_data_response_model.dart';
import 'package:diabetes_care/util/networkRequestMsgErrorStatusCodeConstantValueClass/network_request_error_msg_status_code_constant_value_class.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthenticationPageData {
  ApiRequestHelper apiRequestHelper;
  AppSharedPreferences appSharedPreferences;
  Connectivity connectivity;
  AppFlutterSecureStorage appFlutterSecureStorage;
  AuthenticationPageData(
    this.apiRequestHelper,
    this.appSharedPreferences,
    this.connectivity,
    this.appFlutterSecureStorage,
  );

  Future loginAuthenticationRequest(
      {required Map<String, dynamic> loginRequestJson}) async {
    dynamic loginAuthenticationRequestResponse;

    loginAuthenticationRequestResponse = await apiRequestHelper.postRequest(
        APIEndPoints.loginEndPoint,
        isDataRequired: true,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        jsonData: loginRequestJson);
    return loginAuthenticationRequestResponse;
  }

  Future registerAuthenticationRequest({
    required Map<String, dynamic> registerRequestJson,
  }) async {
    dynamic registerAuthenticationRequestResponse;

    registerAuthenticationRequestResponse = await apiRequestHelper.postRequest(
      APIEndPoints.registerEndPoint,
      isDataRequired: true,
      jsonData: registerRequestJson,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
    );
    return registerAuthenticationRequestResponse;
  }

  Future resendVerificationEmailAuthenticationRequest({
    required Map<String, dynamic> verificationEmailRequestJson,
  }) async {
    dynamic resendVerificationEmailAuthenticationRequestResponse;

    resendVerificationEmailAuthenticationRequestResponse =
        await apiRequestHelper.postRequest(
      APIEndPoints.resendVerificationEmailEndPoint,
      isDataRequired: true,
      jsonData: verificationEmailRequestJson,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
    );
    return resendVerificationEmailAuthenticationRequestResponse;
  }

  Future forgotPaswordAuthenticationRequest(
      {required Map<String, dynamic> forgotPasswordRequestJson}) async {
    dynamic forgotPasswordAuthenticationRequestResponse;

    forgotPasswordAuthenticationRequestResponse =
        await apiRequestHelper.postRequest(
      APIEndPoints.forgotPasswordEndPoint,
      isDataRequired: true,
      jsonData: forgotPasswordRequestJson,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
    );
    return forgotPasswordAuthenticationRequestResponse;
  }

  Future sendTokenToEmailForForgotPaswordAuthenticationRequest(
      {required Map<String, dynamic> forgotPasswordTokenRequestJson}) async {
    dynamic sendTokenToEmailForForgotPasswordAuthenticationRequestResponse;

    sendTokenToEmailForForgotPasswordAuthenticationRequestResponse =
        await apiRequestHelper.postRequest(
      APIEndPoints.sendTokenToEmailForForgotPasswordEndPoint,
      isDataRequired: true,
      jsonData: forgotPasswordTokenRequestJson,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
    );
    return sendTokenToEmailForForgotPasswordAuthenticationRequestResponse;
  }

  Future logoutRequest() async {
    dynamic logoutResponse;

    logoutResponse = await apiRequestHelper.postRequest(
        APIEndPoints.logoutEndPoint,
        headers: {
          APIEndPointsParameter.authHeader: APIEndPointsParameter.authHeader
        },
        isDataRequired: false);
    return logoutResponse;
  }

  Future getUserCategoriesForAuthenticationRequest() async {
    dynamic userCategoriesForAuthenticationResponse;
    userCategoriesForAuthenticationResponse = await apiRequestHelper
        .getRequest(APIEndPoints.userCategoriesEndPoint, headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    });
    return userCategoriesForAuthenticationResponse;
  }

  Future getUserDataAfterAuthenticationRequest() async {
    dynamic userDataAfterSuccessfulAuthenticationResponse;
    userDataAfterSuccessfulAuthenticationResponse = await apiRequestHelper
        .getRequest(APIEndPoints.userDataEndPoint, headers: {
      APIEndPointsParameter.authHeader: APIEndPointsParameter.authHeader,
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    });
    return userDataAfterSuccessfulAuthenticationResponse;
  }

  Future<LoginResponseModel?> responseOfLoginStatusCode(
      {required Map<String, dynamic> loginRequestJson}) async {
    var userLoginAuthResponse = await loginAuthenticationRequest(
      loginRequestJson: loginRequestJson,
    );
    debugPrint('this is the login $userLoginAuthResponse');

    LoginResponseModel? loginResponseModel;
    if (userLoginAuthResponse is Map) {
      var statusCode = userLoginAuthResponse['statusCode'];
      switch (statusCode) {
        case 500:
          loginResponseModel = LoginResponseModel(
            message: NetworkRequestErrorMsgStatusCodeConstantValueClass
                .internalError,
          );
          break;
        case 404:
          loginResponseModel = LoginResponseModel(
            message:
                NetworkRequestErrorMsgStatusCodeConstantValueClass.notFound,
          );
          break;
        case 400:
          loginResponseModel = LoginResponseModel(
            message:
                NetworkRequestErrorMsgStatusCodeConstantValueClass.badRequest,
          );
          break;
        default:
          if (statusCode == 422) {
            var passwordError =
                userLoginAuthResponse['data']['errors']['password'];
            var emailError = userLoginAuthResponse['data']['errors']['email'];
            loginResponseModel = LoginResponseModel(
              message: (passwordError != null && passwordError.length > 0)
                  ? passwordError[passwordError.length - 1]
                  : emailError[emailError.length - 1],
            );
          } else {
            loginResponseModel = LoginResponseModel(
                message: userLoginAuthResponse['data']['message']);
          }
      }
    } else {
      int getStatusCode = userLoginAuthResponse.statusCode;

      switch (getStatusCode) {
        case 200:
          loginResponseModel =
              LoginResponseModel.fromJson(userLoginAuthResponse.data);
          break;
        default:
          loginResponseModel = LoginResponseModel(
              message: userLoginAuthResponse.data['message']);
      }
    }
    return loginResponseModel;
  }

  Future<RegisterResponseModel?> responseOfRegistrationStatusCode({
    required Map<String, dynamic> registerRequestJson,
  }) async {
    var userRegisterAuthResponse = await registerAuthenticationRequest(
      registerRequestJson: registerRequestJson,
    );
    debugPrint(userRegisterAuthResponse.toString());
    RegisterResponseModel? registerResponseModel;
    if (userRegisterAuthResponse is Map) {
      var statusCode = userRegisterAuthResponse['statusCode'];
      switch (statusCode) {
        case 500:
          registerResponseModel = RegisterResponseModel(
            message: NetworkRequestErrorMsgStatusCodeConstantValueClass
                .internalError,
          );
          break;
        case 400:
          registerResponseModel = RegisterResponseModel(
            message:
                NetworkRequestErrorMsgStatusCodeConstantValueClass.badRequest,
          );
          break;
        default:
          if (statusCode == 422) {
            var passwordError =
                userRegisterAuthResponse['data']['errors']['password'];
            var emailError =
                userRegisterAuthResponse['data']['errors']['email'];
            registerResponseModel = RegisterResponseModel(
              message: (passwordError != null && passwordError.length > 0)
                  ? passwordError[passwordError.length - 1]
                  : emailError[emailError.length - 1],
            );
          } else {
            registerResponseModel = RegisterResponseModel(
                message: userRegisterAuthResponse['data']['message']);
          }
      }
    } else {
      int getStatusCode = userRegisterAuthResponse.statusCode;

      switch (getStatusCode) {
        case 200:
          registerResponseModel =
              RegisterResponseModel.fromJson(userRegisterAuthResponse.data);
          break;
        default:
          registerResponseModel = RegisterResponseModel(
              message: userRegisterAuthResponse.data['message']);
      }
    }
    return registerResponseModel;
  }

  Future<ResendVerificationEmailResponseModel?>
      responseOfResendVerificationEmailAuthStatusCode({
    required Map<String, dynamic> verificationEmailRequestJson,
  }) async {
    var userResendVerificationEmailRequestResponse =
        await resendVerificationEmailAuthenticationRequest(
            verificationEmailRequestJson: verificationEmailRequestJson);
    ResendVerificationEmailResponseModel? resendVerificationEmailResponseModel;
    if (userResendVerificationEmailRequestResponse is Map) {
      var statusCode = userResendVerificationEmailRequestResponse['statusCode'];
      switch (statusCode) {
        case 500:
          resendVerificationEmailResponseModel =
              ResendVerificationEmailResponseModel(
            message: NetworkRequestErrorMsgStatusCodeConstantValueClass
                .internalError,
          );
          break;
        case 404:
          resendVerificationEmailResponseModel =
              ResendVerificationEmailResponseModel(
            message:
                NetworkRequestErrorMsgStatusCodeConstantValueClass.notFound,
          );
          break;
        case 400:
          resendVerificationEmailResponseModel =
              ResendVerificationEmailResponseModel(
            message:
                NetworkRequestErrorMsgStatusCodeConstantValueClass.notFound,
          );
          break;
        default:
          resendVerificationEmailResponseModel =
              ResendVerificationEmailResponseModel(
                  message: userResendVerificationEmailRequestResponse['data']);
      }
    } else {
      int getStatusCode = userResendVerificationEmailRequestResponse.statusCode;

      switch (getStatusCode) {
        case 200:
          debugPrint(
              'this is ${userResendVerificationEmailRequestResponse.data.runtimeType}');
          resendVerificationEmailResponseModel =
              ResendVerificationEmailResponseModel.fromJson(
                  userResendVerificationEmailRequestResponse.data);
          break;
        default:
          resendVerificationEmailResponseModel =
              ResendVerificationEmailResponseModel(
                  message: userResendVerificationEmailRequestResponse
                      .data['message']);
      }
    }
    return resendVerificationEmailResponseModel;
  }

  Future<ForgotPasswordResponseModel?>
      responseOfForgotPasswordAuthValidationStatusCode(
          {required Map<String, dynamic> forgotPasswordRequestJson}) async {
    var userForgotPasswordAuthValidationResponse =
        await forgotPaswordAuthenticationRequest(
      forgotPasswordRequestJson: forgotPasswordRequestJson,
    );
    debugPrint(userForgotPasswordAuthValidationResponse.toString());
    ForgotPasswordResponseModel? forgotPasswordResponseModel;
    if (userForgotPasswordAuthValidationResponse is Map) {
      var statusCode = userForgotPasswordAuthValidationResponse['statusCode'];
      switch (statusCode) {
        case 500:
          forgotPasswordResponseModel = ForgotPasswordResponseModel(
            message: NetworkRequestErrorMsgStatusCodeConstantValueClass
                .internalError,
          );
          break;
        case 400:
          forgotPasswordResponseModel = ForgotPasswordResponseModel(
            message:
                NetworkRequestErrorMsgStatusCodeConstantValueClass.badRequest,
          );
          break;
        default:
          if (statusCode == 422) {
            var passwordError = userForgotPasswordAuthValidationResponse['data']
                ['errors']['password'];
            var emailError = userForgotPasswordAuthValidationResponse['data']
                ['errors']['email'];
            forgotPasswordResponseModel = ForgotPasswordResponseModel(
              message: (passwordError != null && passwordError.length > 0)
                  ? passwordError[passwordError.length - 1]
                  : emailError[emailError.length - 1],
            );
          } else {
            forgotPasswordResponseModel = ForgotPasswordResponseModel(
                message: userForgotPasswordAuthValidationResponse['data']
                    ['message']);
          }
      }
    } else {
      int getStatusCode = userForgotPasswordAuthValidationResponse.statusCode;

      switch (getStatusCode) {
        case 200:
          forgotPasswordResponseModel = ForgotPasswordResponseModel.fromJson(
              userForgotPasswordAuthValidationResponse.data);
          break;
        default:
          forgotPasswordResponseModel = ForgotPasswordResponseModel(
              message:
                  userForgotPasswordAuthValidationResponse.data['message']);
      }
    }
    return forgotPasswordResponseModel;
  }

  Future<SendEmailForForgotPasswordResponseModel?>
      responseOfSendTokenToEmailForgotPasswordAuthValidationStatusCode(
          {required Map<String, dynamic>
              forgotPasswordTokenRequestJson}) async {
    var sendUserTokenToEmailForForgotPasswordAuthValidationResponse =
        await sendTokenToEmailForForgotPaswordAuthenticationRequest(
      forgotPasswordTokenRequestJson: forgotPasswordTokenRequestJson,
    );
    debugPrint(
        'this is the state ${sendUserTokenToEmailForForgotPasswordAuthValidationResponse.toString()}');
    SendEmailForForgotPasswordResponseModel?
        sendEmailForForgotPasswordResponseModel;
    if (sendUserTokenToEmailForForgotPasswordAuthValidationResponse is Map) {
      var statusCode =
          sendUserTokenToEmailForForgotPasswordAuthValidationResponse[
              'statusCode'];
      switch (statusCode) {
        case 500:
          sendEmailForForgotPasswordResponseModel =
              SendEmailForForgotPasswordResponseModel(
            message: NetworkRequestErrorMsgStatusCodeConstantValueClass
                .internalError,
          );
          break;
        case 400:
          sendEmailForForgotPasswordResponseModel =
              SendEmailForForgotPasswordResponseModel(
            message:
                NetworkRequestErrorMsgStatusCodeConstantValueClass.badRequest,
          );
          break;
        default:
          sendEmailForForgotPasswordResponseModel =
              SendEmailForForgotPasswordResponseModel(
                  message:
                      sendUserTokenToEmailForForgotPasswordAuthValidationResponse[
                          'data']['message']);
      }
    } else {
      int getStatusCode =
          sendUserTokenToEmailForForgotPasswordAuthValidationResponse
              .statusCode;

      switch (getStatusCode) {
        case 200:
          sendEmailForForgotPasswordResponseModel =
              SendEmailForForgotPasswordResponseModel.fromJson(
                  sendUserTokenToEmailForForgotPasswordAuthValidationResponse
                      .data);
          break;
        default:
          sendEmailForForgotPasswordResponseModel =
              SendEmailForForgotPasswordResponseModel(
                  message:
                      sendUserTokenToEmailForForgotPasswordAuthValidationResponse
                          .data['message']);
      }
    }
    return sendEmailForForgotPasswordResponseModel;
  }

  Future<UserCategoryResponseModel?>
      responseFromGettingUserCategoriesForAuthStatusCode() async {
    var userCategoriesForAuthResponse =
        await getUserCategoriesForAuthenticationRequest();
    debugPrint('category ${userCategoriesForAuthResponse.toString()}');
    UserCategoryResponseModel? userCategoryResponseModel;
    if (userCategoriesForAuthResponse is Map) {
      var statusCode = userCategoriesForAuthResponse['statusCode'];
      switch (statusCode) {
        case 500:
          userCategoryResponseModel = UserCategoryResponseModel(
            message: NetworkRequestErrorMsgStatusCodeConstantValueClass
                .internalError,
          );
          break;
        case 404:
          userCategoryResponseModel = UserCategoryResponseModel(
            message:
                NetworkRequestErrorMsgStatusCodeConstantValueClass.notFound,
          );
          break;
        case 400:
          userCategoryResponseModel = UserCategoryResponseModel(
            message:
                NetworkRequestErrorMsgStatusCodeConstantValueClass.badRequest,
          );
          break;
        default:
          userCategoryResponseModel = UserCategoryResponseModel(
              message: userCategoriesForAuthResponse['data']['message']);
      }
    } else {
      int getStatusCode = userCategoriesForAuthResponse.statusCode;

      switch (getStatusCode) {
        case 200:
          userCategoryResponseModel = UserCategoryResponseModel.fromJson(
              userCategoriesForAuthResponse.data);
          debugPrint('this is the magic ${userCategoryResponseModel.data}');
          break;
        default:
          userCategoryResponseModel = UserCategoryResponseModel(
              message: userCategoriesForAuthResponse.data['message']);
      }
    }
    return userCategoryResponseModel;
  }

  Future<UserDataResponseModel?>
      responseFromGettingUserDataAfterSuccessfulAuthStatusCode() async {
    var userDataAfterSuccessfulAuthResponse =
        await getUserDataAfterAuthenticationRequest();
    debugPrint(
        'this is the userdata ${userDataAfterSuccessfulAuthResponse.toString()}');
    UserDataResponseModel? userDataResponseModel;
    if (userDataAfterSuccessfulAuthResponse is Map) {
      var statusCode = userDataAfterSuccessfulAuthResponse['statusCode'];
      switch (statusCode) {
        case 500:
          userDataResponseModel = UserDataResponseModel(
            message: NetworkRequestErrorMsgStatusCodeConstantValueClass
                .internalError,
          );
          break;
        case 404:
          userDataResponseModel = UserDataResponseModel(
            message:
                NetworkRequestErrorMsgStatusCodeConstantValueClass.notFound,
          );
          break;
        case 400:
          userDataResponseModel = UserDataResponseModel(
            message:
                NetworkRequestErrorMsgStatusCodeConstantValueClass.badRequest,
          );
          break;
        default:
          userDataResponseModel = UserDataResponseModel(
              message: userDataAfterSuccessfulAuthResponse['data']['message']);
      }
    } else {
      int getStatusCode = userDataAfterSuccessfulAuthResponse.statusCode;

      switch (getStatusCode) {
        case 200:
          userDataResponseModel = UserDataResponseModel.fromJson(
              userDataAfterSuccessfulAuthResponse.data);
          break;
        default:
          userDataResponseModel = UserDataResponseModel(
              message: userDataAfterSuccessfulAuthResponse.data['message']);
      }
    }
    return userDataResponseModel;
  }

  Future<bool?> checkInternetConnectivity() async {
    bool? isThereConnection;
    try {
      await connectivity.checkConnectivity().then((value) {
        switch (value) {
          case ConnectivityResult.wifi:
          case ConnectivityResult.mobile:
            isThereConnection = true;
            break;
          case ConnectivityResult.none:
            isThereConnection = false;
            break;
          default:
            isThereConnection = false;
        }
      });
      debugPrint(isThereConnection.toString());
    } catch (e) {
      debugPrint(e.toString());
    }

    return isThereConnection;
  }

  Future<bool?> responseFromLogOutRequestStatusCode() async {
    var response = await logoutRequest();
    debugPrint('this is for logout ${response.toString()}');

    bool? isSuccessful;

    if (response is int) {
      switch (response) {
        case 500:
        case 404:
        case 400:
          isSuccessful = false;
          break;
        default:
      }
    } else {
      int getStatusCode = response.statusCode;

      switch (getStatusCode) {
        case 200:
          isSuccessful = true;
          break;
        default:
          isSuccessful = false;
      }
    }

    return isSuccessful;
  }
}
