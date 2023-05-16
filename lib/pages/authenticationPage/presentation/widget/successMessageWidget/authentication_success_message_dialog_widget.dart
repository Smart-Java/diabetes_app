import 'package:auto_route/auto_route.dart';
import 'package:diabetes_care/pages/authenticationPage/bloc/event/authentication_page_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:diabetes_care/config/appRouterHandler/app_router.dart';
import 'package:diabetes_care/pages/authenticationPage/bloc/authentication_page_bloc.dart';
import 'package:diabetes_care/pages/authenticationPage/bloc/state/authentication_page_state.dart';

class AuthenticationSuccessMessageDialogWidget extends StatefulWidget {
  final String message;
  final String title;
  final bool? isItForRoutingToANewPage;
  final VoidCallback? routeFunctionality;
  const AuthenticationSuccessMessageDialogWidget({
    Key? key,
    required this.message,
    required this.title,
    required this.isItForRoutingToANewPage,
    this.routeFunctionality,
  }) : super(key: key);

  @override
  State<AuthenticationSuccessMessageDialogWidget> createState() =>
      _AuthenticationSuccessMessageDialogWidgetState();
}

class _AuthenticationSuccessMessageDialogWidgetState
    extends State<AuthenticationSuccessMessageDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationPageBloc, AuthenticationPageState>(
      listener: (context, state) {
        if (state.isItLoginState == true) {
          context.router.push(AuthenticationRoute());
        }
      },
      child: WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
            10.0,
          )),
          title: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Container(
              height: 100.0,
              decoration: BoxDecoration(
                color: AppColors.greenColor,
                shape: BoxShape.circle,
                // borderRadius: BorderRadius.circular(10.0,),
                border: Border.all(
                  color: AppColors.greenColor,
                  width: 2.0,
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.check,
                  color: AppColors.whiteColor,
                  size: 50.0,
                ),
              ),
            ),
          ),
          content: SizedBox(
            height: 150.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Text(
                    widget.message,
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: AppColors.blackColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: GestureDetector(
                    onTap: widget.isItForRoutingToANewPage == false
                        ? widget.routeFunctionality
                        : () {
                            Future.delayed(const Duration()).then((value) {
                              Navigator.pop(context);
                            }).then((value) {
                              BlocProvider.of<AuthenticationPageBloc>(context)
                                  .add(ChangeAuthenticationStateEvent(
                                      changeToLoginState: true));
                            });
                          },
                    child: alertMessageBtnFunctionality(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget alertMessageBtnFunctionality() {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border.all(
            color: AppColors.greenColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.0)),
      child: const Center(
        child: Text(
          'Okay',
          style: TextStyle(
            color: AppColors.blackColor,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
