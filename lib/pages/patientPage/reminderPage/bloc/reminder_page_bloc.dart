import 'package:diabetes_care/localStorage/sharedPreferences/app_shared_preferences.dart';
import 'package:diabetes_care/pages/patientPage/reminderPage/bloc/event/reminder_page_event.dart';
import 'package:diabetes_care/pages/patientPage/reminderPage/bloc/state/reminder_page_state.dart';
import 'package:diabetes_care/pages/patientPage/reminderPage/service/reminder_page_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ReminderPageBloc extends Bloc<ReminderPageEvent, ReminderPageState> {
  final ReminderPageService reminderPageService;
  final AppSharedPreferences appSharedPreferences;

  List reminderDataList = [];

  ReminderPageBloc(
    this.reminderPageService,
    this.appSharedPreferences,
  ) : super(const ReminderPageState()) {
    on<AddRemindersReminderPageEvent>((event, emit) async {
      if (event.date.isNotEmpty &&
          event.reminderMode.isNotEmpty &&
          event.time.isNotEmpty &&
          event.title.isNotEmpty) {
        emit(state.copyWith(
          isAddRequestInProgress: true,
        ));

        var addNewReminderRequestResponse =
            await reminderPageService.addNewReminderRequest(
          title: event.title,
          date: event.date,
          time: event.time,
          reminderMode: event.reminderMode,
        );

        emit(state.copyWith(
          isAddRequestInProgress: false,
          isAddRequestSuccessful: addNewReminderRequestResponse!.status,
          requestMessage: addNewReminderRequestResponse.message,
        ));
      } else {
        emit(state.copyWith(
          isAddRequestInProgress: false,
          isAddRequestSuccessful: false,
          requestMessage: 'All fields are required',
        ));
      }
    });
    on<GetAllRemindersReminderPageEvent>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
      ));
      String email = await appSharedPreferences.readAuthEmailAddress();
      var remindersRequestResponse =
          await reminderPageService.getPatientsRemindersRequest();
      if (remindersRequestResponse!.status == true) {
        var data = remindersRequestResponse.data!;
        List dataList = data['remindersList'] ?? [];
        if (dataList.isNotEmpty) {
          for (var dataListElement in dataList) {
            if (dataListElement['email'] == email) {
              debugPrint(dataListElement['element'].toString());
              reminderDataList = dataListElement['reminders'] ?? [];
            }
          }
        }

        emit(state.copyWith(
          isLoading: false,
          isListReady: true,
          requestMessage: remindersRequestResponse.message,
          reminderDataList: reminderDataList,
        ));
      } else {
        emit(state.copyWith(
          isLoading: false,
          isListReady: false,
          requestMessage: remindersRequestResponse.message,
          reminderDataList: reminderDataList,
        ));
      }
    });
  }
}
