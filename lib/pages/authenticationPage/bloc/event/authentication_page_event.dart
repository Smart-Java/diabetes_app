import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
abstract class AuthenticationPageEvent extends Equatable {
  const AuthenticationPageEvent();
}

// ignore: must_be_immutable
class ChangeAuthenticationStateEvent extends AuthenticationPageEvent {
  bool? changeToLoginState;

  ChangeAuthenticationStateEvent({this.changeToLoginState}) : super();

  @override
  List<Object?> get props => [
        changeToLoginState,
      ];
}

// ignore: must_be_immutable
class LoginAuthenticationEvent extends AuthenticationPageEvent {
  String emailAddress;
  String password;
  bool? loginState;
  LoginAuthenticationEvent({
    required this.emailAddress,
    required this.password,
    this.loginState,
  }) : super();

  @override
  List<Object?> get props => [
        emailAddress,
        password,
      ];
}

// ignore: must_be_immutable
class ForgotPasswordAuthenticationEvent extends AuthenticationPageEvent {
  String email;
  String password;
  String retypePassword;
  String token;
  ForgotPasswordAuthenticationEvent({
    required this.email,
    required this.password,
    required this.retypePassword,
    required this.token,
  }) : super();

  @override
  List<Object?> get props => [
        email,
        password,
        retypePassword,
        token,
      ];
}

// ignore: must_be_immutable
class ValidateEmailAddressForRegistrationAuthentication
    extends AuthenticationPageEvent {
  String emailAddress;
  bool? loginState;
  ValidateEmailAddressForRegistrationAuthentication({
    required this.emailAddress,
    this.loginState,
  }) : super();

  @override
  List<Object?> get props => [emailAddress, loginState];
}

// ignore: must_be_immutable
class ValidatePasswordForRegistrationAuthentication
    extends AuthenticationPageEvent {
  String password;
  bool? loginState;
  ValidatePasswordForRegistrationAuthentication({
    required this.password,
    this.loginState,
  }) : super();

  @override
  List<Object?> get props => [password, loginState];
}

// ignore: must_be_immutable
class RegisterAuthenticationEvent extends AuthenticationPageEvent {
  String fullName;
  String emailAddress;
  String password;
  String retypePassword;
  String category;
  bool? loginState;

  RegisterAuthenticationEvent({
    required this.emailAddress,
    required this.fullName,
    required this.category,
    this.loginState,
    required this.password,
    required this.retypePassword,
  }) : super();

  @override
  List<Object?> get props => [
        fullName,
        category,
        emailAddress,
        loginState,
        password,
        retypePassword,
      ];
}

// ignore: must_be_immutable
class PasswordAndRetypePasswordConfirmationAuthenticationEvent
    extends AuthenticationPageEvent {
  String? password;
  String? retypePassword;

  PasswordAndRetypePasswordConfirmationAuthenticationEvent({
    this.password,
    this.retypePassword,
  }) : super();

  @override
  List<Object?> get props => [
        password,
        retypePassword,
      ];
}

// ignore: must_be_immutable
class RedirectToLoginComponentAfterRegisterAuthenticationEvent
    extends AuthenticationPageEvent {
  const RedirectToLoginComponentAfterRegisterAuthenticationEvent() : super();

  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class RedirectToLoginComponentAfterForgotPasswordAuthenticationEvent
    extends AuthenticationPageEvent {
  const RedirectToLoginComponentAfterForgotPasswordAuthenticationEvent()
      : super();

  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class SendTokenToUserEmailForForgotPasswordAuthenticationEvent
    extends AuthenticationPageEvent {
  String emailAddress;
  SendTokenToUserEmailForForgotPasswordAuthenticationEvent({
    required this.emailAddress,
  }) : super();
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class ResendVerificationEmailToUserAuthenticationEvent
    extends AuthenticationPageEvent {
  String emailAddress;
  ResendVerificationEmailToUserAuthenticationEvent({
    required this.emailAddress,
  }) : super();

  @override
  List<Object?> get props => [
        emailAddress,
      ];
}
