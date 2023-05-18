import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diabetes_care/connectivityManager/connection_interface/connection.dart';
import 'package:diabetes_care/util/allUsersService/model/patientsResponseModel/patients_response_model.dart';
import 'package:diabetes_care/util/allUsersService/model/usersResponseModel/users_response_model.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@injectable
class AllUsersService {
  Connection connection;
  AllUsersService({
    required this.connection,
  });

  Future<UsersResponseModel?> getAllUserRequest() async {
    UsersResponseModel responseModel;
    try {
      var checkInternetConnection = await connection.isInternetEnabled();
      if (checkInternetConnection == true) {
        var userDataResponse = await getUsers();
        if (userDataResponse!.isNotEmpty) {
          responseModel = UsersResponseModel(
            message: 'Authentication successful!',
            status: true,
            data: userDataResponse,
          );
        } else {
          responseModel = const UsersResponseModel(
            message: 'Operation failed!',
            status: false,
          );
        }
      } else {
        responseModel = const UsersResponseModel(
            message: 'Check internet connection', status: false);
      }
    } catch (e) {
      responseModel = UsersResponseModel(message: e.toString(), status: false);
    }

    return responseModel;
  }

  Future<PatientsResponseModel?> getAllPatientsRequest() async {
    PatientsResponseModel responseModel;
    try {
      var checkInternetConnection = await connection.isInternetEnabled();
      if (checkInternetConnection == true) {
        var patientsResponseData = await getPatients();
        if (patientsResponseData!.isNotEmpty) {
          responseModel = PatientsResponseModel(
            message: 'Authentication successful!',
            status: true,
            data: patientsResponseData,
          );
        } else {
          responseModel = const PatientsResponseModel(
            message: 'Operation failed!',
            status: false,
          );
        }
      } else {
        responseModel = const PatientsResponseModel(
            message: 'Check internet connection', status: false);
      }
    } catch (e) {
      responseModel =
          PatientsResponseModel(message: e.toString(), status: false);
    }

    return responseModel;
  }

