import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diabetes_care/connectivityManager/connection_interface/connection.dart';
import 'package:diabetes_care/localStorage/sharedPreferences/app_shared_preferences.dart';
import 'package:diabetes_care/util/pracPatientService/model/addScheduleResponseModel/add_schedule_response_model.dart';
import 'package:diabetes_care/util/pracPatientService/model/getPraSchedulesResponseModel/get_pra_schedules_response_model.dart';
import 'package:diabetes_care/util/pracPatientService/model/getPracPatientsResponseModel/get_pra_patients_response_model.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@injectable
class PractitionerService {
  Connection connection;
  AppSharedPreferences appSharedPreferences;
  PractitionerService({
    required this.connection,
    required this.appSharedPreferences,
  });

  Future<AddScheduleResponseModel?> addNewScheduleRequest({
    required String patientEmail,
    required String patientName,
    required String scheduleTime,
    required String scheduleDate,
  }) async {
    AddScheduleResponseModel responseModel;
    try {
      var checkInternetConnection = await connection.isInternetEnabled();
      if (checkInternetConnection == true) {
        var addScheduleResponse = await addScheduleForPractitioner(
          patientEmail: patientEmail,
          scheduleTime: scheduleTime,
          scheduleDate: scheduleDate,
          patientName: patientName,
        );
        if (addScheduleResponse == true) {
          responseModel = const AddScheduleResponseModel(
            message: 'Schedule added successfully!',
            status: true,
          );
        } else {
          responseModel = const AddScheduleResponseModel(
            message: 'Operation failed!',
            status: false,
          );
        }
      } else {
        responseModel = const AddScheduleResponseModel(
            message: 'Check internet connection', status: false);
      }
    } catch (e) {
      responseModel =
          AddScheduleResponseModel(message: e.toString(), status: false);
    }

    return responseModel;
  }

  Future<GetPraPatientsResponseModel?> getPraPatientsRequest() async {
    GetPraPatientsResponseModel responseModel;
    try {
      var checkInternetConnection = await connection.isInternetEnabled();
      if (checkInternetConnection == true) {
        var praPatientsListData = await getPractitionerPatientList();
        if (praPatientsListData!.isNotEmpty) {
          responseModel = GetPraPatientsResponseModel(
            message: 'Patients data retrieve successfully!',
            status: true,
            data: praPatientsListData,
          );
        } else {
          responseModel = const GetPraPatientsResponseModel(
            message: 'Operation failed!',
            status: false,
          );
        }
      } else {
        responseModel = const GetPraPatientsResponseModel(
            message: 'Check internet connection', status: false);
      }
    } catch (e) {
      responseModel =
          GetPraPatientsResponseModel(message: e.toString(), status: false);
    }

    return responseModel;
  }

  Future<GetPraSchedulesResponseModel?> getSchedulesRequest() async {
    GetPraSchedulesResponseModel responseModel;
    try {
      var checkInternetConnection = await connection.isInternetEnabled();
      if (checkInternetConnection == true) {
        var pracSchedulesListData = await getPraSchedules();
        if (pracSchedulesListData!.isNotEmpty) {
          responseModel = GetPraSchedulesResponseModel(
            message: 'Schedules retrieve successfully!',
            status: true,
            data: pracSchedulesListData,
          );
        } else {
          responseModel = const GetPraSchedulesResponseModel(
            message: 'Operation failed!',
            status: false,
          );
        }
      } else {
        responseModel = const GetPraSchedulesResponseModel(
            message: 'Check internet connection', status: false);
      }
    } catch (e) {
      responseModel =
          GetPraSchedulesResponseModel(message: e.toString(), status: false);
    }

    return responseModel;
  }

