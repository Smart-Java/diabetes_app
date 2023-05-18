import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diabetes_care/connectivityManager/connection_interface/connection.dart';
import 'package:diabetes_care/localStorage/sharedPreferences/app_shared_preferences.dart';
import 'package:diabetes_care/pages/patientPage/homePage/model/addGlucoseResponseModel/add_glucose_response_model.dart';
import 'package:diabetes_care/pages/patientPage/homePage/model/fullnameResponseModel/fullname_response_model.dart';
import 'package:diabetes_care/pages/patientPage/homePage/model/readingResponseModel/reading_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomePageService {
  Connection connection;
  AppSharedPreferences appSharedPreferences;
  HomePageService(this.connection, this.appSharedPreferences);

  Future<FullnameResponseModel?> getUserFullnameRequest() async {
    FullnameResponseModel fullnameResponseModel;
    String fullname = await appSharedPreferences.readUserFullname() ?? '';
    Map data = {
      'fullname': fullname,
    };
    fullnameResponseModel = FullnameResponseModel(
      data: data,
      message: 'Success',
      status: fullname.isNotEmpty ? true : false,
    );
    return fullnameResponseModel;
  }

  Future<ReadingResponseModel?> glucoseReadingRequest() async {
    ReadingResponseModel readingResponseModel;
    // String email = await appSharedPreferences.readAuthEmailAddress();
    try {
      bool checkInternetConnection = await connection.isInternetEnabled();
      if (checkInternetConnection == true) {
        var readingResponse = await getTheReadings();
        if (readingResponse != null && readingResponse.isNotEmpty) {
          readingResponseModel = ReadingResponseModel(
            data: readingResponse,
            message: 'Success',
            status: true,
          );
        } else {
          readingResponseModel = ReadingResponseModel(
            data: readingResponse,
            message: 'Operation failed!',
            status: false,
          );
        }
      } else {
        readingResponseModel = const ReadingResponseModel(
          message: 'Check internet connection',
          data: {},
          status: false,
        );
      }
    } catch (e) {
      readingResponseModel = const ReadingResponseModel(
        message: 'Operation failed!',
        data: {},
        status: false,
      );
    }
    return readingResponseModel;
  }

  Future<AddGlucoseResponseModel?> addNewGlucoseReadingRequest({
    required double glucoseValue,
    required String description,
    required String rating,
    required String time,
  }) async {
    AddGlucoseResponseModel responseModel;
    try {
      var checkInternetConnection = await connection.isInternetEnabled();
      if (checkInternetConnection == true) {
        var addGlAddGlucoseResponseModellucoseReadingResponse =
            await addNewGlucoseReadings(
          description: description,
          glucoseValue: glucoseValue,
          rating: rating,
          time: time,
        );
        if (addGlAddGlucoseResponseModellucoseReadingResponse == true) {
          responseModel = const AddGlucoseResponseModel(
            message: 'Glucose value added successfully!',
            status: true,
          );
        } else {
          responseModel = const AddGlucoseResponseModel(
            message: 'Operation failed!',
            status: false,
          );
        }
      } else {
        responseModel = const AddGlucoseResponseModel(
            message: 'Check internet connection', status: false);
      }
    } catch (e) {
      responseModel =
          AddGlucoseResponseModel(message: e.toString(), status: false);
    }
    return responseModel;
  }

  Future<Map?> getTheReadings() async {
    try {
      // await addNewGlucoseReadings(email: email);

      CollectionReference readings =
          FirebaseFirestore.instance.collection('glucoseCollections');
      var snapshot = await readings.doc('glucoseRecords').get();
      final data = snapshot.data() as Map<String, dynamic>;
      debugPrint('From glucose readings $data');
      return data;
    } catch (e) {
      debugPrint('No glucose reading yet');
      return {};
    }
  }

  Future<bool?> addNewGlucoseReadings({
    required double glucoseValue,
    required String description,
    required String rating,
    required String time,
  }) async {
    try {
      String email = await appSharedPreferences.readAuthEmailAddress();
      CollectionReference getAllReadings =
          FirebaseFirestore.instance.collection('glucoseCollections');
      var snapshot = await getAllReadings.doc('glucoseRecords').get();
      final data = snapshot.data() as Map<String, dynamic>;

      CollectionReference addNewReading =
          FirebaseFirestore.instance.collection('glucoseCollections');

      if (data.isNotEmpty) {
        List glucoseList = data['glucoseList'];
        for (var element in glucoseList) {
          if (element['email'] == email) {
            List readingDataList = element['readings'];
            readingDataList.add({
              'glucoseValue': glucoseValue,
              'rating': rating,
              'description': description,
              'date': DateTime.now().toIso8601String(),
              'time': time,
            });

            await addNewReading.doc('glucoseRecords').set({
              'glucoseList': [
                {'email': email, 'readings': readingDataList},
              ]
            });
          }
        }
      } else {
        await addNewReading.doc('glucoseRecords').set({
          'glucoseList': [
            {
              'email': email,
              'readings': [
                {
                  'glucoseValue': glucoseValue,
                  'rating': rating,
                  'description': description,
                  'date': DateTime.now().toIso8601String(),
                  'time': time,
                }
              ]
            }
          ]
        });
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
