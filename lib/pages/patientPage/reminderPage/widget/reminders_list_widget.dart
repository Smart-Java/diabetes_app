import 'package:diabetes_care/config/appShimmerEffect/app_shimmer_effect.dart';
import 'package:diabetes_care/pages/patientPage/reminderPage/widget/custom_reminder_item_widget.dart';
import 'package:diabetes_care/util/listNotReadyWidget/list_not_ready_widget.dart';
import 'package:flutter/material.dart';

class RemindersListWidet extends StatefulWidget {
  const RemindersListWidet({Key? key}) : super(key: key);

  @override
  State<RemindersListWidet> createState() => _RemindersListWidetState();
}

class _RemindersListWidetState extends State<RemindersListWidet> {
  bool loadShimmer = false;
  bool remindersListReady = false;
  String emptyAllOrdersList = 'No reminder yet!';
  List remindersList = [
    {'title': 'Hello', 'time': '12:00', 'date': '12-20-2000'}
  ];
  @override
  void initState() {
    super.initState();
    if (remindersList.isNotEmpty) {
      setState(() {
        remindersListReady = true;
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
        : (remindersList.isNotEmpty && remindersListReady == true)
            ? ListView.builder(
                itemCount: remindersList.length,
                itemBuilder: (context, index) {
                  return CustomReminderItemWidget(
                    date: remindersList[index]['date'],
                    time: remindersList[index]['time'],
                    title: remindersList[index]['title'],
                  );
                },
              )
            : ListNotReadyWidget(
                message: emptyAllOrdersList,
              );
  }
}
