import 'package:diabetes_care/config/appShimmerEffect/app_shimmer_effect.dart';
import 'package:diabetes_care/pages/patientPage/dietPage/widget/custom_diet_item_widget.dart';
import 'package:diabetes_care/util/listNotReadyWidget/list_not_ready_widget.dart';
import 'package:flutter/material.dart';

class DietListWidet extends StatefulWidget {
  const DietListWidet({Key? key}) : super(key: key);

  @override
  State<DietListWidet> createState() => _DietListWidetState();
}

class _DietListWidetState extends State<DietListWidet> {
  bool loadShimmer = false;
  bool dietListReady = false;
  String emptyDietList = 'No reminder yet!';
  List dietList = [
    {'title': 'Hello', 'date': '12-01-2008'}
  ];
  @override
  void initState() {
    super.initState();
    if (dietList.isNotEmpty) {
      setState(() {
        dietListReady = true;
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
        : (dietList.isNotEmpty && dietListReady == true)
            ? ListView.builder(
                itemCount: dietList.length,
                itemBuilder: (context, index) {
                  return CustomDietItemWidget(
                    date: dietList[index]['date'],
                    title: dietList[index]['title'],
                  );
                },
              )
            : ListNotReadyWidget(
                message: emptyDietList,
              );
  }
}
