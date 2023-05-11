import 'package:equatable/equatable.dart';
import 'package:diabetes_care/pages/authenticationPage/model/responseModel/loginResponseModel/login_response_model.dart';

class SplashPageState extends Equatable {
  const SplashPageState({
    this.isLoading,
    this.loadOnBoardingPage,
    this.loadAuthenticationPage,
    this.automateUserLogin,
    this.isAuthenticationSuccessful,
    this.loginResponseModel,
    this.message,
    this.hasDeviceBeenAuthenticated,
  });

  final bool? isLoading;
  final bool? loadOnBoardingPage;
  final bool? loadAuthenticationPage;
  final bool? automateUserLogin;
  final bool? isAuthenticationSuccessful;
  final bool? hasDeviceBeenAuthenticated;
  final LoginResponseModel? loginResponseModel;
  final String? message;

  @override
  List<Object?> get props => [
        isLoading,
        loadOnBoardingPage,
        loadAuthenticationPage,
        automateUserLogin,
        isAuthenticationSuccessful,
        loginResponseModel,
        message,
        hasDeviceBeenAuthenticated,
      ];

  SplashPageState copyWith({
    bool? isLoading,
    bool? loadOnBoardingPage,
    bool? loadAuthenticationPage,
    bool? automateUserLogin,
    bool? isAuthenticationSuccessful,
    bool? hasDeviceBeenAuthenticated,
    LoginResponseModel? loginResponseModel,
    String? message,
  }) {
    return SplashPageState(
      isLoading: isLoading,
      loadOnBoardingPage: loadOnBoardingPage,
      loadAuthenticationPage: loadAuthenticationPage,
      automateUserLogin: automateUserLogin,
      isAuthenticationSuccessful: isAuthenticationSuccessful,
      loginResponseModel: loginResponseModel,
      message: message,
      hasDeviceBeenAuthenticated: hasDeviceBeenAuthenticated,
    );
  }
}
