import 'package:equatable/equatable.dart';
import 'package:diabetes_care/pages/authenticationPage/model/responseModel/forgotPasswordModel/forgot_password_response_model.dart';
import 'package:diabetes_care/pages/authenticationPage/model/responseModel/loginResponseModel/login_response_model.dart';
import 'package:diabetes_care/pages/authenticationPage/model/responseModel/registerResponseModel/register_response_model.dart';
import 'package:diabetes_care/pages/authenticationPage/model/responseModel/resendVerificationEmailResponseModel/resend_verification_email_response_model.dart';
import 'package:diabetes_care/pages/authenticationPage/model/responseModel/sendEmailForForgotPasswordModel/send_email_for_forgot_password_response_model.dart';

class AuthenticationPageState extends Equatable {
  const AuthenticationPageState({
    this.isLoading,
    this.isItLoginState,
    this.authenticationMessage,
    this.isAuthenticationRequestSuccessful,
    this.isFieldEmpty,
    this.isEmailAddressFormatTrue,
    this.loginResponseModel,
    this.registerResponseModel,
    this.isPasswordMismatched,
    this.redirectToLoginComponent,
    this.forgotPasswordResponseModel,
    this.sendEmailForForgotPasswordResponseModel,
    this.isPasswordGivenPermitted,
    this.isAccountVerified,
    this.hasVerificationEmailBeSent,
    this.isResendVerificationEmailInProgress,
    this.resendVerificationEmailResponseModel,
  });

  final bool? isLoading;
  final bool? isPasswordMismatched;
  final bool? redirectToLoginComponent;
  final bool? isItLoginState;
  final bool? isFieldEmpty;
  final bool? isAuthenticationRequestSuccessful;
  final String? authenticationMessage;
  final bool? isEmailAddressFormatTrue;
  final LoginResponseModel? loginResponseModel;
  final RegisterResponseModel? registerResponseModel;
  final ForgotPasswordResponseModel? forgotPasswordResponseModel;
  final SendEmailForForgotPasswordResponseModel?
      sendEmailForForgotPasswordResponseModel;
  final ResendVerificationEmailResponseModel?
      resendVerificationEmailResponseModel;
  final bool? isPasswordGivenPermitted;
  final bool? isAccountVerified;
  final bool? isResendVerificationEmailInProgress;
  final bool? hasVerificationEmailBeSent;

  @override
  List<Object?> get props => [
        isLoading,
        isItLoginState,
        isFieldEmpty,
        isAuthenticationRequestSuccessful,
        authenticationMessage,
        isEmailAddressFormatTrue,
        loginResponseModel,
        registerResponseModel,
        isPasswordMismatched,
        redirectToLoginComponent,
        forgotPasswordResponseModel,
        sendEmailForForgotPasswordResponseModel,
        resendVerificationEmailResponseModel,
        isPasswordGivenPermitted,
        isAccountVerified,
        isResendVerificationEmailInProgress,
        hasVerificationEmailBeSent,
      ];

  AuthenticationPageState copyWith({
    bool? isLoading,
    bool? isItLoginState,
    bool? isFieldEmpty,
    bool? isAuthenticationRequestSuccessful,
    bool? isPasswordGivenPermitted,
    bool? isAccountVerified,
    bool? isResendVerificationEmailInProgress,
    bool? hasVerificationEmailBeSent,
    String? authenticationMessage,
    bool? isEmailAddressFormatTrue,
    LoginResponseModel? loginResponseModel,
    RegisterResponseModel? registerResponseModel,
    ForgotPasswordResponseModel? forgotPasswordResponseModel,
    SendEmailForForgotPasswordResponseModel?
        sendEmailForForgotPasswordResponseModel,
    ResendVerificationEmailResponseModel? resendVerificationEmailResponseModel,
    bool? isNewOTPSentAcross,
    bool? isPasswordMismatched,
    bool? redirectToLoginComponent,
  }) {
    return AuthenticationPageState(
      isLoading: isLoading,
      isItLoginState: isItLoginState,
      isFieldEmpty: isFieldEmpty,
      isAuthenticationRequestSuccessful: isAuthenticationRequestSuccessful,
      authenticationMessage: authenticationMessage,
      isEmailAddressFormatTrue: isEmailAddressFormatTrue,
      loginResponseModel: loginResponseModel,
      registerResponseModel: registerResponseModel,
      forgotPasswordResponseModel: forgotPasswordResponseModel,
      sendEmailForForgotPasswordResponseModel:
          sendEmailForForgotPasswordResponseModel,
      isPasswordMismatched: isPasswordMismatched,
      redirectToLoginComponent: redirectToLoginComponent,
      resendVerificationEmailResponseModel:
          resendVerificationEmailResponseModel,
      isPasswordGivenPermitted: isPasswordGivenPermitted,
      isAccountVerified: isAccountVerified,
      isResendVerificationEmailInProgress: isResendVerificationEmailInProgress,
      hasVerificationEmailBeSent: hasVerificationEmailBeSent,
    );
  }
}
