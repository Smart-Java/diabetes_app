import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diabetes_care/connectivityManager/connection_interface/connection.dart';
import 'package:diabetes_care/localStorage/sharedPreferences/app_shared_preferences.dart';
import 'package:diabetes_care/pages/authenticationPage/model/login_response_model.dart/login_response_model.dart';
import 'package:diabetes_care/pages/authenticationPage/model/register_response_model.dart/register_response_model.dart';
import 'package:diabetes_care/util/allUsersService/service/all_users_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthService {
  Connection connection;
  AppSharedPreferences appSharedPreferences;
  AllUsersService allUsersService;
  AuthService({
    required this.connection,
    required this.appSharedPreferences,
    required this.allUsersService,
  });

  Future<LoginResponseModel?> loginUser({
    required String email,
    required String password,
  }) async {
    LoginResponseModel responseModel;
    try {
      var checkInternetConnection = await connection.isInternetEnabled();
      if (checkInternetConnection == true) {
        var loginAuthUserResponse =
            await loginAuthUser(email: email, password: password);
        if (loginAuthUserResponse!.toLowerCase() == 'success') {
          var userDataResponse = await allUsersService.getUsers();
          if (userDataResponse!.isNotEmpty) {
            await appSharedPreferences.cacheAuthEmailAddress(email);
            List users = userDataResponse['users'];
            for (var userElement in users) {
              debugPrint(userElement.toString());
              await appSharedPreferences
                  .cacheUserFullname(userElement['fullname']);
              if (userElement['email'] == email) {
                if (userElement['isItAPatient'] == true) {
                  var patientDataResponse = await allUsersService.getPatients();
                  debugPrint(patientDataResponse.toString());
                  if (patientDataResponse!.isNotEmpty) {
                    List patients = patientDataResponse['patientsList'];
                    for (var patientElement in patients) {
                      if (patientElement['email'] == email) {
                        await appSharedPreferences.cachePatientAccessCode(
                            patientElement['accessCode']);
                      }
                    }
                  }
                }
              }
            }
            responseModel = LoginResponseModel(
              message: 'Authentication successful!',
              status: true,
              data: userDataResponse,
            );
          } else {
            responseModel = const LoginResponseModel(
              message: 'Operation failed!',
              status: false,
            );
          }
        } else {
          responseModel =
              LoginResponseModel(message: loginAuthUserResponse, status: false);
        }
      } else {
        responseModel = const LoginResponseModel(
            message: 'Check internet connection', status: false);
      }
    } catch (e) {
      responseModel = LoginResponseModel(message: e.toString(), status: false);
    }

    return responseModel;
  }

  Future<String?> loginAuthUser(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<RegisterResponseModel?> registerUser({
    required String fullName,
    required String password,
    required String category,
    required bool isItAPatient,
    required String email,
  }) async {
    RegisterResponseModel registerResponseModel;
    try {
      var networkConnectionResponse = await connection.isInternetEnabled();
      if (networkConnectionResponse == true) {
        var authUserResponse =
            await registerAuthUser(email: email, password: password);
        if (authUserResponse!.toLowerCase() == 'success') {
          var addUserResponse = await allUsersService.addUser(
              fullName: fullName,
              category: category,
              isItAPatient: isItAPatient,
              email: email);
          if (addUserResponse == true) {
            if (isItAPatient == true) {
              var addPatientResponse = await allUsersService.addUpdatePatient(
                  accessCode: '', email: email);
              if (addPatientResponse == true) {
                registerResponseModel = const RegisterResponseModel(
                    message: 'Success registration!', status: true);
              } else {
                registerResponseModel = const RegisterResponseModel(
                    message: 'Operation failed!', status: false);
              }
            } else {
              var addPractitionerResponse = await allUsersService
                  .addPractitioner(email: email, patientAccessCode: '');
              if (addPractitionerResponse == true) {
                registerResponseModel = const RegisterResponseModel(
                    message: 'Success registration!', status: true);
              } else {
                registerResponseModel = const RegisterResponseModel(
                    message: 'Operation failed!', status: false);
              }
            }
          } else {
            registerResponseModel = const RegisterResponseModel(
                message: 'Operation failed!', status: false);
          }
        } else {
          registerResponseModel =
              RegisterResponseModel(message: authUserResponse, status: false);
        }
      } else {
        registerResponseModel = const RegisterResponseModel(
            message: 'Check internet connection', status: false);
      }
    } catch (e) {
      registerResponseModel = const RegisterResponseModel(
          message: 'Operation failed!', status: false);
    }
    return registerResponseModel;
  }

  Future<String?> registerAuthUser({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      } else {
        return e.message;
      }
    } catch (e) {
      return 'An error occured';
    }
  }

  Future<Map?> getUser() async {
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
}
