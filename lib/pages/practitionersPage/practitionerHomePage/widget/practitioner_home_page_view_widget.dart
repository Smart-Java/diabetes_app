import 'dart:async';

import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:diabetes_care/pages/practitionersPage/practitionerHomePage/bloc/event/practitioner_home_page_event.dart';
import 'package:diabetes_care/pages/practitionersPage/practitionerHomePage/bloc/practitioner_home_page_bloc.dart';
import 'package:diabetes_care/pages/practitionersPage/practitionerHomePage/bloc/state/practitoner_home_page_state.dart';
import 'package:diabetes_care/pages/practitionersPage/practitionerHomePage/widget/practitioner_details_list_widget.dart';
import 'package:diabetes_care/util/pageHeaderWidget/practitioner_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PractitionerHomePageViewWidget extends StatefulWidget {
  final bool isItForDietitian;
  const PractitionerHomePageViewWidget({
    Key? key,
    required this.isItForDietitian,
  }) : super(key: key);

  @override
  State<PractitionerHomePageViewWidget> createState() => _PractitionerHomePageViewWidgetState();
}

class _PractitionerHomePageViewWidgetState extends State<PractitionerHomePageViewWidget> {

  late Timer updateTimer;
  
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PractitionerHomePageBloc>(context)
        .add(const GetUserFullnameHomePageEvent());
    BlocProvider.of<PractitionerHomePageBloc>(context)
        .add(GetPraPatientsHomePageEvent(isItForUpdate: false));
    updateReadingListings();
  }

  void updateReadingListings() {
    updateTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      BlocProvider.of<PractitionerHomePageBloc>(context)
          .add(GetPraPatientsHomePageEvent(isItForUpdate: true));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PractitionerHomePageBloc, PractitionerHomePageState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional.topStart,
                child: PractitionerHeaderWidget(
                  childWidget: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 5.0,
                          right: 5.0,
                        ),
                        child: Container(
                          height: 30.0,
                          width: 31.0,
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
                        'Good Afternoon \n${state.practitonerFullname}',
                        style: Theme.of(context).textTheme.headlineLarge,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 150.0),
                child: PractitionerDetailsListWidget(
                  isItForDietitian: widget.isItForDietitian,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
