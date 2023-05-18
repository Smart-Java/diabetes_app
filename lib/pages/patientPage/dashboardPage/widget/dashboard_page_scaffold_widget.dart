import 'package:auto_route/auto_route.dart';
import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:diabetes_care/config/appRouterHandler/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardPageScaffoldWidget extends StatefulWidget {
  const DashboardPageScaffoldWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<DashboardPageScaffoldWidget> createState() =>
      _DashboardPageScaffoldWidgetState();
}

class _DashboardPageScaffoldWidgetState
    extends State<DashboardPageScaffoldWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int currentIndex = 0;
  bool showFAB = false;

  @override
  Widget build(BuildContext context) {
    return
        // BlocProvider(
        //   create: (context) => getIt<AuthBloc>(),
        //   child:
        Scaffold(
      key: _scaffoldKey,
      body: AutoTabsRouter(
        routes:  [
          const HomeRoute(),
          const ReminderRoute(),
          RecordRoute(isItFromPatientsView: true,),
          const DietRoute(),
          ProfileRoute(isItAPatient: true),
        ],
        builder: (context, child, animation) {
          final navigationRouter = AutoTabsRouter.of(context);

          return Scaffold(
            body: FadeTransition(
              opacity: animation,
              child: child,
            ),
            bottomNavigationBar: SizedBox(
              height: 70.0,
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                elevation: 0.0,
                iconSize: 21.0,
                backgroundColor: AppColors.primaryColor,
                selectedItemColor: AppColors.whiteColor,
                unselectedItemColor: AppColors.whiteColor,
                unselectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                selectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                currentIndex: navigationRouter.activeIndex,
                onTap: (index) {
                  setState(() {
                    if (index != 0) {
                      showFAB = true;
                    } else {
                      showFAB = false;
                    }
                    currentIndex = index;
                  });
                  navigationRouter.setActiveIndex(index);
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 5.0,
                      ),
                      child: SvgPicture.asset(
                          'asset/images/bottomNav/home_icon.svg'),
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 5.0,
                      ),
                      child: SvgPicture.asset(
                          'asset/images/bottomNav/reminder_icon.svg'),
                    ),
                    label: 'Reminder',
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 5.0,
                      ),
                      child: SvgPicture.asset(
                          'asset/images/bottomNav/record_icon.svg'),
                    ),
                    label: 'Records',
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 5.0,
                      ),
                      child: SvgPicture.asset(
                          'asset/images/bottomNav/diet_icon.svg'),
                    ),
                    label: 'Diet',
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 5.0,
                      ),
                      child: SvgPicture.asset(
                          'asset/images/bottomNav/profile_icon.svg'),
                    ),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
            // floatingActionButton:
            //     showFAB == true ? fabChildWidget() : Container(),
          );
        },
      ),
      // ),
    );
  }

  Widget fabChildWidget() {
    Widget child = Container();
    if (currentIndex == 1) {
      return customeFabChildItemWidget(
          iconData: Icons.add_circle_outline_rounded, title: 'Add Reminder');
    } else if (currentIndex == 2) {
      return customeFabChildItemWidget(
          iconData: Icons.add_circle_outline_rounded, title: 'Add Records');
    } else if (currentIndex == 3) {
      return customeFabChildItemWidget(
          iconData: Icons.add_circle_outline_rounded, title: 'Request diet');
    } else if (currentIndex == 4) {
      return customeFabChildItemWidget(
          iconData: Icons.add_circle_outline_rounded, title: 'Edit Profile');
    }
    return child;
  }

  Widget customeFabChildItemWidget({
    required IconData iconData,
    required String title,
  }) {
    return Container(
      height: 50.0,
      width: 150.0,
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.add_circle_outline,
              color: AppColors.whiteColor,
            ),
            Text(
              title,
              style: const TextStyle(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
