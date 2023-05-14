import 'package:diabetes_care/config/appShimmerEffect/app_shimmer_effect.dart';
import 'package:diabetes_care/pages/patientPage/glucose_reading_page.dart/widget/custom_glucose_reading_item_widget.dart';
import 'package:diabetes_care/util/listNotReadyWidget/list_not_ready_widget.dart';
import 'package:flutter/material.dart';

class GlucoseReadingListWidet extends StatefulWidget {
  const GlucoseReadingListWidet({Key? key}) : super(key: key);

  @override
  State<GlucoseReadingListWidet> createState() =>
      _GlucoseReadingListWidetState();
}

class _GlucoseReadingListWidetState extends State<GlucoseReadingListWidet> {
  bool loadShimmer = false;
  bool glucoseReadingListReady = false;
  String emptyGlucoseReadingList = 'No Glucose List yet!';
  List glucoseReadingList = [
    {
      'date': '(+33)6 55 58 55 63',
      'description': 'Before Meal',
      'imagePath': '',
      'glucoseLevel': '100',
      'time': '8:38 AM',
      'unit': 'Primary Care Physician',
      'rating': 'Normal',
    },
    {
      'date': '(+33)6 55 58 55 63',
      'description': 'Before Meal',
      'imagePath': '',
      'glucoseLevel': '100',
      'time': '8:38 AM',
      'unit': 'Primary Care Physician',
      'rating': 'Normal',
    },
    {
      'date': '(+33)6 55 58 55 63',
      'description': 'Before Meal',
      'imagePath': '',
      'glucoseLevel': '100',
      'time': '8:38 AM',
      'unit': 'Primary Care Physician',
      'rating': 'Normal',
    },
  ];
  @override
  void initState() {
    super.initState();
    if (glucoseReadingList.isNotEmpty) {
      setState(() {
        glucoseReadingListReady = true;
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
        : (glucoseReadingList.isNotEmpty && glucoseReadingListReady == true)
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: ListView.builder(
                  itemCount: glucoseReadingList.length,
                  itemBuilder: (context, index) {
                    return CustomGlucoseReadingItemWidget(
                      date: glucoseReadingList[index]['date'],
                      description: glucoseReadingList[index]['description'],
                      glucoseLevel: glucoseReadingList[index]['glucoseLevel'],
                      imagePath: glucoseReadingList[index]['imagePath'],
                      time: glucoseReadingList[index]['time'],
                      unit: glucoseReadingList[index]['unit'],
                      rating: glucoseReadingList[index]['rating'],
                    );
                  },
                ),
              )
            : ListNotReadyWidget(
                message: emptyGlucoseReadingList,
              );
  }
}
