import 'package:diabetes_care/pages/profilePage/bloc/event/profile_page_event.dart';
import 'package:diabetes_care/pages/profilePage/bloc/state/profile_page_state.dart';
import 'package:diabetes_care/pages/profilePage/service/profile_page_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfilePageBloc extends Bloc<ProfilePageEvent, ProfilePageState> {
  final ProfilePageService profilePageService;

  String accessCode = '';
  String email = '';
  String fullname = '';

  ProfilePageBloc(this.profilePageService) : super(const ProfilePageState()) {
    on<GetProfileDetailsProfilePageEvent>((event, emit) async {
      var profileDetailsResponse =
          await profilePageService.getProfileDetailsRequest();
      if (profileDetailsResponse!.status == true) {
        var data = profileDetailsResponse.data!;
        accessCode = data['accessCode'];
        email = data['email'];
        fullname = data['fullname'];
        emit(state.copyWith(
          accessCode: accessCode,
          email: email,
          name: fullname,
        ));
      }
    });
    on<RequestNewAccessCodeProfilePageEvent>((event, emit) async {
      emit(state.copyWith(
        accessCode: accessCode,
        email: email,
        name: fullname,
        isNewAccessCodeRequestCodeInProgress: true,
      ));
      var accessCodeRequestResponse =
          await profilePageService.newAccessCodeRequest();
      if (accessCodeRequestResponse!.status == true) {
        var data = accessCodeRequestResponse.data!;
        accessCode = data['accessCode'];
      }

      emit(state.copyWith(
        accessCode: accessCode,
        email: email,
        name: fullname,
        isNewAccessCodeRequestCodeInProgress: false,
        isNewAccessCodeRequestCodeSuccessful: accessCodeRequestResponse.status,
      ));
    });
  }
}
