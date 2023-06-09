import 'package:diabetes_care/localStorage/sharedPreferences/app_shared_preferences.dart';
import 'package:diabetes_care/pages/patientPage/homePage/service/home_page_service.dart';
import 'package:diabetes_care/pages/practitionersPage/patientsDetailsPage/bloc/event/patients_details_page_event.dart';
import 'package:diabetes_care/pages/practitionersPage/patientsDetailsPage/bloc/state/patients_details_page_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class PatientsDetailsPageBloc
    extends Bloc<PatientsDetailsPageEvent, PatientsDetailsPageState> {
  final AppSharedPreferences appSharedPreferences;
  final HomePageService homePageService;

  double lastTwoWeeksAvgGlucoseReading = 0.0;
  double lastTwoWeeksLowGlucoseReading = 0.0;
  double lastTwoWeeksHighGlucoseReading = 0.0;
  List readingsDataList = [];
  bool isUserAuth = false;

  String fullname = '';

  PatientsDetailsPageBloc(
    this.appSharedPreferences,
    this.homePageService,
  ) : super(const PatientsDetailsPageState()) {
    on<GetPractitionerFullnameDetailsPageEvent>((event, emit) async {
      var fullnameRequestResponse =
          await appSharedPreferences.readUserFullname();
      debugPrint('name is this $fullnameRequestResponse');
      fullname = fullnameRequestResponse;
      emit(state.copyWith(
        partitionerName: fullname,
      ));
    });
    on<GetGlucoseReadingPatientsDetailsPageEvent>((event, emit) async {
      if (event.isItForUpdate == false) {
        emit(state.copyWith(
          isReadingRequestInProgress: true,
          partitionerName: fullname,
        ));
      }

      var readingRequestResponse =
          await homePageService.glucoseReadingRequest();
      if (readingRequestResponse!.status == true) {
        var data = readingRequestResponse.data!;
        List glucoseList = data['glucoseList'] ?? [];

        for (var glucoseListElement in glucoseList) {
          if (glucoseListElement['email'] == event.patientEmail) {
            List userGlucoseReading = glucoseListElement['readings'] ?? [];

            readingsDataList = userGlucoseReading;
            emit(state.copyWith(
              isReadingRequestInProgress: false,
              lastTwoWeeksAvgGlucoseLevel: lastTwoWeeksAvgGlucoseReading,
              lastTwoWeeksLowGlucoseLevel: lastTwoWeeksLowGlucoseReading,
              lastTwoWeeksHighGlucoseLevel: lastTwoWeeksHighGlucoseReading,
              readingsDataList: readingsDataList,
              partitionerName: fullname,
            ));
          }
        }
      } else {
        emit(state.copyWith(
          partitionerName: fullname,
          isReadingRequestInProgress: false,
          lastTwoWeeksAvgGlucoseLevel: lastTwoWeeksAvgGlucoseReading,
          lastTwoWeeksLowGlucoseLevel: lastTwoWeeksLowGlucoseReading,
          lastTwoWeeksHighGlucoseLevel: lastTwoWeeksHighGlucoseReading,
          readingsDataList: readingsDataList,
        ));
      }
    });
    on<GetLastTwoWeeksReadingPatientsDetailsPageEvent>((event, emit) async {
      if (event.isItForUpdate == false) {
        emit(state.copyWith(
          partitionerName: fullname,
          isLastTwoWeeksRequestInProgress: true,
        ));
      }

      var lastTwoWeeksRequestResponse =
          await homePageService.glucoseReadingRequest();
      if (lastTwoWeeksRequestResponse!.status == true) {
        var data = lastTwoWeeksRequestResponse.data!;
        DateTime lastTwoWeeksDate = DateTime.parse(getFormattedDateString());
        List glucoseList = data['glucoseList'] ?? [];

        for (var glucoseListElement in glucoseList) {
          if (glucoseListElement['email'] == event.patientEmail) {
            List userGlucoseReading = glucoseListElement['readings'] ?? [];
            readingsDataList = userGlucoseReading;

            List pastTwoWeeksData = [];
            double totalGlucoseLevel = 0.0;
            double oldHighGlucoseLevel = 0.0;
            double oldLowGlucoseLevel = 0.0;
            if (readingsDataList.isNotEmpty) {
              for (var element in readingsDataList) {
                var date = element['date'];
                DateTime actualDate = DateTime.parse(date);
                if (lastTwoWeeksDate.isBefore(actualDate) == true) {
                  pastTwoWeeksData.add(element);
                }
              }
              if (pastTwoWeeksData.isNotEmpty) {
                for (var pastTwoWeeksDataElement in pastTwoWeeksData) {
                  var glucoseLevel = pastTwoWeeksDataElement['glucoseValue'];
                  if (glucoseLevel is String) {
                    glucoseLevel = double.parse(glucoseLevel);
                  } else if (glucoseLevel is int) {
                    glucoseLevel = glucoseLevel.toDouble();
                  }
                  totalGlucoseLevel += glucoseLevel;
                  if (glucoseLevel > oldHighGlucoseLevel) {
                    oldHighGlucoseLevel = glucoseLevel;
                  } else {
                    oldLowGlucoseLevel = glucoseLevel;
                  }
                }
                int lengthOfPastTwoWeeksData = pastTwoWeeksData.length;
                lastTwoWeeksAvgGlucoseReading =
                    totalGlucoseLevel / lengthOfPastTwoWeeksData;
                lastTwoWeeksHighGlucoseReading = oldHighGlucoseLevel;
                lastTwoWeeksLowGlucoseReading = oldLowGlucoseLevel;
              }
            }
          }
        }
        emit(
          state.copyWith(
            partitionerName: fullname,
            isLastTwoWeeksRequestInProgress: false,
            lastTwoWeeksAvgGlucoseLevel: lastTwoWeeksAvgGlucoseReading,
            lastTwoWeeksLowGlucoseLevel: lastTwoWeeksLowGlucoseReading,
            lastTwoWeeksHighGlucoseLevel: lastTwoWeeksHighGlucoseReading,
            readingsDataList: readingsDataList,
          ),
        );
      } else {
        emit(
          state.copyWith(
            partitionerName: fullname,
            isLastTwoWeeksRequestInProgress: false,
            lastTwoWeeksAvgGlucoseLevel: lastTwoWeeksAvgGlucoseReading,
            lastTwoWeeksLowGlucoseLevel: lastTwoWeeksLowGlucoseReading,
            lastTwoWeeksHighGlucoseLevel: lastTwoWeeksHighGlucoseReading,
            readingsDataList: readingsDataList,
          ),
        );
      }
    });
  }

  Map getDateValues() {
    DateTime currentDate = DateTime.now();
    Map dateValues = {};
    int lastTwoWeeks = 14;
    int lastTwoWeeksDay = 0;
    int lastTwoWeeksMonth = 0;
    int lastTwoWeeksYear = 0;
    if (currentDate.day > 14) {
      lastTwoWeeksDay = currentDate.day - lastTwoWeeks;
      lastTwoWeeksMonth = currentDate.month;
      lastTwoWeeksYear = currentDate.year;
    } else {
      lastTwoWeeksMonth = currentDate.month - 1;
      lastTwoWeeksYear = currentDate.year;
      if (lastTwoWeeksMonth == 2) {
        lastTwoWeeksDay = (28 - lastTwoWeeks) + currentDate.day;
      } else if (lastTwoWeeksMonth == 1 ||
          lastTwoWeeksMonth == 8 ||
          lastTwoWeeksMonth == 10 ||
          lastTwoWeeksMonth == 12 ||
          lastTwoWeeksMonth == 3) {
        lastTwoWeeksDay = (31 - lastTwoWeeks) + currentDate.day;
      } else if (lastTwoWeeksMonth == 4 ||
          lastTwoWeeksMonth == 5 ||
          lastTwoWeeksMonth == 7 ||
          lastTwoWeeksMonth == 10 ||
          lastTwoWeeksMonth == 9 ||
          lastTwoWeeksMonth == 11) {
        lastTwoWeeksDay = (30 - lastTwoWeeks) + currentDate.day;
      }
    }

    dateValues = {
      'day': lastTwoWeeksDay,
      'month': lastTwoWeeksMonth,
      'year': lastTwoWeeksYear
    };

    return dateValues;
  }

  String getFormattedDateString() {
    Map dateData = getDateValues();
    String monthValue = '';
    String dayValue = '';
    if (dateData['month'].toString().length > 1) {
      monthValue = '${dateData['month']}';
    } else {
      monthValue = '0${dateData['month']}';
    }

    if (dateData['day'].toString().length > 1) {
      dayValue = '${dateData['day']}';
    } else {
      dayValue = '0${dateData['day']}';
    }
    return '${dateData['year']}-$monthValue-$dayValue';
  }
}
