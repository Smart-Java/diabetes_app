import 'package:diabetes_care/localStorage/sharedPreferences/app_shared_preferences.dart';
import 'package:diabetes_care/pages/authenticationPage/bloc/event/authentication_page_event.dart';
import 'package:diabetes_care/pages/authenticationPage/bloc/state/authentication_page_state.dart';
import 'package:diabetes_care/pages/authenticationPage/service/auth_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthenticationPageBloc
    extends Bloc<AuthenticationPageEvent, AuthenticationPageState> {
  final AppSharedPreferences appSharedPreferences;
  final AuthService authService;

  AuthenticationPageBloc(
    this.appSharedPreferences,
    this.authService,
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

        var requestResponse = await authService.loginUser(
            email: emailAddress, password: password);

        bool isItAPatient = false;
        String userCategory = '';

        if (requestResponse!.status == true) {
          var userData = requestResponse.data!;
          List userLists = userData['users'];
          for (var userListElement in userLists) {
            if (userListElement['email'] == emailAddress) {
              debugPrint(userData.toString());
              isItAPatient = userListElement['isItAPatient'];
              userCategory = userListElement['category'];
            }
          }
        }

        var responseMessage = requestResponse.message;

        emit(
          state.copyWith(
            isLoading: false,
            isItLoginState: event.loginState,
            authenticationMessage: responseMessage!.replaceFirst(
                responseMessage[0], responseMessage[0].toUpperCase()),
            loginResponseModel: requestResponse,
            isAuthenticationRequestSuccessful: requestResponse.status,
            isItAPatient: isItAPatient,
            userCategory: userCategory,
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
          event.fullName.isNotEmpty &&
          event.password.isNotEmpty &&
          event.retypePassword.isNotEmpty &&
          event.category.isNotEmpty) {
        emit(
          state.copyWith(
            isLoading: true,
            isItLoginState: event.loginState,
          ),
        );
        bool isItAPatient = false;

        var fullName = event.fullName;
        var password = event.password;
        var category = event.category;

        if (category.toLowerCase() == 'patient') {
          isItAPatient = true;
        } else {
          isItAPatient = false;
        }

        var email = event.emailAddress;
        bool isEmailValid = RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(email);
        debugPrint(isEmailValid.toString());

        if (isEmailValid == true) {
          if (event.password == event.retypePassword) {
            var requestResponse = await authService.registerUser(
              fullName: fullName,
              password: password,
              category: category,
              isItAPatient: isItAPatient,
              email: email,
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
                authenticationMessage: responseMessage!.replaceFirst(
                  responseMessage[0],
                  responseMessage[0].toUpperCase(),
                ),
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
  }
}
