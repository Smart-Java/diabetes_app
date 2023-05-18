import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diabetes_care/connectivityManager/connection_interface/connection.dart';
import 'package:diabetes_care/localStorage/sharedPreferences/app_shared_preferences.dart';
import 'package:diabetes_care/util/allUsersService/service/all_users_service.dart';
import 'package:diabetes_care/util/dietService/model/addDietResponseModel/add_diet_response_model.dart';
import 'package:diabetes_care/util/dietService/model/dietRequestResponseModel/diet_request_response_model.dart';
import 'package:diabetes_care/util/dietService/model/getDietResponseModel/get_diet_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class DietService {
  Connection connection;
  AppSharedPreferences appSharedPreferences;
  AllUsersService allUsersService;
  DietService({
    required this.connection,
    required this.appSharedPreferences,
    required this.allUsersService,
  });

  Future<AddDietResponseModel?> addDietRequest({
    required String title,
    required String date,
    required String details,
    required String accessCode,
  }) async {
    AddDietResponseModel responseModel;
    try {
      var checkInternetConnection = await connection.isInternetEnabled();
      if (checkInternetConnection == true) {
        var addDietRequestResponse = await addNewDiets(
            title: title, date: date, details: details, accessCode: accessCode);
        if (addDietRequestResponse == true) {
          responseModel = const AddDietResponseModel(
            message: 'Diet added to patient successfully!',
            status: true,
          );
        } else {
          responseModel = const AddDietResponseModel(
            message: 'Operation failed!',
            status: false,
          );
        }
      } else {
        responseModel = const AddDietResponseModel(
            message: 'Check internet connection', status: false);
      }
    } catch (e) {
      responseModel =
          AddDietResponseModel(message: e.toString(), status: false);
    }

    return responseModel;
  }

  Future<GetDietResponseModel?> getDietRequest() async {
    GetDietResponseModel responseModel;
    try {
      var checkInternetConnection = await connection.isInternetEnabled();
      if (checkInternetConnection == true) {
        var dietData = await getDiets();
        if (dietData!.isNotEmpty) {
          responseModel = GetDietResponseModel(
            message: 'Diets retrieve successfully!',
            status: true,
            data: dietData,
          );
        } else {
          responseModel = const GetDietResponseModel(
            message: 'Operation failed!',
            status: false,
          );
        }
      } else {
        responseModel = const GetDietResponseModel(
            message: 'Check internet connection', status: false);
      }
    } catch (e) {
      responseModel =
          GetDietResponseModel(message: e.toString(), status: false);
    }

    return responseModel;
  }

  Future<DietRequestResponseModel?> requestForDietRequest() async {
    DietRequestResponseModel responseModel;
    try {
      var checkInternetConnection = await connection.isInternetEnabled();
      if (checkInternetConnection == true) {
        var dietRequestResponse = await requestForDiet();
        if (dietRequestResponse!['status'] == true) {
          responseModel = DietRequestResponseModel(
            message: dietRequestResponse['message'],
            status: true,
          );
        } else {
          responseModel = DietRequestResponseModel(
            message: dietRequestResponse['message'],
            status: false,
          );
        }
      } else {
        responseModel = const DietRequestResponseModel(
            message: 'Check internet connection', status: false);
      }
    } catch (e) {
      responseModel =
          DietRequestResponseModel(message: e.toString(), status: false);
    }

    return responseModel;
  }

  Future<bool?> addNewDiets({
    required String title,
    required String date,
    required String details,
    required String accessCode,
  }) async {
    try {
      String email = '';
      debugPrint('from diet hello 1');
      final patientsRecordData = await allUsersService.getPatients();
      if (patientsRecordData!.isNotEmpty) {
        List patientsList = patientsRecordData['patientsList'];
        debugPrint('from diet $patientsList 1');
        for (var patientsListElement in patientsList) {
          if (patientsListElement['accessCode'] == accessCode) {
            email = patientsListElement['email'];
          }
        }

        CollectionReference dietCollections =
            FirebaseFirestore.instance.collection('dietCollections');
        var dietsSnapshot = await dietCollections.doc('dietRecords').get();
        final dietsRecordData = dietsSnapshot.data() as Map<String, dynamic>;
        if (dietsRecordData.isNotEmpty) {
          List dietsList = dietsRecordData['diets'];
          int elementIndex = 0;
          bool isAnyElementFound = false;
          List listToAdd = [];
          for (var dietsListElement in dietsList) {
            if (dietsListElement['email'] == email) {
              isAnyElementFound = true;
              elementIndex = dietsList.indexOf(dietsListElement);
              listToAdd = dietsListElement['diets'];
              listToAdd.add({
                'title': title,
                'date': date,
                'details': details,
              });
            } else {
              isAnyElementFound = false;
            }
          }
          if (isAnyElementFound == true) {
            dietsList[elementIndex] = {
              'email': email,
              'diets': listToAdd,
            };
          } else {
            listToAdd.add({
              'title': title,
              'date': date,
              'details': details,
            });
          }
          await dietCollections.doc('dietRecords').update({
            'diets': [
              {'email': email, 'diets': listToAdd}
            ],
          });
        } else {
          await dietCollections.doc('dietRecords').set({
            'diets': [
              {
                'email': email,
                'diets': [
                  {
                    'title': title,
                    'date': date,
                    'details': details,
                  }
                ]
              }
            ],
          });
        }
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Map?> getDiets() async {
    try {
      // String email = await appSharedPreferences.readAuthEmailAddress();
      CollectionReference diets =
          FirebaseFirestore.instance.collection('dietCollections');
      // await diets.doc('dietRecords').set({
      //   'diets': [
      //     {
      //       'email': email,
      //       'diets': [
      //         {
      //           'title': 'Cake',
      //           'date': DateTime.now().toIso8601String(),
      //           'details': '<p>This is a test of the diet description</p>',
      //         }
      //       ]
      //     }
      //   ],
      // });
      var snapshot = await diets.doc('dietRecords').get();
      final data = snapshot.data() as Map<String, dynamic>;
      return data;
    } catch (e) {
      return {};
    }
  }

  Future<Map?> requestForDiet() async {
    Map data = {'status': false, 'message': 'Operation failed'};
    // String message = 'Operation failed';
    try {
      String email = await appSharedPreferences.readAuthEmailAddress();
      final patientsRecordData = await allUsersService.getPatients();
      if (patientsRecordData!.isNotEmpty) {
        List patientsList = patientsRecordData['patientsList'];
        for (var patientsListElement in patientsList) {
          if (patientsListElement['email'] == email) {
            var doctorEmail = patientsListElement['doctorEmail'];
            var accessCode = patientsListElement['accessCode'];
            if (doctorEmail.toString().isNotEmpty &&
                accessCode.toString().isNotEmpty) {
              final practitionerRecordData =
                  await allUsersService.getPractitioners();
              if (practitionerRecordData!.isNotEmpty) {
                CollectionReference practitioner = FirebaseFirestore.instance
                    .collection('practitionerCollections');
                List practitionerList =
                    practitionerRecordData['practitionerList'];
                int practIndexElement = 0;
                for (var practitionerListElement in practitionerList) {
                  List practitionerDietList =
                      practitionerListElement['dietRequests'];
                  int indexElement = 0;
                  bool isItForUpdate = false;
                  for (var practionerDietElement in practitionerDietList) {
                    debugPrint(
                        '${practionerDietElement['patientAccessCode']} $accessCode ${practitionerListElement['email']} $doctorEmail');
                    if ((practitionerListElement['email'] == doctorEmail) &&
                        (practionerDietElement['patientAccessCode'] ==
                            accessCode)) {
                      practIndexElement =
                          practitionerList.indexOf(practitionerListElement);
                      if (practitionerListElement['request']
                          .toString()
                          .isEmpty) {
                        indexElement =
                            practitionerDietList.indexOf(practionerDietElement);
                        isItForUpdate = true;
                      } else {
                        isItForUpdate = false;
                      }
                      // if (practitionerListElement['request']
                      //     .toString()
                      //     .isEmpty) {
                      //   indexElement =
                      //       practitionerDietList.indexOf(practionerDietElement);
                      // } else {

                      // }
                    } else {
                      data = {
                        'status': false,
                        'message':
                            'Your practitioner has a wrong access code of yours'
                      };
                    }
                  }
                  if (isItForUpdate == true) {
                    practitionerDietList[indexElement] = {
                      'patientAccessCode':
                          practitionerListElement['patientAccessCode'],
                      'request': '$email is requesting for diet',
                    };
                    practitionerList[practIndexElement] = {
                      'email': doctorEmail,
                      'dietRequests': practitionerDietList,
                    };
                    await practitioner.doc('practitionerRecords').update({
                      'practitionerList': practitionerList,
                    });
                    data = {
                      'status': true,
                      'message': 'Diet request sent successfully'
                    };
                  } else {
                    practitionerDietList.add({
                      'patientAccessCode': accessCode,
                      'request': '$email is requesting for diet',
                    });
                    practitionerList[practIndexElement] = {
                      'email': doctorEmail,
                      'dietRequests': practitionerDietList,
                    };
                    await practitioner
                        .doc('practitionerRecords')
                        .update({'practitionerList': practitionerList});

                    data = {
                      'status': true,
                      'message': 'Diet request sent successfully'
                    };
                  }
                }
              }
            } else {
              data = {
                'status': false,
                'message':
                    'No access code assigned to a practitioner yet, request for one'
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
