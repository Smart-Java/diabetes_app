import 'package:diabetes_care/localStorage/sharedPreferences/app_shared_preferences.dart';
import 'package:diabetes_care/pages/practitionersPage/practitionerSchedulePage/bloc/event/practitioner_schedule_page_event.dart';
import 'package:diabetes_care/pages/practitionersPage/practitionerSchedulePage/bloc/state/practitoner_schedule_page_state.dart';
import 'package:diabetes_care/util/pracPatientService/service/practitioner_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class PractitionerSchedulePageBloc
    extends Bloc<PractitionerSchedulePageEvent, PractitionerSchedulePageState> {
  final AppSharedPreferences appSharedPreferences;
  final PractitionerService practitionerService;

  List praPatientsList = [];

  bool isPraAuth = false;

  PractitionerSchedulePageBloc(
      this.practitionerService, this.appSharedPreferences)
      : super(const PractitionerSchedulePageState()) {
    on<GetPraPatientsSchedulePageEvent>((event, emit) async {
      if (event.isItForUpdate == false) {
        emit(state.copyWith(
          isLoading: true,
        ));
      }
      String email = await appSharedPreferences.readAuthEmailAddress();
      var praSchedulesRequestResponse =
          await practitionerService.getSchedulesRequest();
      if (praSchedulesRequestResponse!.status == true) {
        Map data = praSchedulesRequestResponse.data ?? {};
        if (data.isNotEmpty) {
          List listData = data['scheduleList'] ?? [];
          if (listData.isNotEmpty) {
            for (var listDataElement in listData) {
              if (listDataElement['email'] == email) {
                praPatientsList = listDataElement['scheduleList'] ?? [];
              }
            }
          }
        }
      }
      emit(state.copyWith(
        isLoading: false,
        isUserAuth: isPraAuth,
        patientDataList: praPatientsList,
        requestMessage: praSchedulesRequestResponse.message,
      ));
    });
  }
}
