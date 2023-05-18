import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diabetes_care/connectivityManager/connection_interface/connection.dart';
import 'package:diabetes_care/localStorage/sharedPreferences/app_shared_preferences.dart';
import 'package:diabetes_care/pages/patientPage/reminderPage/model/addReminderResponseModel/add_reminder_response_model.dart';
import 'package:diabetes_care/pages/patientPage/reminderPage/model/getRemindersResponseModel/get_reminders_response_model.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@injectable
class ReminderPageService {
  Connection connection;
  AppSharedPreferences appSharedPreferences;
  ReminderPageService({
    required this.connection,
    required this.appSharedPreferences,
  });

  Future<AddReminderResponseModel?> addNewReminderRequest({
    required String title,
    required String date,
    required String time,
    required String reminderMode,
  }) async {
    AddReminderResponseModel responseModel;
    try {
      var checkInternetConnection = await connection.isInternetEnabled();
      if (checkInternetConnection == true) {
        var addReminderResponse = await addNewReminder(
            title: title, date: date, time: time, reminderMode: reminderMode);
        if (addReminderResponse == true) {
          responseModel = const AddReminderResponseModel(
            message: 'Reminder added successfully!',
            status: true,
          );
        } else {
          responseModel = const AddReminderResponseModel(
            message: 'Operation failed!',
            status: false,
          );
        }
      } else {
        responseModel = const AddReminderResponseModel(
            message: 'Check internet connection', status: false);
      }
    } catch (e) {
      responseModel =
          AddReminderResponseModel(message: e.toString(), status: false);
    }

    return responseModel;
  }

  Future<GetReminderResponseModel?> getPatientsRemindersRequest() async {
    GetReminderResponseModel responseModel;
    try {
      var checkInternetConnection = await connection.isInternetEnabled();
      if (checkInternetConnection == true) {
        var reminderData = await getReminders();
        if (reminderData!.isNotEmpty) {
          responseModel = GetReminderResponseModel(
            message: 'Reminders retrieve successfully!',
            status: true,
            data: reminderData,
          );
        } else {
          responseModel = const GetReminderResponseModel(
            message: 'Operation failed!',
            status: false,
          );
        }
      } else {
        responseModel = const GetReminderResponseModel(
            message: 'Check internet connection', status: false);
      }
    } catch (e) {
      responseModel =
          GetReminderResponseModel(message: e.toString(), status: false);
    }

    return responseModel;
  }

  Future<bool?> addNewReminder({
    required String title,
    required String date,
    required String time,
    required String reminderMode,
  }) async {
    try {
      String email = await appSharedPreferences.readAuthEmailAddress();
      CollectionReference reminders =
          FirebaseFirestore.instance.collection('reminderCollections');
      var remindersSnapshot = await reminders.doc('reminderRecords').get();
      final remindersRecordData =
          remindersSnapshot.data() as Map<String, dynamic>;
      if (remindersRecordData.isNotEmpty) {
        List remindersList = remindersRecordData['remindersList'];
        int elementIndex = 0;
        bool isThereAnyElement = false;
        List listToAdd = [];
        for (var remindersListElement in remindersList) {
          if (remindersListElement['email'] == email) {
            listToAdd = remindersListElement['reminders'];
            elementIndex = remindersList.indexOf(remindersListElement);
            isThereAnyElement = true;
            debugPrint(listToAdd.toString());
           
          } else {
            isThereAnyElement = false;
          }
        }
        if (isThereAnyElement == true) {
          listToAdd.add({
            'title': title,
            'date': date,
            'time': time,
            'reminderMode': reminderMode,
          });
          remindersList[elementIndex] = {
            'email': email,
            'reminders': listToAdd
          };
        } else {
          remindersList.add(
            {
              'email': email,
              'reminders': [
                {
                  'title': title,
                  'date': date,
                  'time': time,
                  'reminderMode': reminderMode,
                }
              ]
            },
          );
        }
         await reminders.doc('reminderRecords').set({
              'remindersList': remindersList,
            });
      } else {
        await reminders.doc('reminderRecords').set({
          'remindersList': [
            {
              'email': email,
              'reminders': [
                {
                  'title': title,
                  'date': date,
                  'time': time,
                  'reminderMode': reminderMode,
                }
              ]
            },
          ]
        });
      }
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<Map?> getReminders() async {
    try {
      // String email = await appSharedPreferences.readAuthEmailAddress();
      CollectionReference reminders =
          FirebaseFirestore.instance.collection('reminderCollections');
      // await reminders.doc('reminderRecords').set({
      //   'remindersList': [
      //     {
      //       'email': email,
      //       'reminders': [
      //         {
      //           'title': 'Wake up',
      //           'date': DateTime.now().toIso8601String(),
      //           'time': DateTime.now().toIso8601String(),
      //           'reminderMode': 'Repeat',
      //         }
      //       ]
      //     },
      //   ]
      // });
      var snapshot = await reminders.doc('reminderRecords').get();
      final data = snapshot.data() as Map<String, dynamic>;
      debugPrint(data.toString());
      return data;
    } catch (e) {
      return {};
    }
  }
}
