import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:diabetes_care/config/appRouterHandler/app_router.dart';
import 'package:diabetes_care/pages/splashPage/bloc/event/splash_page_event.dart';
import 'package:diabetes_care/pages/splashPage/bloc/splash_page_bloc.dart';
import 'package:diabetes_care/pages/splashPage/bloc/state/splash_page_state.dart';
import 'package:diabetes_care/pages/splashPage/presentation/widget/authentication_info_message_dialog_widget_view.dart';

class SplashViewWidget extends StatefulWidget {
  const SplashViewWidget({Key? key}) : super(key: key);

  @override
  State<SplashViewWidget> createState() => _SplashViewWidgetState();
}

class _SplashViewWidgetState extends State<SplashViewWidget> {
  bool isLoading = false;

  List loadingIndicatorList = ['', '', '', '', ''];

  int currentLoadingIndicator = 0;

  bool stopLoading = false;

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   showLoadingIndicatorProgress();
  // }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<SplashPageBloc>(context)
        .add(const LoadOnBoardingPageEvent());
    showLoadingIndicatorProgress();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashPageBloc, SplashPageState>(
      listener: (context, state) {
        if (state.isLoading == false &&
            state.isAuthenticationSuccessful == true) {
          setState(() {
            stopLoading = true;
          });
        } else {
          if (state.message != null &&
              state.isAuthenticationSuccessful != null &&
              state.automateUserLogin != null) {
            if (state.isAuthenticationSuccessful == false &&
                state.automateUserLogin == false) {
              var message = state.message as String;
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return AuthenticationInfoMessageDialogWidgetView(
                    message: message,
                    title: 'Information',
                    tryAgain: false,
                    doneFunctionality: () {
                      Navigator.pop(context);
                    },
                  );
                },
              );
            } else {
              setState(() {
                stopLoading = true;
              });
              context.router.replaceAll([AuthenticationRoute()]);
            }
          }
        }

        if (state.hasDeviceBeenAuthenticated == false) {
          setState(() {
            stopLoading = true;
          });
          context.router.replaceAll(const [AuthenticationOptionsRoute()]);
        }

        if (state.isLoading == true && state.automateUserLogin == true) {
          setState(() {
            isLoading = state.isLoading!;
          });
        }

        if (state.automateUserLogin == true) {
          BlocProvider.of<SplashPageBloc>(context)
              .add(const AutomateUserLoginPageEvent());
        } else if (state.automateUserLogin == false) {
          BlocProvider.of<SplashPageBloc>(context)
              .add(const LoadOnBoardingPageEvent());
        }

        if (state.isLoading == false &&
            state.loadOnBoardingPage == true &&
            state.loadAuthenticationPage == false) {
          setState(() {
            stopLoading = true;
          });
          // context.router.replaceAll([const OnBoardingRoute()]);
        }
        debugPrint('from onboarding view ${state.loadAuthenticationPage}');
        if (state.isLoading == false && state.loadAuthenticationPage == true) {
          setState(() {
            stopLoading = true;
          });
          context.router.replaceAll([AuthenticationRoute()]);
        }
      },
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Align(
              alignment: AlignmentDirectional.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo/bg_logo.png',
                    height: 200.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(loadingIndicatorList.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                          child: Container(
                            height: 10.0,
                            width: 10.0,
                            decoration: BoxDecoration(
                              color: index == currentLoadingIndicator
                                  ? AppColors.splashScreenLoadingIndicatorColor
                                  : AppColors
                                      .splashScreenOffLoadingIndicatorColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                  isLoading == true
                      ? const Padding(
                          padding: EdgeInsets.only(top: 30.0),
                          child: CircularProgressIndicator(
                            color: AppColors.secondaryColor,
                          ),
                        )
                      : Container()
                ],
              ),
            ),
          ),
          // const Expanded(
          //   child: Padding(
          //     padding: EdgeInsets.only(bottom: 20.0),
          //     child: Align(
          //       alignment: AlignmentDirectional.bottomCenter,
          //       child: Text(
          //         'Version 1.0',
          //         style: TextStyle(
          //           color: AppColors.versionNameColor,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Future<void> showLoadingIndicatorProgress() async {
    var indicatorLength = loadingIndicatorList.length;
    while (!stopLoading) {
      await Future.delayed(
        const Duration(
          seconds: 0,
        ),
      ).then((value) async {
        setState(() {
          if (currentLoadingIndicator == indicatorLength) {
            currentLoadingIndicator = 0;
          } else {
            currentLoadingIndicator += 1;
          }
        });
        await Future.delayed(const Duration(seconds: 2));
        debugPrint('currentLoadingIndicator $currentLoadingIndicator');
      });
    }
    debugPrint('stopLoading $stopLoading');
  }
}
