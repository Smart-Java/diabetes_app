import 'package:diabetes_care/localStorage/sharedPreferences/app_shared_preferences.dart';
import 'package:diabetes_care/pages/authenticationPage/bloc/event/authentication_page_event.dart';
import 'package:diabetes_care/pages/authenticationPage/bloc/state/authentication_page_state.dart';
import 'package:diabetes_care/pages/authenticationPage/model/requestModel/accountEmailVerificationRequestModel/account_email_verification_request_model.dart';
import 'package:diabetes_care/pages/authenticationPage/model/requestModel/forgotPasswordRequestModel/forgot_password_request_model.dart';
import 'package:diabetes_care/pages/authenticationPage/model/requestModel/loginRequestModel/login_request_model.dart';
import 'package:diabetes_care/pages/authenticationPage/model/requestModel/passwordEmailVerificationRequestModel/password_email_verification_request_model.dart';
import 'package:diabetes_care/pages/authenticationPage/model/requestModel/registerRequestModel/register_request_model.dart';
import 'package:diabetes_care/pages/authenticationPage/repo/repoInterface/authentication_page_repo_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthenticationPageBloc
    extends Bloc<AuthenticationPageEvent, AuthenticationPageState> {
  final AuthenticationPageRepoInterface authenticationPageRepo;
  final AppSharedPreferences appSharedPreferences;

  AuthenticationPageBloc(
    this.authenticationPageRepo,
    this.appSharedPreferences,
  ) : super(const AuthenticationPageState()) {
    on<ChangeAuthenticationStateEvent>((event, emit) {
      debugPrint('login : ${event.changeToLoginState.toString()}');
      if (event.changeToLoginState == true) {
        emit(
          state.copyWith(
            isItLoginState: true,
          ),
        );
      } else {
        emit(
          state.copyWith(
            isItLoginState: false,
          ),
        );
      }
    });
    on<LoginAuthenticationEvent>((event, emit) async {
      if (event.emailAddress.isNotEmpty && event.password.isNotEmpty) {
        emit(
          state.copyWith(
            isLoading: true,
            isItLoginState: event.loginState,
          ),
        );
        String emailAddress = event.emailAddress;
        String password = event.password;

        String deviceName = '';

        LoginRequestModel loginRequestModel = LoginRequestModel(
          emailAddress: emailAddress,
          password: password,
          deviceName: deviceName,
        );

        var requestResponse =
            await authenticationPageRepo.loginAuthenticationRepoRequest(
          loginRequestJson: loginRequestModel.toJson(),
        );

        bool isAccountVerified = false;

        if (requestResponse!.status == true) {
          isAccountVerified =
              requestResponse.data['user']['email_verified_at'] != null
                  ? true
                  : false;
          if (isAccountVerified == true) {
            await appSharedPreferences.cacheDeviceAuthState();
          }
        }

        var responseMessage = requestResponse.message;


        emit(
          state.copyWith(
            isLoading: false,
            isItLoginState: event.loginState,
            authenticationMessage: requestResponse.status == true
                ? isAccountVerified == true
                    ? 'Login successfully done'
                    : 'Account not verified'
                : responseMessage.replaceFirst(
                    responseMessage[0], responseMessage[0].toUpperCase()),
            isAccountVerified: isAccountVerified,
            loginResponseModel: requestResponse,
            isAuthenticationRequestSuccessful: requestResponse.status,
            // isADriver: isADriver,
            // driverStatus: driverStatus,
          ),
        );
      } else {
        debugPrint('hello all is required');
        emit(
          state.copyWith(
            isLoading: false,
            authenticationMessage: 'All fields are required',
            isItLoginState: event.loginState,
          ),
        );
      }
    });
    on<ValidateEmailAddressForRegistrationAuthentication>((event, emit) async {
      if (event.emailAddress.isNotEmpty) {
        var email = event.emailAddress;
        bool isEmailValid = RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(email);
        debugPrint(isEmailValid.toString());

        emit(
          state.copyWith(
            isEmailAddressFormatTrue: isEmailValid,
            isLoading: false,
            isItLoginState: event.loginState,
          ),
        );
      }
    });
    on<ValidatePasswordForRegistrationAuthentication>((event, emit) async {
      if (event.password.isNotEmpty) {
        var password = event.password;
        bool isPasswordAllowed = RegExp(
                r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$")
            .hasMatch(password);
        debugPrint(isPasswordAllowed.toString());

        emit(
          state.copyWith(
            isPasswordGivenPermitted: isPasswordAllowed,
            isLoading: false,
            isItLoginState: event.loginState,
          ),
        );
      }
    });
    on<RegisterAuthenticationEvent>((event, emit) async {
      if (event.emailAddress.isNotEmpty &&
          event.userName.isNotEmpty &&
          event.password.isNotEmpty &&
          event.retypePassword.isNotEmpty) {
        emit(
          state.copyWith(
            isLoading: true,
            isItLoginState: event.loginState,
          ),
        );
        var userName = event.userName;
        var emailAddress = event.emailAddress;
        var password = event.password;
        var retypePassword = event.retypePassword;

        var email = event.emailAddress;
        bool isEmailValid = RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(email);
        debugPrint(isEmailValid.toString());

        if (isEmailValid == true) {
          if (event.password == event.retypePassword) {
            RegisterRequestModel registerRequestModel = RegisterRequestModel(
              emailAddress: emailAddress.trim(),
              firstName: userName.trim(),
              lastName: '',
              password: password,
              retypePassword: retypePassword,
            );

            var requestResponse =
                await authenticationPageRepo.registerAuthenticationRepoRequest(
              registerRequestJson: registerRequestModel.toJson(),
            );
            if (requestResponse!.status == true) {
              await appSharedPreferences.cacheDeviceAuthState();
            }
            var responseMessage = requestResponse.message;
            emit(
              state.copyWith(
                isLoading: false,
                isEmailAddressFormatTrue: isEmailValid,
                isItLoginState: event.loginState,
                authenticationMessage: requestResponse.status == true
                    ? 'Registration successfully done, an email has be sent across your email address, $emailAddress.'
                    : responseMessage.replaceFirst(
                        responseMessage[0], responseMessage[0].toUpperCase()),
                registerResponseModel: requestResponse,
                redirectToLoginComponent: requestResponse.status,
                isAuthenticationRequestSuccessful: requestResponse.status,
              ),
            );
          } else {
            emit(
              state.copyWith(
                isLoading: false,
                isPasswordMismatched: true,
                isItLoginState: event.loginState,
              ),
            );
          }
        } else {
          emit(
            state.copyWith(
              isEmailAddressFormatTrue: isEmailValid,
              isLoading: false,
              isItLoginState: event.loginState,
            ),
          );
        }
      } else {
        emit(
          state.copyWith(
            isLoading: false,
            authenticationMessage: 'All fields are required',
            isItLoginState: event.loginState,
          ),
        );
      }
    });
    on<PasswordAndRetypePasswordConfirmationAuthenticationEvent>(
        (event, emit) async {
      if (event.password!.isNotEmpty && event.retypePassword!.isNotEmpty) {
        if (event.password != event.retypePassword) {
          emit(
            state.copyWith(
              isLoading: false,
              isPasswordMismatched: true,
            ),
          );
        } else {
          emit(
            state.copyWith(
              isLoading: false,
              isPasswordMismatched: false,
            ),
          );
        }
      }
    });
    on<ForgotPasswordAuthenticationEvent>((event, emit) async {
      if (event.email.isNotEmpty &&
          event.password.isNotEmpty &&
          event.retypePassword.isNotEmpty &&
          event.token.isNotEmpty) {
        if (event.password != event.retypePassword) {
          emit(
            state.copyWith(
                isLoading: false,
                isPasswordMismatched: true,
                authenticationMessage: 'Password mismatch'),
          );
        } else {
          emit(state.copyWith(
            isLoading: true,
          ));
          var emailAddress = event.email;
          var password = event.password;
          var retypePassword = event.retypePassword;
          var token = event.token;

          ForgotPasswordRequestModel forgotPasswordRequestModel =
              ForgotPasswordRequestModel(
            emailAddress: emailAddress,
            confirmPassword: retypePassword,
            password: password,
            token: token,
          );

          var passwordChangeRequest = await authenticationPageRepo
              .forgotPasswordAuthenticationRepoRequest(
            forgotPasswordRequestJson: forgotPasswordRequestModel.toJson(),
          );
          var responseMessage = passwordChangeRequest.message;
          emit(
            state.copyWith(
              isLoading: false,
              isPasswordMismatched: false,
              forgotPasswordResponseModel: passwordChangeRequest,
              isAuthenticationRequestSuccessful:
                  passwordChangeRequest!.status ?? false,
              redirectToLoginComponent: passwordChangeRequest.status ?? false,
              authenticationMessage: passwordChangeRequest.status == true
                  ? 'Password successfully changed'
                  : responseMessage.replaceFirst(
                      responseMessage[0], responseMessage[0].toUpperCase()),
            ),
          );
        }
      } else {
        emit(
          state.copyWith(
            isLoading: false,
            authenticationMessage: 'All fields are required',
          ),
        );
      }
    });
    on<RedirectToLoginComponentAfterRegisterAuthenticationEvent>(
        (event, emit) async {
      emit(
        state.copyWith(
          isLoading: false,
          isItLoginState: true,
        ),
      );
    });
    on<RedirectToLoginComponentAfterForgotPasswordAuthenticationEvent>(
        (event, emit) async {
      emit(
        state.copyWith(
          isLoading: false,
          isItLoginState: true,
        ),
      );
    });
    on<SendTokenToUserEmailForForgotPasswordAuthenticationEvent>(
        (event, emit) async {
      if (event.emailAddress.isNotEmpty) {
        emit(state.copyWith(
          isLoading: true,
        ));
        var emailAddress = event.emailAddress;

        PasswordEmailVerificationRequestModel
            passwordEmailVerificationRequestModel =
            PasswordEmailVerificationRequestModel(emailAddress: emailAddress);

        var sendTokenToEmailForpasswordChangeRequest =
            await authenticationPageRepo
                .sendTokenToEmailForForgotPasswordAuthenticationRepoRequest(
          forgotPasswordTokenRequestJson:
              passwordEmailVerificationRequestModel.toJson(),
        );
        var responseMessage = sendTokenToEmailForpasswordChangeRequest!.message;
        emit(
          state.copyWith(
            isLoading: false,
            isPasswordMismatched: false,
            sendEmailForForgotPasswordResponseModel:
                sendTokenToEmailForpasswordChangeRequest,
            authenticationMessage: responseMessage.replaceFirst(
                responseMessage[0], responseMessage[0].toUpperCase()),
            isAuthenticationRequestSuccessful:
                sendTokenToEmailForpasswordChangeRequest.status,
          ),
        );
      } else {
        emit(
          state.copyWith(
              isLoading: false,
              authenticationMessage: 'All fields are required'),
        );
      }
    });
    on<ResendVerificationEmailToUserAuthenticationEvent>((event, emit) async {
      if (event.emailAddress.isNotEmpty) {
        emit(state.copyWith(
          isResendVerificationEmailInProgress: true,
        ));
        var emailAddress = event.emailAddress;

        AccountEmailVerificationRequestModel
            accountEmailVerificationRequestModel =
            AccountEmailVerificationRequestModel(emailAddress: emailAddress);

        var sendVerificationEmailRequestResponse = await authenticationPageRepo
            .resendVerificationEmailAuthenticationRepoRequest(
          verificationEmailRequestJson:
              accountEmailVerificationRequestModel.toJson(),
        );

        var responseMessage = sendVerificationEmailRequestResponse!.message;

        emit(
          state.copyWith(
            isResendVerificationEmailInProgress: false,
            hasVerificationEmailBeSent:
                sendVerificationEmailRequestResponse.status == true
                    ? true
                    : false,
            resendVerificationEmailResponseModel:
                sendVerificationEmailRequestResponse,
            authenticationMessage: responseMessage.replaceFirst(
                responseMessage[0], responseMessage[0].toUpperCase()),
            isAuthenticationRequestSuccessful:
                sendVerificationEmailRequestResponse.status,
          ),
        );
      }
    });
  }
}
