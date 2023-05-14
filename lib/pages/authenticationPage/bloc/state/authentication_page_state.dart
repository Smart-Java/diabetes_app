import 'package:diabetes_care/pages/authenticationPage/model/login_response_model.dart/login_response_model.dart';
import 'package:diabetes_care/pages/authenticationPage/model/register_response_model.dart/register_response_model.dart';
import 'package:equatable/equatable.dart';

class AuthenticationPageState extends Equatable {
  const AuthenticationPageState({
    this.isLoading,
    this.isItLoginState,
    this.authenticationMessage,
    this.isAuthenticationRequestSuccessful,
    this.isFieldEmpty,
    this.isEmailAddressFormatTrue,
    this.loginResponseModel,
    this.isPasswordMismatched,
    this.redirectToLoginComponent,
    this.isPasswordGivenPermitted,
    this.isAccountVerified,
    this.hasVerificationEmailBeSent,
    this.isResendVerificationEmailInProgress,
    this.registerResponseModel,
    this.isItAPatient,
    this.userCategory,
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
  final bool? isPasswordGivenPermitted;
  final bool? isAccountVerified;
  final bool? isResendVerificationEmailInProgress;
  final bool? hasVerificationEmailBeSent;
  final bool? isItAPatient;
  final String? userCategory;

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
        isPasswordGivenPermitted,
        isAccountVerified,
        isResendVerificationEmailInProgress,
        hasVerificationEmailBeSent,
        isItAPatient,
        userCategory,
      ];

  AuthenticationPageState copyWith({
    bool? isLoading,
    bool? isItLoginState,
    bool? isFieldEmpty,
    bool? isAuthenticationRequestSuccessful,
    bool? isPasswordGivenPermitted,
    String? authenticationMessage,
    bool? isEmailAddressFormatTrue,
    LoginResponseModel? loginResponseModel,
    RegisterResponseModel? registerResponseModel,
    bool? isPasswordMismatched,
    bool? redirectToLoginComponent,
    bool? isItAPatient,
    String? userCategory,
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
      isPasswordMismatched: isPasswordMismatched,
      redirectToLoginComponent: redirectToLoginComponent,
      isPasswordGivenPermitted: isPasswordGivenPermitted,
      isAccountVerified: isAccountVerified,
      isResendVerificationEmailInProgress: isResendVerificationEmailInProgress,
      hasVerificationEmailBeSent: hasVerificationEmailBeSent,
      isItAPatient: isItAPatient,
      userCategory: userCategory,
    );
  }
}
