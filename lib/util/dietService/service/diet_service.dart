import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diabetes_care/connectivityManager/connection_interface/connection.dart';
import 'package:diabetes_care/localStorage/sharedPreferences/app_shared_preferences.dart';
import 'package:diabetes_care/util/allUsersService/service/all_users_service.dart';
import 'package:diabetes_care/util/dietService/model/addDietResponseModel/add_diet_response_model.dart';
import 'package:diabetes_care/util/dietService/model/dietRequestResponseModel/diet_request_response_model.dart';
import 'package:diabetes_care/util/dietService/model/getDietResponseModel/get_diet_response_model.dart';
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
            message: 'Diet added successfully!',
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
        if (dietRequestResponse == true) {
          responseModel = const DietRequestResponseModel(
            message: 'Diets retrieve successfully!',
            status: true,
          );
        } else {
          responseModel = const DietRequestResponseModel(
            message: 'Operation failed!',
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
      final patientsRecordData = await allUsersService.getPatients();
      if (patientsRecordData!.isNotEmpty) {
        List patientsList = patientsRecordData['patients'];
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
          for (var dietsListElement in dietsList) {
            if (dietsListElement['email'] == email) {
              dietsList.add({
                'email': email,
                'diets': [
                  {
                    'title': title,
                    'date': date,
                    'details': details,
                  }
                ]
              });
              await dietCollections.doc('dietRecords').set({
                'diets': dietsList,
              });
            }
          }
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
      String email = await appSharedPreferences.readAuthEmailAddress();
      CollectionReference diets =
          FirebaseFirestore.instance.collection('dietCollections');
      await diets.doc('dietRecords').set({
        'diets': [
          {
            'email': email,
            'diets': [
              {
                'title': 'Cake',
                'date': DateTime.now().toIso8601String(),
                'details': '<p>This is a test of the diet description</p>',
              }
            ]
          }
        ],
      });
      var snapshot = await diets.doc('dietRecords').get();
      final data = snapshot.data() as Map<String, dynamic>;
      return data;
    } catch (e) {
      return {};
    }
  }

  Future<bool?> requestForDiet() async {
    try {
      String email = await appSharedPreferences.readAuthEmailAddress();
      final patientsRecordData = await allUsersService.getPatients();
      if (patientsRecordData!.isNotEmpty) {
        List patientsList = patientsRecordData['patients'];
        for (var patientsListElement in patientsList) {
          if (patientsListElement['email'] == email) {
            var doctorEmail = patientsListElement['doctorEmail'];
            var accessCode = patientsListElement['accessCode'];
            final practitionerRecordData =
                await allUsersService.getPractitioners();
            if (practitionerRecordData!.isNotEmpty) {
              CollectionReference practitioner = FirebaseFirestore.instance
                  .collection('practitionerCollections');
              List practitionerList =
                  practitionerRecordData['practitionerList'];
              for (var practitionerListElement in practitionerList) {
                if ((practitionerListElement['email'] == doctorEmail) &&
                    (practitionerListElement['patientAccessCode'] ==
                        accessCode)) {
                  if (practitionerListElement['request'].toString().isEmpty) {
                    int indexElement =
                        practitionerList.indexOf(practitionerListElement);
                    practitionerList[indexElement] = {
                      'email': doctorEmail,
                      'dietRequests': [
                        {
                          'patientAccessCode':
                              practitionerListElement['patientAccessCode'],
                          'request': '$email is requesting for diet',
                        }
                      ]
                    };
                    await practitioner.doc('practitionerRecords').update({
                      'practitionerList': practitionerList,
                    });
                  } else {
                    practitionerList.add({
                      'email': doctorEmail,
                      'dietRequests': [
                        {
                          'patientAccessCode': accessCode,
                          'request': '',
                        }
                      ]
                    });
                    await practitioner.doc('practitionerRecords').set({
                      'practitionerList': practitionerList,
                    });
                  }
                }
              }
            }
          }
        }
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
