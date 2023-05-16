import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diabetes_care/connectivityManager/connection_interface/connection.dart';
import 'package:diabetes_care/localStorage/sharedPreferences/app_shared_preferences.dart';
import 'package:diabetes_care/pages/patientPage/recordPage/model/getRecordResponseModel/get_record_response_model.dart';
import 'package:diabetes_care/pages/patientPage/recordPage/model/updateRecordResponseModel/update_record_response_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class RecordPageService {
  Connection connection;
  AppSharedPreferences appSharedPreferences;
  RecordPageService({
    required this.connection,
    required this.appSharedPreferences,
  });

  Future<UpdateRecordResponseModel?> updateRecordRequest({
    required String cholesterolLevel,
    required String medications,
    required String weight,
    required String height,
    required String physicalActivities,
    required String insulinUsage,
  }) async {
    UpdateRecordResponseModel responseModel;
    try {
      var checkInternetConnection = await connection.isInternetEnabled();
      if (checkInternetConnection == true) {
        var addReminderResponse = await updateRecord(
          cholesterolLevel: cholesterolLevel,
          medications: medications,
          weight: weight,
          height: height,
          physicalActivities: physicalActivities,
          insulinUsage: insulinUsage,
        );
        if (addReminderResponse == true) {
          responseModel = const UpdateRecordResponseModel(
            message: 'Record update successfully!',
            status: true,
          );
        } else {
          responseModel = const UpdateRecordResponseModel(
            message: 'Operation failed!',
            status: false,
          );
        }
      } else {
        responseModel = const UpdateRecordResponseModel(
            message: 'Check internet connection', status: false);
      }
    } catch (e) {
      responseModel =
          UpdateRecordResponseModel(message: e.toString(), status: false);
    }

    return responseModel;
  }

  Future<GetRecordResponseModel?> getPatientsRecordRequest() async {
    GetRecordResponseModel responseModel;
    try {
      var checkInternetConnection = await connection.isInternetEnabled();
      if (checkInternetConnection == true) {
        var reminderData = await getRecords();
        if (reminderData!.isNotEmpty) {
          responseModel = GetRecordResponseModel(
            message: 'Records retrieve successfully!',
            status: true,
            data: reminderData,
          );
        } else {
          responseModel = const GetRecordResponseModel(
            message: 'Operation failed!',
            status: false,
          );
        }
      } else {
        responseModel = const GetRecordResponseModel(
            message: 'Check internet connection', status: false);
      }
    } catch (e) {
      responseModel =
          GetRecordResponseModel(message: e.toString(), status: false);
    }

    return responseModel;
  }

  Future<bool?> updateRecord({
    required String cholesterolLevel,
    required String medications,
    required String weight,
    required String height,
    required String physicalActivities,
    required String insulinUsage,
  }) async {
    try {
      String email = await appSharedPreferences.readAuthEmailAddress();
      CollectionReference records =
          FirebaseFirestore.instance.collection('recordCollections');
      var recordsSnapshot = await records.doc('medicalRecords').get();
      final recordsRecordData = recordsSnapshot.data() as Map<String, dynamic>;
      if (recordsRecordData.isNotEmpty) {
        List recordsList = recordsRecordData['records'];
        int elementIndex = 0;
        for (var recordsListElement in recordsList) {
          if (recordsListElement['email'] == email) {
            elementIndex = recordsList.indexOf(recordsListElement);

            recordsList[elementIndex] = {
              'records': [
                {
                  'email': email,
                  'records': {
                    'cholesterolLevel': cholesterolLevel,
                    'medications': medications,
                    'weight': weight,
                    'height': height,
                    'physicalActivities': physicalActivities,
                    'insulinUsage': insulinUsage,
                  }
                }
              ],
            };
          }

          await records.doc('medicalRecords').set({
            'recordsList': recordsList,
          });
        }
      } else {
        await records.doc('medicalRecords').set({
          'records': [
            {
              'email': email,
              'records': {
                'cholesterolLevel': cholesterolLevel,
                'medications': medications,
                'weight': weight,
                'height': height,
                'physicalActivities': physicalActivities,
                'insulinUsage': insulinUsage,
              }
            }
          ],
        });
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Map?> getRecords() async {
    try {
      String email = await appSharedPreferences.readAuthEmailAddress();
      CollectionReference records =
          FirebaseFirestore.instance.collection('recordCollections');
      await records.doc('medicalRecords').set({
        'records': [
          {
            'email': email,
            'records': {
              'cholesterolLevel': '10',
              'medications': '10',
              'weight': '40',
              'height': '10',
              'physicalActivities': '10',
              'insulinUsage': '10',
            }
          }
        ],
      });
      var snapshot = await records.doc('medicalRecords').get();
      final data = snapshot.data() as Map<String, dynamic>;
      return data;
    } catch (e) {
      return {};
    }
  }
}
