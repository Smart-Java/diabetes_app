import 'package:diabetes_care/localStorage/sharedPreferences/app_shared_preferences.dart';
import 'package:diabetes_care/pages/patientPage/dietPage/bloc/event/diet_page_event.dart';
import 'package:diabetes_care/pages/patientPage/dietPage/bloc/state/diet_page_state.dart';
import 'package:diabetes_care/util/dietService/service/diet_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class DietPageBloc extends Bloc<DietPageEvent, DietPageState> {
  final AppSharedPreferences appSharedPreferences;
  final DietService dietService;

  List dietDataList = [];

  DietPageBloc(this.dietService, this.appSharedPreferences)
      : super(const DietPageState()) {
    on<RequestForDietDietPageEvent>((event, emit) async {
      emit(state.copyWith(
        isDietRequestInProgress: true,
        dietDataList: dietDataList,
      ));
      var dietDateRequestResponse = await dietService.requestForDietRequest();
      emit(state.copyWith(
        isDietRequestInProgress: false,
        isDietRequestSuccessful: dietDateRequestResponse!.status,
        dietDataList: dietDataList,
        requestMessage: dietDateRequestResponse.message,
      ));
    });
    on<GetAllDietDietPageEvent>((event, emit) async {
      if (event.isItForUpdate == false) {
        emit(state.copyWith(
          isLoading: true,
        ));
      }

      String email = await appSharedPreferences.readAuthEmailAddress();
      var dietRequestResponse = await dietService.getDietRequest();
      if (dietRequestResponse!.status == true) {
        var data = dietRequestResponse.data!;
        List dataList = data['diets'] ?? [];
        if (dataList.isNotEmpty) {
          for (var dataListElement in dataList) {
            if (dataListElement['email'] == email) {
              dietDataList = dataListElement['diets'] ?? [];
            }
          }
        }

        emit(state.copyWith(
          isLoading: false,
          isListReady: true,
          requestMessage: dietRequestResponse.message,
          dietDataList: dietDataList,
        ));
      } else {
        emit(state.copyWith(
          isLoading: false,
          isListReady: false,
          requestMessage: dietRequestResponse.message,
          dietDataList: dietDataList,
        ));
      }
    });
  }
}
