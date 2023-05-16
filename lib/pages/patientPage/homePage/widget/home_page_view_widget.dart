import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:diabetes_care/pages/patientPage/homePage/bloc/event/home_page_event.dart';
import 'package:diabetes_care/pages/patientPage/homePage/bloc/home_page_bloc.dart';
import 'package:diabetes_care/pages/patientPage/homePage/bloc/state/home_page_state.dart';
import 'package:diabetes_care/pages/patientPage/homePage/widget/dashboard_details_view_widget.dart';
import 'package:diabetes_care/util/pageHeaderWidget/patient_page_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageViewWidget extends StatefulWidget {
  const HomePageViewWidget({Key? key}) : super(key: key);

  @override
  State<HomePageViewWidget> createState() => _HomePageViewWidgetState();
}

class _HomePageViewWidgetState extends State<HomePageViewWidget> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomePageBloc>(context)
        .add(const GetUserFullnameHomePageEvent());
    BlocProvider.of<HomePageBloc>(context)
        .add(const GetLastReadingHomePageEvent());
    BlocProvider.of<HomePageBloc>(context)
        .add(const GetLastTwoWeeksReadingHomePageEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () async {},
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional.topStart,
                child: PatientPageHeaderWidget(
                  childWidget: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 5.0,
                          right: 10.0,
                        ),
                        child: Container(
                          height: 40.0,
                          width: 41.0,
                          decoration: const BoxDecoration(
                            color: AppColors.whiteColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.person,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                      Text(
                        'Good Afternoon \n${state.userFullname}',
                        style: Theme.of(context).textTheme.headlineLarge,
                      )
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 150.0),
                child: DashboardDetailsViewWidget(),
              )
            ],
          ),
        );
      },
    );
  }
}
