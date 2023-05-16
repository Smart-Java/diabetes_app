import 'package:diabetes_care/pages/patientPage/careTeamPage/bloc/event/care_team_page_event.dart';
import 'package:diabetes_care/pages/patientPage/careTeamPage/bloc/state/care_team_page_state.dart';
import 'package:diabetes_care/util/allUsersService/service/all_users_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CareTeamPageBloc extends Bloc<CareTeamPageEvent, CareTeamPageState> {
  final AllUsersService allUsersService;

  List userDataList = [];

  CareTeamPageBloc(this.allUsersService) : super(const CareTeamPageState()) {
    on<GetAllCareTeamsCareTeamPageEvent>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
      ));
      var userRequestResponse = await allUsersService.getAllUserRequest();
      if (userRequestResponse!.status == true) {
        var data = userRequestResponse.data!;
        List userList = data['users'] ?? [];

        if (userList.isNotEmpty) {
          for (var userListElement in userList) {
            if (userListElement['isItAPatient'] == false) {
              userDataList.add(userListElement);
            }
          }
        }

        debugPrint(userDataList.toString());

        emit(state.copyWith(
          isLoading: false,
          isListReady: true,
          requestMessage: userRequestResponse.message,
          careTeamDataList: userDataList,
        ));
      } else {
        emit(state.copyWith(
          isLoading: false,
          isListReady: false,
          requestMessage: userRequestResponse.message,
          careTeamDataList: userDataList,
        ));
      }
    });
  }
}
