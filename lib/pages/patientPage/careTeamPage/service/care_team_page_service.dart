import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diabetes_care/connectivityManager/connection_interface/connection.dart';
import 'package:diabetes_care/localStorage/sharedPreferences/app_shared_preferences.dart';
import 'package:diabetes_care/pages/patientPage/careTeamPage/model/permission_request_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class CareTeamPageService {
  Connection connection;
  AppSharedPreferences appSharedPreferences;
  CareTeamPageService(
      {required this.connection, required this.appSharedPreferences});

  Future<PermissionRequestResponseModel?> givePractionerPermissionRequest(
      {required String doctorEmail}) async {
    PermissionRequestResponseModel responseModel;
    try {
      var checkInternetConnection = await connection.isInternetEnabled();
      if (checkInternetConnection == true) {
        var permissionRequestResponse =
            await updatePractitionerRequest(doctorEmail: doctorEmail);
        if (permissionRequestResponse!['status'] == true) {
          responseModel = PermissionRequestResponseModel(
            message: permissionRequestResponse['message'],
            status: true,
          );
        } else {
          responseModel = PermissionRequestResponseModel(
            message: permissionRequestResponse['message'],
            status: false,
          );
        }
      } else {
        responseModel = const PermissionRequestResponseModel(
            message: 'Check internet connection', status: false);
      }
    } catch (e) {
      responseModel =
          PermissionRequestResponseModel(message: e.toString(), status: false);
    }

    return responseModel;
  }

  Future<Map?> updatePractitionerRequest({required String doctorEmail}) async {
    Map data = {'status': false, 'message': 'Operation failed'};
    try {
      String patientEmail = await appSharedPreferences.readAuthEmailAddress();
      String patientAccessCode = '';

      CollectionReference patients =
          FirebaseFirestore.instance.collection('patientCollections');
      var patientsSnapshot = await patients.doc('patientRecords').get();
      final patientsRecordData =
          patientsSnapshot.data() as Map<String, dynamic>;

      if (patientsRecordData.isNotEmpty) {
        List patientsList = patientsRecordData['patientsList'];
        int patientIndex = 0;
        for (var patientElement in patientsList) {
          if (patientElement['email'] == patientEmail) {
            patientIndex = patientsList.indexOf(patientElement);

            var patientData = patientsList[patientIndex];
            if (patientData['accessCode'].toString().isNotEmpty) {
              patientAccessCode = patientData['accessCode'];
              patientsList[patientIndex] = {
                'email': patientElement['email'],
                'accessCode': patientElement['accessCode'],
                'doctorEmail': doctorEmail,
              };
              await patients.doc('patientRecords').update({
                'patientsList': patientsList,
              });

              CollectionReference practitioners = FirebaseFirestore.instance
                  .collection('practitionerCollections');
              var practitionersSnapshot =
                  await practitioners.doc('practitionerRecords').get();

              final practitionerRecordData =
                  practitionersSnapshot.data() as Map<String, dynamic>;
              if (practitionerRecordData.isNotEmpty) {
                List practitionerList =
                    practitionerRecordData['practitionerList'];
                int praIndex = 0;
                for (var practitionerElement in practitionerList) {
                  if (practitionerElement['email'] == doctorEmail) {
                    debugPrint(
                        'this is the ${practitionerElement['dietRequests']} 1');
                    praIndex = practitionerList.indexOf(practitionerElement);
                    List dietRequestsList = practitionerElement['dietRequests'];
                    int praDietIndex = 0;
                    bool praHasPatient = false;
                    for (var dietRequestsElement in dietRequestsList) {
                      if (dietRequestsElement['patientAccessCode'] ==
                          patientAccessCode) {
                        praDietIndex =
                            dietRequestsList.indexOf(dietRequestsElement);
                        praHasPatient = true;
                      } else {
                        praHasPatient = false;
                      }
                      debugPrint(
                          'this is the ${dietRequestsElement['patientAccessCode']} 2');
                    }
                    if (praHasPatient == true) {
                      debugPrint(
                          'this is the ${dietRequestsList[praDietIndex]} 3');
                      dietRequestsList[praDietIndex] = {
                        'patientAccessCode': patientAccessCode,
                        'request': '',
                      };
                      practitionerList[praIndex] = {
                        'email': doctorEmail,
                        'dietRequests': dietRequestsList,
                      };
                      await practitioners.doc('practitionerRecords').update({
                        'practitionerList': practitionerList,
                      });
                      data = {
                        'status': true,
                        'message': 'Permission successfully given'
                      };
                    } else {
                      debugPrint('this is the $dietRequestsList 4');
                      dietRequestsList.add({
                        'patientAccessCode': patientAccessCode,
                        'request': '',
                      });
                      debugPrint('this is the $dietRequestsList 5');
                      practitionerList[praIndex] = {
                        'email': doctorEmail,
                        'dietRequests': dietRequestsList,
                      };
                      debugPrint('this is the $practitionerList 6');
                      await practitioners.doc('practitionerRecords').update({
                        'practitionerList': practitionerList,
                      });
                      data = {
                        'status': true,
                        'message': 'Permission successfully given'
                      };
                    }
                  }
                }
              }
            } else {
              data = {
                'status': false,
                'message': 'No access code, request for one'
              };
            }
          }
        }
      }

      return data;
    } catch (e) {
      return data;
    }
  }
}
