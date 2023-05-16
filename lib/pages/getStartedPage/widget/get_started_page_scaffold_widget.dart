import 'package:auto_route/auto_route.dart';
import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:diabetes_care/config/appRouterHandler/app_router.dart';
import 'package:flutter/material.dart';

class GetStartedPageScaffoldWidget extends StatelessWidget {
  const GetStartedPageScaffoldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: deviceSize.height,
        width: deviceSize.width,
        decoration: const BoxDecoration(color: AppColors.primaryColor),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 110.0, bottom: 200.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: AlignmentDirectional.center,
                        child: Image.asset(
                          'asset/images/logo/logo.png',
                          height: 91.0,
                          width: 164.0,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 20,
                        ),
                        child: Text(
                          'Welcome to MiDC, your trusted companion for managing diabetes with ease and convenience.',
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 17.0,
                            fontWeight: FontWeight.w600,
                            wordSpacing: 2.0,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.router
                        .replace(AuthenticationRoute(loginState: false));
                  },
                  child: Card(
                    elevation: 5.0,
                    color: AppColors.secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: SizedBox(
                      height: 56.0,
                      width: 241.53,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Get Started',
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 16.32,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 5.0),
                          //   child: Row(
                          //     children: const [
                          //       Icon(
                          //         Icons.keyboard_double_arrow_right_rounded,
                          //         color: AppColors.whiteColor,
                          //       ),
                          //       Padding(
                          //         padding: EdgeInsets.only(left: 0.0),
                          //         child: Icon(
                          //           Icons.keyboard_arrow_right,
                          //           color: AppColors.whiteColor,
                          //         ),
                          //       ),
                          //       Padding(
                          //         padding: EdgeInsets.only(left: 0.0),
                          //         child: Icon(
                          //           Icons.keyboard_arrow_right,
                          //           color: AppColors.whiteColor,
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
