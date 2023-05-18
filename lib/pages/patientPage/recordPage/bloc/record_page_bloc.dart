import 'package:diabetes_care/localStorage/sharedPreferences/app_shared_preferences.dart';
import 'package:diabetes_care/pages/patientPage/recordPage/bloc/event/record_page_event.dart';
import 'package:diabetes_care/pages/patientPage/recordPage/bloc/state/record_page_state.dart';
import 'package:diabetes_care/pages/patientPage/recordPage/service/record_page_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RecordPageBloc extends Bloc<RecordPageEvent, RecordPageState> {
  final AppSharedPreferences appSharedPreferences;
  final RecordPageService recordPageService;

  Map recordDataList = {};

  RecordPageBloc(this.recordPageService, this.appSharedPreferences)
      : super(const RecordPageState()) {
    on<UpdateRecordRecordPageEvent>((event, emit) async {
      if (event.cholesterolLevel.isNotEmpty &&
          event.height.isNotEmpty &&
          event.medications.isNotEmpty &&
          event.weight.isNotEmpty &&
          event.insulinUsage.isNotEmpty &&
          event.physicalActivities.isNotEmpty) {
        emit(state.copyWith(
          isUpdateRequestInProgress: true,
        ));

        var updateRecordRequestResponse =
            await recordPageService.updateRecordRequest(
          cholesterolLevel: event.cholesterolLevel,
          medications: event.medications,
          weight: event.weight,
          height: event.height,
          physicalActivities: event.physicalActivities,
          insulinUsage: event.insulinUsage,
        );

        emit(state.copyWith(
          isUpdateRequestInProgress: false,
          isUpdateRequestSuccessful: updateRecordRequestResponse!.status,
          requestMessage: updateRecordRequestResponse.message,
        ));
      } else {
        emit(state.copyWith(
          isUpdateRequestInProgress: false,
          isUpdateRequestSuccessful: false,
          requestMessage: 'All fields are required',
        ));
      }
    });
    on<GetAllRecordsRecordPageEvent>((event, emit) async {
      if (event.isItForUpdate == false) {
        emit(state.copyWith(
          isLoading: true,
        ));
      }

      String email = '';

      if (event.praPatientEmail != null && event.praPatientEmail!.isNotEmpty) {
        email = event.praPatientEmail!;
      } else {
        email = await appSharedPreferences.readAuthEmailAddress();
      }

      var recordsRequestResponse =
          await recordPageService.getPatientsRecordRequest();
      if (recordsRequestResponse!.status == true) {
        var data = recordsRequestResponse.data!;
        List records = data['records'] ?? [];
        debugPrint('patients $records 1');
        if (records.isNotEmpty) {
          for (var recordsElement in records) {
            if (recordsElement['email'] == email) {
              recordDataList = recordsElement['records'] ?? {};

              emit(state.copyWith(
                isLoading: false,
                isListReady: true,
                requestMessage: recordsRequestResponse.message,
                recordDataList: recordDataList,
              ));
            }
          }
        }
      } else {
        emit(state.copyWith(
          isLoading: false,
          isListReady: false,
          requestMessage: recordsRequestResponse.message,
          recordDataList: recordDataList,
        ));
      }
    });
  }
}
