// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:diabetes_care/config/appShimmerEffect/app_shimmer_effect.dart';
import 'package:diabetes_care/pages/patientPage/glucoseReadingPage/widget/custom_glucose_reading_item_widget.dart';
import 'package:diabetes_care/util/listNotReadyWidget/list_not_ready_widget.dart';
import 'package:flutter/material.dart';

class GlucoseReadingListWidet extends StatefulWidget {
  final List dataReading;
  const GlucoseReadingListWidet({
    Key? key,
    required this.dataReading,
  }) : super(key: key);

  @override
  State<GlucoseReadingListWidet> createState() =>
      _GlucoseReadingListWidetState();
}

class _GlucoseReadingListWidetState extends State<GlucoseReadingListWidet> {
  bool loadShimmer = false;
  bool glucoseReadingListReady = false;
  String emptyGlucoseReadingList = 'No Glucose List yet!';
  List glucoseReadingList = [];
  List imagesToUse = [
    'asset/images/dietMeals/meal_1.png',
    'asset/images/dietMeals/meal_2.png',
    'asset/images/dietMeals/meal_3.png',
    'asset/images/dietMeals/meal_4.png',
  ];

  @override
  void initState() {
    super.initState();
    setState(() {
      List reversedReadingList =  widget.dataReading.reversed.toList();
      glucoseReadingList = reversedReadingList;
      
      debugPrint('this is the glucose reading list $glucoseReadingList');
      if (glucoseReadingList.isNotEmpty) {
        glucoseReadingListReady = true;
      }
    });
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
                    String imagePath = '';
                    String date = '';
                    String time = glucoseReadingList[index]['time'];
                    bool isThisItemForToday = false;
                    bool isItBad = false;
                    bool isItNormal = false;
                    debugPrint(DateTime.parse(glucoseReadingList[index]['date'])
                        .toString());
                    debugPrint(DateTime.now().toString());
                    var glucoseDate =
                        DateTime.parse(glucoseReadingList[index]['date']);
                    var todayDate = DateTime.now();
                    if ((glucoseDate.day == todayDate.day) &&
                        (glucoseDate.month == todayDate.month) &&
                        (glucoseDate.year == todayDate.year)) {
                      isThisItemForToday = true;
                    }

                    date = DateFormat.yMMMMEEEEd().format(glucoseDate);

                    if (imagesToUse.isNotEmpty) {
                      for (var i = 0; i < 4; i++) {
                        imagePath = imagesToUse[i];
                      }
                    }

                    // if (glucoseReadingList[index]['time'] != null &&
                    //     glucoseReadingList[index]['time']!.isNotEmpty) {
                    //   DateTime lastDateTime =
                    //       DateTime.parse(glucoseReadingList[index]['time']!);
                    //   TimeOfDay timeOfDay =
                    //       TimeOfDay.fromDateTime(lastDateTime);
                    //   time = timeOfDay.format(context);
                    // }

                    if (glucoseReadingList[index]['rating']
                            .toString()
                            .toLowerCase() ==
                        'bad') {
                      isItBad = true;
                    } else {
                      if (glucoseReadingList[index]['rating']
                              .toString()
                              .toLowerCase() ==
                          'normal') {
                        isItNormal = true;
                      }
                    }

                    return CustomGlucoseReadingItemWidget(
                      date: isThisItemForToday == true ? 'Today' : date,
                      description: glucoseReadingList[index]['description'],
                      glucoseLevel: glucoseReadingList[index]['glucoseValue'],
                      imagePath: imagePath,
                      time: time,
                      rating: glucoseReadingList[index]['rating'],
                      isItBad: isItBad,
                      isItNormal: isItNormal,
                    );
                  },
                ),
              )
            : ListNotReadyWidget(
                message: emptyGlucoseReadingList,
              );
  }
}
