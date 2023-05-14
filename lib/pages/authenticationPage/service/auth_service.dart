import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diabetes_care/connectivityManager/connection_interface/connection.dart';
import 'package:diabetes_care/pages/authenticationPage/model/login_response_model.dart/login_response_model.dart';
import 'package:diabetes_care/pages/authenticationPage/model/register_response_model.dart/register_response_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthService {
  Connection connection;
  AuthService({required this.connection});

  Future<LoginResponseModel?> loginUser({
    required String email,
    required String password,
  }) async {
    LoginResponseModel responseModel;
    try {
      var checkInternetConnection = await checkInternetConnectivity();
      if (checkInternetConnection == true) {
        var loginAuthUserResponse =
            await loginAuthUser(email: email, password: password);
        if (loginAuthUserResponse!.toLowerCase() == 'success') {
          var userDataResponse = await getUser(email: email);
          if (userDataResponse!.isNotEmpty) {
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
      var networkConnectionResponse = await checkInternetConnectivity();
      if (networkConnectionResponse == true) {
        var authUserResponse =
            await registerAuthUser(email: email, password: password);
        if (authUserResponse!.toLowerCase() == 'success') {
          var addUserResponse = await addUser(
              fullName: fullName,
              category: category,
              isItAPatient: isItAPatient,
              email: email);
          if (addUserResponse == true) {
            var addPatientResponse =
                await addPatient(accessCode: '', email: email);
            if (addPatientResponse == true) {
              registerResponseModel = const RegisterResponseModel(
                  message: 'Success registration!', status: true);
            } else {
              registerResponseModel = const RegisterResponseModel(
                  message: 'Operation failed!', status: false);
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

  Future<bool?> addUser({
    required String fullName,
    required String category,
    required bool isItAPatient,
    required String email,
  }) async {
    try {
      CollectionReference users = FirebaseFirestore.instance.collection('user');
      await users.doc(email).set({
        'email': email,
        'fullName': fullName,
        'isItAPatient': isItAPatient,
        'category': category
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool?> addPatient({
    required String accessCode,
    required String email,
  }) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('patient');
      await users.doc(email).set({'email': email, 'accessCode': accessCode});
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Map?> getUser({
    required String email,
  }) async {
    try {
      CollectionReference users = FirebaseFirestore.instance.collection('user');
      var snapshot = await users.doc(email).get();
      final data = snapshot.data() as Map<String, dynamic>;
      return data;
    } catch (e) {
      return {};
    }
  }

  Future<bool?> checkInternetConnectivity() async {
    bool? isThereConnection;
    try {
      isThereConnection = await connection.isInternetEnabled();
      debugPrint(isThereConnection.toString());
    } catch (e) {
      debugPrint(e.toString());
      isThereConnection = false;
    }

    return isThereConnection;
  }
}
