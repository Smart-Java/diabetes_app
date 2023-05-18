import 'package:diabetes_care/localStorage/sharedPreferences/app_shared_preferences.dart';
import 'package:diabetes_care/pages/practitionersPage/practitionerDietPage/bloc/event/practitioner_diet_page_event.dart';
import 'package:diabetes_care/pages/practitionersPage/practitionerDietPage/bloc/state/practitoner_diet_page_state.dart';
import 'package:diabetes_care/util/dietService/service/diet_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class PractitionerDietPageBloc
    extends Bloc<PractitionerDietPageEvent, PractitionerDietPageState> {
  final AppSharedPreferences appSharedPreferences;
  final DietService dietService;

  List dietDataList = [];

  PractitionerDietPageBloc(this.dietService, this.appSharedPreferences)
      : super(const PractitionerDietPageState()) {
    on<AddNewDietDietPageEvent>((event, emit) async {
      if (event.dietTitle.isNotEmpty &&
          event.dietDetails.isNotEmpty &&
          event.dietDate.isNotEmpty &&
          event.patientAccessCode.isNotEmpty) {
        emit(state.copyWith(
          isLoading: true,
        ));
        debugPrint(
            'from diet ${event.dietDetails} ${event.patientAccessCode} ${event.dietDetails} ${event.dietDate}');
        var newDietAddRequestResponse = await dietService.addDietRequest(
          title: event.dietTitle,
          date: event.dietDate,
          details: event.dietDetails,
          accessCode: event.patientAccessCode,
        );
        emit(state.copyWith(
          isLoading: false,
          requestMessage: newDietAddRequestResponse!.message,
        ));
      }
    });
  }
}
