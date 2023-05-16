import 'package:diabetes_care/config/appShimmerEffect/app_shimmer_effect.dart';
import 'package:diabetes_care/pages/patientPage/careTeamPage/bloc/care_team_page_bloc.dart';
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

  @override
  Widget build(BuildContext context) {
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
                  child: ListView.builder(
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
                      );
                    },
                  ),
                )
              : ListNotReadyWidget(
                  message: emptyCareTeamList,
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
    });
  }
}
