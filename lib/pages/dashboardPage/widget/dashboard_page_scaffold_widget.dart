import 'package:auto_route/auto_route.dart';
import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:diabetes_care/config/appRouterHandler/app_router.dart';
import 'package:diabetes_care/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

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
        routes: const [
          HomeRoute(),
          ReminderRoute(),
          RecordRoute(),
          DietRoute(),
          ProfileRoute(),
        ],
        builder: (context, child, animation) {
          final navigationRouter = AutoTabsRouter.of(context);

          return Scaffold(
            body: FadeTransition(
              opacity: animation,
              child: child,
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              elevation: 0.0,
              backgroundColor: AppColors.whiteColor,
              selectedItemColor: AppColors.secondaryColor,
              unselectedItemColor: AppColors.primaryColor,
              unselectedLabelStyle: const TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
              selectedLabelStyle: const TextStyle(
                color: AppColors.secondaryColor,
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
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 30.0,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.alarm,
                    size: 30.0,
                  ),
                  label: 'Reminder',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.note_alt_outlined,
                    size: 30.0,
                  ),
                  label: 'Records',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.food_bank_outlined,
                    size: 30.0,
                  ),
                  label: 'Diet',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_add_alt,
                    size: 30.0,
                  ),
                  label: 'Profile',
                ),
              ],
            ),
            floatingActionButton:
                showFAB == true ? fabChildWidget() : Container(),
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
