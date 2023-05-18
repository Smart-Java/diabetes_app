import 'package:diabetes_care/localStorage/sharedPreferences/app_shared_preferences.dart';
import 'package:diabetes_care/pages/patientPage/homePage/bloc/event/home_page_event.dart';
import 'package:diabetes_care/pages/patientPage/homePage/bloc/state/home_page_state.dart';
import 'package:diabetes_care/pages/patientPage/homePage/service/home_page_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final AppSharedPreferences appSharedPreferences;
  final HomePageService homePageService;

  String fullname = '';
  double lastGlucoseLevelReading = 0.0;
  double lastTwoWeeksAvgGlucoseReading = 0.0;
  double lastTwoWeeksLowGlucoseReading = 0.0;
  double lastTwoWeeksHighGlucoseReading = 0.0;
  List readingsDataList = [];
  String lastGlucoseRating = '';
  bool isUserAuth = false;
  String lastGlucoseRecordTime = '';

  HomePageBloc(
    this.appSharedPreferences,
    this.homePageService,
  ) : super(const HomePageState()) {
    on<AddGlucoseReadingHomePageEvent>((event, emit) async {
      if (event.description.isNotEmpty &&
          event.glucoseValue != 0.0 &&
          event.time.isNotEmpty) {
        emit(state.copyWith(
          isAddRequestInProgress: true,
        ));

        var addNewGlucoseReadingRequestResponse =
            await homePageService.addNewGlucoseReadingRequest(
          description: event.description,
          glucoseValue: event.glucoseValue,
          rating: 'Normal',
          time: event.time,
        );

        emit(state.copyWith(
          isAddRequestInProgress: false,
          isAddRequestSuccessful: addNewGlucoseReadingRequestResponse!.status,
          requestMessage: addNewGlucoseReadingRequestResponse.message,
        ));
      } else {
        emit(state.copyWith(
          isAddRequestInProgress: false,
          isAddRequestSuccessful: false,
          requestMessage: 'All fields are required',
        ));
      }
    });
    on<GetUserFullnameHomePageEvent>((event, emit) async {
      var fullnameRequestResponse =
          await homePageService.getUserFullnameRequest();
      if (fullnameRequestResponse!.status == true) {
        var data = fullnameRequestResponse.data!;
        fullname = data['fullname'];

        isUserAuth = true;

        emit(state.copyWith(
          userFullname: fullname,
          isUserAuth: isUserAuth,
        ));
      } else {
        emit(state.copyWith(
          isUserAuth: isUserAuth,
        ));
      }
    });
    on<GetLastReadingHomePageEvent>((event, emit) async {
      if (event.isItForUpdate == false) {
        emit(state.copyWith(
          userFullname: fullname,
          isLastReadingRequestInProgress: true,
        ));
      }

      String email = await appSharedPreferences.readAuthEmailAddress();
      var readingRequestResponse =
          await homePageService.glucoseReadingRequest();
      if (readingRequestResponse!.status == true) {
        var data = readingRequestResponse.data!;
        List glucoseList = data['glucoseList'] ?? [];

        for (var glucoseListElement in glucoseList) {
          if (glucoseListElement['email'] == email) {
            List userGlucoseReading = glucoseListElement['readings'] ?? [];

            readingsDataList = userGlucoseReading;
            if (userGlucoseReading.isNotEmpty) {
              int lengthOfTheReading = userGlucoseReading.length;
              var lastGlucoseReading =
                  userGlucoseReading[lengthOfTheReading - 1];
              lastGlucoseLevelReading = lastGlucoseReading['glucoseValue'];
              lastGlucoseRating = lastGlucoseReading['rating'];
              lastGlucoseRecordTime = lastGlucoseReading['time'];
            }
          }
        }
        emit(state.copyWith(
          userFullname: fullname,
          isLastReadingRequestInProgress: false,
          isUserAuth: isUserAuth,
          lastGlucoseRating: lastGlucoseRating,
          lastGlucoseLevel: lastGlucoseLevelReading.toString(),
          lastTwoWeeksAvgGlucoseLevel: lastTwoWeeksAvgGlucoseReading,
          lastTwoWeeksLowGlucoseLevel: lastTwoWeeksLowGlucoseReading,
          lastTwoWeeksHighGlucoseLevel: lastTwoWeeksHighGlucoseReading,
          readingsDataList: readingsDataList,
          lastGlucoseTime: lastGlucoseRecordTime,
        ));
      } else {
        emit(state.copyWith(
          userFullname: fullname,
          requestMessage: readingRequestResponse.message,
          isLastReadingRequestInProgress: false,
          isUserAuth: isUserAuth,
          lastGlucoseRating: lastGlucoseRating,
          lastGlucoseLevel: lastGlucoseLevelReading.toString(),
          lastTwoWeeksAvgGlucoseLevel: lastTwoWeeksAvgGlucoseReading,
          lastTwoWeeksLowGlucoseLevel: lastTwoWeeksLowGlucoseReading,
          lastTwoWeeksHighGlucoseLevel: lastTwoWeeksHighGlucoseReading,
          readingsDataList: readingsDataList,
          lastGlucoseTime: lastGlucoseRecordTime,
        ));
      }
    });
    on<GetLastTwoWeeksReadingHomePageEvent>((event, emit) async {
      if (event.isItForUpdate == false) {
        emit(state.copyWith(
          userFullname: fullname,
          isLastTwoWeeksRequestInProgress: true,
        ));
      } else {
        debugPrint('test');
      }

      String email = await appSharedPreferences.readAuthEmailAddress();
      var lastTwoWeeksRequestResponse =
          await homePageService.glucoseReadingRequest();
      if (lastTwoWeeksRequestResponse!.status == true) {
        var data = lastTwoWeeksRequestResponse.data!;
        DateTime lastTwoWeeksDate = DateTime.parse(getFormattedDateString());
        List glucoseList = data['glucoseList'] ?? [];

        for (var glucoseListElement in glucoseList) {
          if (glucoseListElement['email'] == email) {
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
            userFullname: fullname,
            isLastTwoWeeksRequestInProgress: false,
            isUserAuth: isUserAuth,
            lastGlucoseRating: lastGlucoseRating,
            lastGlucoseLevel: lastGlucoseLevelReading.toString(),
            lastTwoWeeksAvgGlucoseLevel: lastTwoWeeksAvgGlucoseReading,
            lastTwoWeeksLowGlucoseLevel: lastTwoWeeksLowGlucoseReading,
            lastTwoWeeksHighGlucoseLevel: lastTwoWeeksHighGlucoseReading,
            readingsDataList: readingsDataList,
            lastGlucoseTime: lastGlucoseRecordTime,
          ),
        );
      } else {
        emit(
          state.copyWith(
            userFullname: fullname,
            isLastTwoWeeksRequestInProgress: false,
            requestMessage: lastTwoWeeksRequestResponse.message,
            isUserAuth: isUserAuth,
            lastGlucoseRating: lastGlucoseRating,
            lastGlucoseLevel: lastGlucoseLevelReading.toString(),
            lastTwoWeeksAvgGlucoseLevel: lastTwoWeeksAvgGlucoseReading,
            lastTwoWeeksLowGlucoseLevel: lastTwoWeeksLowGlucoseReading,
            lastTwoWeeksHighGlucoseLevel: lastTwoWeeksHighGlucoseReading,
            readingsDataList: readingsDataList,
            lastGlucoseTime: lastGlucoseRecordTime,
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
