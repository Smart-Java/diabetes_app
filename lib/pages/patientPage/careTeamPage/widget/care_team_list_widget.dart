import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:diabetes_care/config/appShimmerEffect/app_shimmer_effect.dart';
import 'package:diabetes_care/pages/patientPage/careTeamPage/bloc/care_team_page_bloc.dart';
import 'package:diabetes_care/pages/patientPage/careTeamPage/bloc/event/care_team_page_event.dart';
import 'package:diabetes_care/pages/patientPage/careTeamPage/bloc/state/care_team_page_state.dart';
import 'package:diabetes_care/pages/patientPage/careTeamPage/widget/custom_care_list_item_widget.dart';
import 'package:diabetes_care/util/listNotReadyWidget/list_not_ready_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CareTeamListWidet extends StatefulWidget {
  const CareTeamListWidet({Key? key}) : super(key: key);

  @override
  State<CareTeamListWidet> createState() => _CareTeamListWidetState();
}

class _CareTeamListWidetState extends State<CareTeamListWidet> {
  bool loadShimmer = true;
  bool careTeamListReady = false;
  String emptyCareTeamList = 'No care team yet!';
  bool isGivePermissionInProgress = false;
  int selectedIndex = 0;
  List careTeamList = [
    {
      'phoneNumber': '(+33)6 55 58 55 63',
      'email': 'alma.lawson@example.com',
      'imagePath': '',
      'fullname': 'Dr jenny wilson',
      'category': 'Primary Care Physician'
    },
    {
      'phoneNumber': '(+33)6 55 58 55 63',
      'email': 'alma.lawson@example.com',
      'imagePath': '',
      'fullname': 'Dr jenny wilson',
      'category': 'Primary Care Physician'
    },
    {
      'phoneNumber': '(+33)6 55 58 55 63',
      'email': 'alma.lawson@example.com',
      'imagePath': '',
      'fullname': 'Dr jenny wilson',
      'category': 'Primary Care Physician'
    },
    {
      'phoneNumber': '(+33)6 55 58 55 63',
      'email': 'alma.lawson@example.com',
      'imagePath': '',
      'fullname': 'Dr jenny wilson',
      'category': 'Primary Care Physician'
    },
    {
      'phoneNumber': '(+33)6 55 58 55 63',
      'email': 'alma.lawson@example.com',
      'imagePath': '',
      'fullname': 'Dr jenny wilson',
      'category': 'Primary Care Physician'
    },
  ];

  Size deviceSize = const Size(0, 0);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    setState(() {
      deviceSize = size;
    });
    return BlocConsumer<CareTeamPageBloc, CareTeamPageState>(
        builder: (context, state) {
      return loadShimmer == true
          ? ListView.builder(
              itemCount: 10,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 5.0),
                  child: const AppShimmerEffect.rectangular(
                    height: 70,
                    width: double.infinity,
                  ),
                );
              })
          : (careTeamList.isNotEmpty && careTeamListReady == true)
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Stack(
                    children: [
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: careTeamList.length,
                        itemBuilder: (context, index) {
                          return CustomCareListItemWidget(
                            contact: careTeamList[index]['phoneNumber'],
                            emailAddress: careTeamList[index]['email'],
                            imagePath: careTeamList[index]['imagePath'] ?? '',
                            name: careTeamList[index]['fullname'],
                            position: careTeamList[index]['category'],
                            permissionText: isGivePermissionInProgress == true
                                ? selectedIndex == index
                                    ? 'Processing...'
                                    : 'Give Permission'
                                : 'Give Permission',
                            givePermision: isGivePermissionInProgress == false
                                ? () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                    BlocProvider.of<CareTeamPageBloc>(context)
                                        .add(
                                      GiveDoctorPermissionCareTeamPageEvent(
                                        doctorEmail: careTeamList[index]
                                            ['email'],
                                      ),
                                    );
                                  }
                                : () {
                                    displayMessage(context,
                                        'Please do wait, request in progress...');
                                  },
                          );
                        },
                      ),
                    ],
                    // child: ,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListNotReadyWidget(
                    message: emptyCareTeamList,
                  ),
                );
    }, listener: (context, state) {
      if (state.careTeamDataList != null &&
          state.careTeamDataList!.isNotEmpty) {
        setState(() {
          careTeamList = state.careTeamDataList!;
        });
      } else {
        setState(() {
          careTeamList = [];
        });
      }

      if (state.isLoading == true) {
        setState(() {
          loadShimmer = state.isLoading!;
        });
      } else {
        if (state.isLoading == false) {
          setState(() {
            loadShimmer = state.isLoading!;
          });
        }
      }

      if (state.isListReady == true) {
        setState(() {
          careTeamListReady = state.isListReady!;
        });
      }

      if (state.isPermissionRequestLoading == true) {
        setState(() {
          isGivePermissionInProgress = state.isPermissionRequestLoading!;
        });
      } else {
        if (state.isPermissionRequestLoading == false) {
          setState(() {
            isGivePermissionInProgress = state.isPermissionRequestLoading!;
          });
          displayMessage(context, state.requestMessage!);
        }
      }
    });
  }

  void displayMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(message),
        ),
        duration: const Duration(
          seconds: 2,
        ),
        backgroundColor: AppColors.snackBarBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.only(
          bottom: deviceSize.height - 100,
          right: 10.0,
          left: 10.0,
        ),
      ),
    );
  }
}
