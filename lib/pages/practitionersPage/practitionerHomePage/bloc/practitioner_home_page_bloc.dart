import 'package:diabetes_care/localStorage/sharedPreferences/app_shared_preferences.dart';
import 'package:diabetes_care/pages/practitionersPage/practitionerHomePage/bloc/event/practitioner_home_page_event.dart';
import 'package:diabetes_care/pages/practitionersPage/practitionerHomePage/bloc/state/practitoner_home_page_state.dart';
import 'package:diabetes_care/util/pracPatientService/service/practitioner_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class PractitionerHomePageBloc
    extends Bloc<PractitionerHomePageEvent, PractitionerHomePageState> {
  final AppSharedPreferences appSharedPreferences;
  final PractitionerService practitionerService;

  List praPatientsList = [];

  bool isPraAuth = false;

  String praFullName = '';

  PractitionerHomePageBloc(this.practitionerService, this.appSharedPreferences)
      : super(const PractitionerHomePageState()) {
    on<GetUserFullnameHomePageEvent>((event, emit) async {
      String fullnameRequestResponse =
          await appSharedPreferences.readUserFullname();
      isPraAuth = fullnameRequestResponse.isNotEmpty ? true : false;
      praFullName = fullnameRequestResponse;
      emit(state.copyWith(
        practitonerFullname: praFullName,
        isUserAuth: isPraAuth,
      ));
    });
    on<GetPraPatientsHomePageEvent>((event, emit) async {
      if (event.isItForUpdate == false) {
        emit(state.copyWith(
          isLoading: true,
          practitonerFullname: praFullName,
          isUserAuth: isPraAuth,
        ));
      }

      var praPatientsRequestResponse =
          await practitionerService.getPraPatientsRequest();
      praPatientsList = praPatientsRequestResponse!.data ?? [];
      emit(state.copyWith(
        isLoading: false,
        patientDataList: praPatientsList,
        practitonerFullname: praFullName,
        isUserAuth: isPraAuth,
        requestMessage: praPatientsRequestResponse.message,
      ));
    });
    on<AddScheduleHomePageEvent>((event, emit) async {
      if (event.patientEmail.isNotEmpty &&
          event.scheduleDate.isNotEmpty &&
          event.scheduleTime.isNotEmpty) {
        emit(state.copyWith(
          isScheduleRequestInProgress: true,
          practitonerFullname: praFullName,
          isUserAuth: isPraAuth,
          patientDataList: praPatientsList,
        ));

        var patientsScheduleRequestResponse =
            await practitionerService.addNewScheduleRequest(
          patientEmail: event.patientEmail,
          scheduleTime: event.scheduleTime,
          scheduleDate: event.scheduleDate,
          patientName: event.patientName,
        );
        emit(state.copyWith(
          isLoading: false,
          isScheduleRequestInProgress: false,
          isScheduleRequestSuccessful: patientsScheduleRequestResponse!.status,
          practitonerFullname: praFullName,
          isUserAuth: isPraAuth,
          patientDataList: praPatientsList,
          requestMessage: patientsScheduleRequestResponse.message,
        ));
      }
    });
  }
}
