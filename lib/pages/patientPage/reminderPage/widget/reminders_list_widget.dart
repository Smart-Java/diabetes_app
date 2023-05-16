import 'package:diabetes_care/config/appShimmerEffect/app_shimmer_effect.dart';
import 'package:diabetes_care/pages/patientPage/reminderPage/bloc/reminder_page_bloc.dart';
import 'package:diabetes_care/pages/patientPage/reminderPage/bloc/state/reminder_page_state.dart';
import 'package:diabetes_care/pages/patientPage/reminderPage/widget/custom_reminder_item_widget.dart';
import 'package:diabetes_care/util/listNotReadyWidget/list_not_ready_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemindersListWidet extends StatefulWidget {
  const RemindersListWidet({Key? key}) : super(key: key);

  @override
  State<RemindersListWidet> createState() => _RemindersListWidetState();
}

class _RemindersListWidetState extends State<RemindersListWidet> {
  bool loadShimmer = true;
  bool remindersListReady = false;
  String emptyAllOrdersList = 'No reminder yet!';
  List remindersList = [
    {
      'title': 'Hello',
      'time': DateTime.now().toIso8601String(),
      'date': DateTime.now().toIso8601String()
    }
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReminderPageBloc, ReminderPageState>(
        builder: (context, state) {
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
                    debugPrint(remindersList[index]['date']);
                    DateTime date =
                        DateTime.parse(remindersList[index]['date']);
                    // DateTime dateTimeForTime =
                    //     DateTime.parse(remindersList[index]['time']);
                    // TimeOfDay time = TimeOfDay.fromDateTime(dateTimeForTime);
                    return CustomReminderItemWidget(
                      date: '${date.day}-${date.month}-${date.year}',
                      time: remindersList[index]['time'],
                      title: remindersList[index]['title'],
                      reminderMode: remindersList[index]['reminderMode'],
                    );
                  },
                )
              : ListNotReadyWidget(
                  message: emptyAllOrdersList,
                );
    }, listener: (context, state) {
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

      if (state.reminderDataList != null &&
          state.reminderDataList!.isNotEmpty) {
        setState(() {
          remindersList = state.reminderDataList!;
        });
      } else {
        setState(() {
          remindersList = [];
        });
      }

      if (state.isListReady == true) {
        setState(() {
          remindersListReady = state.isListReady!;
        });
      }
    });
  }
}