  Future<Map?> getUsers() async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('userCollections');
      var snapshot = await users.doc('userRecords').get();
      final data = snapshot.data() as Map<String, dynamic>;
      return data;
    } catch (e) {
      return {};
    }
  }

  Future<Map?> getPatients() async {
    try {
      CollectionReference patients =
          FirebaseFirestore.instance.collection('patientCollections');
      var snapshot = await patients.doc('patientRecords').get();
      final data = snapshot.data() as Map<String, dynamic>;
      return data;
    } catch (e) {
      return {};
    }
  }

  Future<Map?> getPractitioners() async {
    try {
      CollectionReference practitioners =
          FirebaseFirestore.instance.collection('practitionerCollections');
      var snapshot = await practitioners.doc('practitionerRecords').get();
      final data = snapshot.data() as Map<String, dynamic>;
      return data;
    } catch (e) {
      return {};
    }
  }

  Future<bool?> addUser({
    required String fullName,
    required String category,
    required bool isItAPatient,
    required String email,
  }) async {
    try {
      CollectionReference addNewUserRecord =
          FirebaseFirestore.instance.collection('userCollections');
      var newUserSnapshot = await addNewUserRecord.doc('userRecords').get();
      final userRecordData = newUserSnapshot.data() as Map<String, dynamic>;
      if (userRecordData.isNotEmpty) {
        // userRecordData.forEach((key, value) async {
        //   if (key == 'email' && value == email) {
        //   } else {
        //     List userList = userRecordData['users'];
        //     userList.add({
        //       'email': email,
        //       'fullname': fullName,
        //       'isItAPatient': isItAPatient,
        //       'category': category,
        //       'phoneNumber': '09083792780'
        //     });

        //     await addNewUserRecord.doc('userRecords').set({
        //       'users': userList,
        //     });
        //   }
        // });
        List userList = userRecordData['users'];
        bool isThereAnyUserIn = false;
        int userIndex = 0;
        for (var userElement in userList) {
          if (userElement['element'] == email) {
            isThereAnyUserIn = true;
            userIndex = userList.indexOf(userElement);
          } else {
            isThereAnyUserIn = false;
          }
        }

        if (isThereAnyUserIn == false) {
          userList.add({
            'email': email,
            'fullname': fullName,
            'isItAPatient': isItAPatient,
            'category': category,
            'phoneNumber': '09083792780'
          });
          await addNewUserRecord.doc('userRecords').set({
            'users': userList,
          });
        } else {
          userList[userIndex] = {
            'email': email,
            'fullname': fullName,
            'isItAPatient': isItAPatient,
            'category': category,
            'phoneNumber': '09083792780'
          };
          await addNewUserRecord.doc('userRecords').update({
            'users': userList,
          });
        }
      } else {
        await addNewUserRecord.doc('userRecords').set({
          'users': [
            {
              'email': email,
              'fullname': fullName,
              'isItAPatient': isItAPatient,
              'category': category,
              'phoneNumber': '09083792780'
            }
          ],
        });
      }
      // CollectionReference users = FirebaseFirestore.instance.collection('user');
      // await users.doc(email).set({
      //   'email': email,
      //   'fullName': fullName,
      //   'isItAPatient': isItAPatient,
      //   'category': category
      // });
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<bool?> addUpdatePatient({
    required String accessCode,
    required String email,
  }) async {
    try {
      CollectionReference patients =
          FirebaseFirestore.instance.collection('patientCollections');
      var patientsSnapshot = await patients.doc('patientRecords').get();
      final patientsRecordData =
          patientsSnapshot.data() as Map<String, dynamic>;
      if (patientsRecordData.isNotEmpty) {
        List patientsList = patientsRecordData['patientsList'];
        bool isThereAnyUserIn = false;
        int userIndex = 0;
        String doctorEmail = '';
        for (var patientElement in patientsList) {
          if (patientElement['email'].toString().trim() == email.toString()) {
            isThereAnyUserIn = true;
            userIndex = patientsList.indexOf(patientElement);
            doctorEmail = patientElement['doctorEmail']; 
          } else {
            isThereAnyUserIn = false;
          }
          debugPrint('${patientElement['email']} $userIndex $isThereAnyUserIn');
        }

        if (isThereAnyUserIn == false) {
          patientsList.add({
            'email': email,
            'accessCode': accessCode,
            'doctorEmail': doctorEmail,
          });
          await patients.doc('patientRecords').update({
            'patientsList': patientsList,
          });
        } else {
          patientsList[userIndex] = {
            'email': email,
            'accessCode': accessCode,
            'doctorEmail': doctorEmail,
          };
          await patients.doc('patientRecords').update({
            'patientsList': patientsList,
          });
        }
      } else {
        await patients.doc('patientRecords').set({
          'patientsList': [
            {
              'email': email,
              'accessCode': accessCode,
              'doctorEmail': '',
            }
          ],
        });
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool?> addPractitioner({
    required String email,
    required String patientAccessCode,
  }) async {
    try {
      CollectionReference practitioner =
          FirebaseFirestore.instance.collection('practitionerCollections');
      var practitionerSnapshot =
          await practitioner.doc('practitionerRecords').get();
      final practitionerRecordData =
          practitionerSnapshot.data() as Map<String, dynamic>;
      if (practitionerRecordData.isNotEmpty) {
        List practitionerList = practitionerRecordData['practitionerList'];
        bool isThereAnyUserIn = false;
        int userIndex = 0;
        for (var userElement in practitionerList) {
          if (userElement['email'] == email) {
            isThereAnyUserIn = true;
            userIndex = practitionerList.indexOf(userElement);
          } else {
            isThereAnyUserIn = false;
          }
        }

        if (isThereAnyUserIn == false) {
          practitionerList.add({
            'email': email,
            'dietRequests': [
              {
                'patientAccessCode': patientAccessCode,
                'request': '',
              }
            ]
          });
          await practitioner.doc('practitionerRecords').set({
            'practitionerList': practitionerList,
          });
        } else {
          practitionerList[userIndex] = {
            'email': email,
            'dietRequests': [
              {
                'patientAccessCode': patientAccessCode,
                'request': '',
              }
            ]
          };
          await practitioner.doc('practitionerRecords').update({
            'practitionerList': practitionerList,
          });
        }
      } else {
        await practitioner.doc('practitionerRecords').set({
          'practitionerList': [
            {
              'email': email,
              'dietRequests': [
                {
                  'patientAccessCode': patientAccessCode,
                  'request': '',
                }
              ],
            }
          ],
        });
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
