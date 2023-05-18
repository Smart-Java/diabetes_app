import 'dart:async';

import 'package:diabetes_care/config/appColors/app_colors.dart';
// import 'package:diabetes_care/pages/patientPage/homePage/widget/bloodGlucoseWidget/blood_glucose_widget.dart';
import 'package:diabetes_care/pages/patientPage/reminderPage/bloc/event/reminder_page_event.dart';
import 'package:diabetes_care/pages/patientPage/reminderPage/bloc/reminder_page_bloc.dart';
import 'package:diabetes_care/pages/patientPage/reminderPage/bloc/state/reminder_page_state.dart';
import 'package:diabetes_care/pages/patientPage/reminderPage/widget/newReminderWidget/new_reminder_widget.dart';
import 'package:diabetes_care/pages/patientPage/reminderPage/widget/reminders_list_widget.dart';
import 'package:diabetes_care/util/pageHeaderWidget/patient_page_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReminderPageViewWidget extends StatefulWidget {
  const ReminderPageViewWidget({Key? key}) : super(key: key);

  @override
  State<ReminderPageViewWidget> createState() => _ReminderPageViewWidgetState();
}

class _ReminderPageViewWidgetState extends State<ReminderPageViewWidget> {
  bool showAddButton = false;
  late Timer updateTimer;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ReminderPageBloc>(context)
        .add(GetAllRemindersReminderPageEvent(isItForUpdate: false));
    updateReminderListings();
  }

  void updateReminderListings() {
    updateTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      BlocProvider.of<ReminderPageBloc>(context)
          .add(GetAllRemindersReminderPageEvent(isItForUpdate: true));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReminderPageBloc, ReminderPageState>(
      listener: (context, state) {
        if (state.isLoading == false) {
          setState(() {
            showAddButton = true;
          });
        }
      },
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.topStart,
            child: PatientPageHeaderWidget(
              childWidget: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Reminder',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 150.0,
              right: 10.0,
              left: 10.0,
            ),
            child: RemindersListWidet(),
          ),
          showAddButton == false
              ? Container()
              : Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
                      onTap: () async {
                        await showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return const NewReminderWidget();
                          },
                        );
                      },
                      child: Container(
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.add_circle_outline,
                              color: AppColors.whiteColor,
                              size: 20.0,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              'Add Reminder',
                              style: Theme.of(context).textTheme.button,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    updateTimer.cancel();
  }
}