  Future<List?> getPractitionerPatientList() async {
    List doctorPatientsList = [];
    try {
      String email = await appSharedPreferences.readAuthEmailAddress();
      CollectionReference practitioners =
          FirebaseFirestore.instance.collection('practitionerCollections');

      // await practitioners.doc('scheduleRecords').set({
      //     'scheduleList': [
      //       {
      //         'email': 'leofinnard@gmail.com',
      //         'scheduleList': [
      //           {
      //             'patientEmail': 'user@gmail.com',
      //             'patientName': 'User',
      //             'scheduleTime': '9:00 AM - 10:00 AM',
      //             'scheduleDate': DateTime.now().toIso8601String(),
      //           }
      //         ]
      //       }
      //     ],
      //   });

      var practitionersSnapshot =
          await practitioners.doc('practitionerRecords').get();
      final practitionersRecordData =
          practitionersSnapshot.data() as Map<String, dynamic>;

      if (practitionersRecordData.isNotEmpty) {
        List praList = practitionersRecordData['practitionerList'];
        for (var praListElement in praList) {
          if (praListElement['email'] == email) {
            List praPatientRequestList = praListElement['dietRequests'];
            for (var praPatientRequestListElement in praPatientRequestList) {
              var patientAccesCode =
                  praPatientRequestListElement['patientAccessCode'];
              if (patientAccesCode.toString().isNotEmpty) {
                CollectionReference patients =
                    FirebaseFirestore.instance.collection('patientCollections');
                var patientsSnapshot =
                    await patients.doc('patientRecords').get();
                final patientsRecordData =
                    patientsSnapshot.data() as Map<String, dynamic>;
                if (patientsRecordData.isNotEmpty) {
                  List patientsList = patientsRecordData['patientsList'];
                  for (var patientsListElement in patientsList) {
                    if (patientsListElement['accessCode'] == patientAccesCode) {
                      var patientsEmail = patientsListElement['email'];
                      CollectionReference users = FirebaseFirestore.instance
                          .collection('userCollections');
                      var userSnapshot = await users.doc('userRecords').get();
                      final userRecordData =
                          userSnapshot.data() as Map<String, dynamic>;
                      if (userRecordData.isNotEmpty) {
                        List userList = userRecordData['users'];
                        for (var userListElement in userList) {
                          if (userListElement['email'] == patientsEmail) {
                            var patientsFullName = userListElement['fullname'];
                            CollectionReference glucoseReadings =
                                FirebaseFirestore.instance
                                    .collection('glucoseCollections');
                            var glucoseSnapshot = await glucoseReadings
                                .doc('glucoseRecords')
                                .get();
                            final glucoseRecordData =
                                glucoseSnapshot.data() as Map<String, dynamic>;
                            if (glucoseRecordData.isNotEmpty) {
                              List patientGlucoseReadingList =
                                  glucoseRecordData['glucoseList'];
                              for (var glucoseReadingListElement
                                  in patientGlucoseReadingList) {
                                if (glucoseReadingListElement['email'] ==
                                    patientsEmail) {
                                  List glucoseReadingList =
                                      glucoseReadingListElement['readings'];
                                  int lengthOfGlucoseReadingList =
                                      glucoseReadingList.length;
                                  var lastGlucoseValue = glucoseReadingList[
                                          lengthOfGlucoseReadingList - 1]
                                      ['glucoseValue'];
                                  var data = {
                                    'patientEmail': patientsEmail,
                                    'doctorEmail': email,
                                    'patientName': patientsFullName,
                                    'patientAccessCode': patientAccesCode,
                                    'patientLastGlucoseValue': lastGlucoseValue,
                                  };
                                  bool isAnyElementFound = false;
                                  if (doctorPatientsList.isNotEmpty) {
                                    for (var doctorPatientsListElement
                                        in doctorPatientsList) {
                                      if (doctorPatientsListElement[
                                              'patientEmail'] !=
                                          patientsEmail) {
                                        isAnyElementFound = false;
                                      } else {
                                        isAnyElementFound = true;
                                      }
                                    }
                                    if (isAnyElementFound == false) {
                                      doctorPatientsList.add(data);
                                    }
                                  } else {
                                    doctorPatientsList.add(data);
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }

      return doctorPatientsList;
    } catch (e) {
      debugPrint(e.toString());
      return doctorPatientsList;
    }
  }

  Future<bool?> addScheduleForPractitioner({
    required String patientEmail,
    required String patientName,
    required String scheduleTime,
    required String scheduleDate,
  }) async {
    try {
      String doctorEmail = await appSharedPreferences.readAuthEmailAddress();
      CollectionReference practitioner =
          FirebaseFirestore.instance.collection('practitionerCollections');
      var practitionerSnapshot =
          await practitioner.doc('scheduleRecords').get();
      final practitionerScheduleRecordData =
          practitionerSnapshot.data() as Map<String, dynamic>;
      int elementIndex = 0;
      bool anyScheduleRecordForPra = false;
      List dataList = [];
      if (practitionerScheduleRecordData.isNotEmpty) {
        List scheduleList = practitionerScheduleRecordData['scheduleList'];
        debugPrint('this is the schedule list $scheduleList');
        for (var scheduleListElement in scheduleList) {
          if (scheduleListElement['email'] == doctorEmail) {
            elementIndex = scheduleList.indexOf(scheduleListElement);
            anyScheduleRecordForPra = true;
            dataList = scheduleListElement['scheduleList'];
            dataList.add({
              'patientEmail': patientEmail,
              'patientName': patientName,
              'scheduleTime': scheduleTime,
              'scheduleDate': scheduleDate,
            });
          } else {
            anyScheduleRecordForPra = false;
          }
        }

        if (anyScheduleRecordForPra == true) {
          scheduleList[elementIndex] = {
            'email': doctorEmail,
            'scheduleList': dataList,
          };
        } else {
          debugPrint('this is the schedule list $scheduleList 2');
          scheduleList.add({
            'email': doctorEmail,
            'scheduleList': [
              {
                'patientEmail': patientEmail,
                'patientName': patientName,
                'scheduleTime': scheduleTime,
                'scheduleDate': scheduleDate,
              }
            ],
          });
        }
        await practitioner.doc('scheduleRecords').update({
          'scheduleList': scheduleList,
        });
      } else {
        await practitioner.doc('scheduleRecords').set({
          'scheduleList': [
            {
              'email': doctorEmail,
              'scheduleList': [
                {
                  'patientEmail': patientEmail,
                  'patientName': patientName,
                  'scheduleTime': scheduleTime,
                  'scheduleDate': scheduleDate,
                }
              ]
            }
          ],
        });
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Map?> getPraSchedules() async {
    try {
      CollectionReference practitioner =
          FirebaseFirestore.instance.collection('practitionerCollections');
      var practitionerSnapshot =
          await practitioner.doc('scheduleRecords').get();
      final data = practitionerSnapshot.data() as Map<String, dynamic>;
      debugPrint(data.toString());
      return data;
    } catch (e) {
      return {};
    }
  }
}
