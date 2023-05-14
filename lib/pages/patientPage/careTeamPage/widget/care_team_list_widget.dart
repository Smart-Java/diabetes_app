import 'package:diabetes_care/config/appShimmerEffect/app_shimmer_effect.dart';
import 'package:diabetes_care/pages/patientPage/careTeamPage/widget/custom_care_list_item_widget.dart';
import 'package:diabetes_care/util/listNotReadyWidget/list_not_ready_widget.dart';
import 'package:flutter/material.dart';

class CareTeamListWidet extends StatefulWidget {
  const CareTeamListWidet({Key? key}) : super(key: key);

  @override
  State<CareTeamListWidet> createState() => _CareTeamListWidetState();
}

class _CareTeamListWidetState extends State<CareTeamListWidet> {
  bool loadShimmer = false;
  bool careTeamListReady = false;
  String emptyCareTeamList = 'No care team yet!';
  List careTeamList = [
    {
      'contact': '(+33)6 55 58 55 63',
      'emailAddress': 'alma.lawson@example.com',
      'imagePath': '',
      'name': 'Dr jenny wilson',
      'position': 'Primary Care Physician'
    },
    {
      'contact': '(+33)6 55 58 55 63',
      'emailAddress': 'alma.lawson@example.com',
      'imagePath': '',
      'name': 'Dr jenny wilson',
      'position': 'Primary Care Physician'
    },
    {
      'contact': '(+33)6 55 58 55 63',
      'emailAddress': 'alma.lawson@example.com',
      'imagePath': '',
      'name': 'Dr jenny wilson',
      'position': 'Primary Care Physician'
    },
    {
      'contact': '(+33)6 55 58 55 63',
      'emailAddress': 'alma.lawson@example.com',
      'imagePath': '',
      'name': 'Dr jenny wilson',
      'position': 'Primary Care Physician'
    },
    {
      'contact': '(+33)6 55 58 55 63',
      'emailAddress': 'alma.lawson@example.com',
      'imagePath': '',
      'name': 'Dr jenny wilson',
      'position': 'Primary Care Physician'
    },
  ];
  @override
  void initState() {
    super.initState();
    if (careTeamList.isNotEmpty) {
      setState(() {
        careTeamListReady = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return loadShimmer == true
        ? ListView.builder(
            itemCount: 10,
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
                      contact: careTeamList[index]['contact'],
                      emailAddress: careTeamList[index]['emailAddress'],
                      imagePath: careTeamList[index]['imagePath'],
                      name: careTeamList[index]['name'],
                      position: careTeamList[index]['position'],
                    );
                  },
                ),
              )
            : ListNotReadyWidget(
                message: emptyCareTeamList,
              );
  }
}
