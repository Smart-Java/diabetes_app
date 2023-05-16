import 'package:diabetes_care/connectivityManager/connection_interface/connection.dart';
import 'package:diabetes_care/localStorage/sharedPreferences/app_shared_preferences.dart';
import 'package:diabetes_care/pages/profilePage/model/newAccessCodeResponseModel/new_access_code_response_model.dart';
import 'package:diabetes_care/pages/profilePage/model/profileDetailsResponseModel/profile_details_response_model.dart';
import 'package:diabetes_care/util/allUsersService/service/all_users_service.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

@injectable
class ProfilePageService {
  Connection connection;
  AppSharedPreferences appSharedPreferences;
  AllUsersService allUsersService;
  ProfilePageService(
    this.connection,
    this.appSharedPreferences,
    this.allUsersService,
  );

  Future<ProfileDetailsResponseModel?> getProfileDetailsRequest() async {
    ProfileDetailsResponseModel responseModel;
    String fullname = await appSharedPreferences.readUserFullname() ?? '';
    String email = await appSharedPreferences.readAuthEmailAddress() ?? '';
    String accessCode = await appSharedPreferences.readUserAccessCode() ?? '';
    Map data = {
      'fullname': fullname,
      'email': email,
      'accessCode': accessCode,
    };
    responseModel = ProfileDetailsResponseModel(
      data: data,
      message: 'Success',
      status: data.isNotEmpty ? true : false,
    );
    return responseModel;
  }

  Future<NewAccessCodeResponseModel?> newAccessCodeRequest() async {
    NewAccessCodeResponseModel responseModel;
    try {
      bool checkInternetConnection = await connection.isInternetEnabled();
      if (checkInternetConnection == true) {
        var updateAccessCodeResponse = await updatePatientAccessCode();
        if (updateAccessCodeResponse != null && updateAccessCodeResponse.isNotEmpty) {
          responseModel = NewAccessCodeResponseModel(
            data: updateAccessCodeResponse,
            message: 'Success',
            status: true,
          );
        } else {
          responseModel = NewAccessCodeResponseModel(
            data: updateAccessCodeResponse,
            message: 'Operation failed!',
            status: false,
          );
        }
      } else {
        responseModel = const NewAccessCodeResponseModel(
          message: 'Check internet connection',
          data: {},
          status: false,
        );
      }
    } catch (e) {
      responseModel = const NewAccessCodeResponseModel(
        message: 'Operation failed!',
        data: {},
        status: false,
      );
    }
    return responseModel;
  }

  Future<String> generateNewCode() async {
    const uuid = Uuid();
    return uuid.v1();
  }

  Future<Map?> updatePatientAccessCode() async {
    try {
      Map data = {};
      String email = await appSharedPreferences.readAuthEmailAddress();
      String newAccessCode = await generateNewCode();
      var updatePatientRecord = await allUsersService.addUpdatePatient(
          accessCode: newAccessCode, email: email);
      if (updatePatientRecord == true) {
        data = {'accessCode': newAccessCode};
        await appSharedPreferences.cachePatientAccessCode(newAccessCode);
      } else {
        data = {};
      }
      return data;
    } catch (e) {
      return {};
    }
  }
}
