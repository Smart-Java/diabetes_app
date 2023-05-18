// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../connectionClientModule/connection_client_module.dart' as _i30;
import '../connectivityManager/connection_interface/connection.dart' as _i8;
import '../connectivityManager/connectivity_manager.dart' as _i9;
import '../localStorage/flutterSecureStorage/app_flutter_secure_storage.dart'
    as _i3;
import '../localStorage/localDataUtil/failed_txn_local_data_util.dart' as _i6;
import '../localStorage/localDataUtil/users_local_data_util.dart' as _i7;
import '../localStorage/sharedPreferences/app_shared_preferences.dart' as _i4;
import '../pages/authenticationPage/bloc/authentication_page_bloc.dart' as _i17;
import '../pages/authenticationPage/service/auth_service.dart' as _i16;
import '../pages/patientPage/careTeamPage/bloc/care_team_page_bloc.dart'
    as _i27;
import '../pages/patientPage/careTeamPage/service/care_team_page_service.dart'
    as _i18;
import '../pages/patientPage/dietPage/bloc/diet_page_bloc.dart' as _i28;
import '../pages/patientPage/homePage/bloc/home_page_bloc.dart' as _i20;
import '../pages/patientPage/homePage/service/home_page_service.dart' as _i10;
import '../pages/patientPage/recordPage/bloc/record_page_bloc.dart' as _i25;
import '../pages/patientPage/recordPage/service/record_page_service.dart'
    as _i13;
import '../pages/patientPage/reminderPage/bloc/reminder_page_bloc.dart' as _i26;
import '../pages/patientPage/reminderPage/service/reminder_page_service.dart'
    as _i14;
import '../pages/practitionersPage/patientsDetailsPage/bloc/patients_details_page_bloc.dart'
    as _i11;
import '../pages/practitionersPage/practitionerDietPage/bloc/practitioner_diet_page_bloc.dart'
    as _i21;
import '../pages/practitionersPage/practitionerHomePage/bloc/practitioner_home_page_bloc.dart'
    as _i22;
import '../pages/practitionersPage/practitionerSchedulePage/bloc/practitioner_schedule_page_bloc.dart'
    as _i23;
import '../pages/profilePage/bloc/profile_page_bloc.dart' as _i29;
import '../pages/profilePage/service/profile_page_service.dart' as _i24;
import '../util/allUsersService/service/all_users_service.dart' as _i15;
import '../util/dietService/service/diet_service.dart' as _i19;
import '../util/pracPatientService/service/practitioner_service.dart'
    as _i12; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final connectionClientModule = _$ConnectionClientModule();
  gh.factory<_i3.AppFlutterSecureStorage>(() => _i3.AppFlutterSecureStorage());
  gh.factory<_i4.AppSharedPreferences>(() => _i4.AppSharedPreferences());
  gh.factory<_i5.Connectivity>(() => connectionClientModule.connectivity);
  gh.factory<_i6.FailedTxnLocalDataUtil>(
      () => _i6.FailedTxnLocalDataUtil(get<_i4.AppSharedPreferences>()));
  gh.factory<_i7.UsersLocalDataUtil>(
      () => _i7.UsersLocalDataUtil(get<_i4.AppSharedPreferences>()));
  gh.lazySingleton<_i8.Connection>(
      () => _i9.ConnectivityManager(get<_i5.Connectivity>()));
  gh.factory<_i10.HomePageService>(() => _i10.HomePageService(
        get<_i8.Connection>(),
        get<_i4.AppSharedPreferences>(),
      ));
  gh.factory<_i11.PatientsDetailsPageBloc>(() => _i11.PatientsDetailsPageBloc(
        get<_i4.AppSharedPreferences>(),
        get<_i10.HomePageService>(),
      ));
  gh.factory<_i12.PractitionerService>(() => _i12.PractitionerService(
        connection: get<_i8.Connection>(),
        appSharedPreferences: get<_i4.AppSharedPreferences>(),
      ));
  gh.factory<_i13.RecordPageService>(() => _i13.RecordPageService(
        connection: get<_i8.Connection>(),
        appSharedPreferences: get<_i4.AppSharedPreferences>(),
      ));
  gh.factory<_i14.ReminderPageService>(() => _i14.ReminderPageService(
        connection: get<_i8.Connection>(),
        appSharedPreferences: get<_i4.AppSharedPreferences>(),
      ));
  gh.factory<_i15.AllUsersService>(
      () => _i15.AllUsersService(connection: get<_i8.Connection>()));
  gh.factory<_i16.AuthService>(() => _i16.AuthService(
        connection: get<_i8.Connection>(),
        appSharedPreferences: get<_i4.AppSharedPreferences>(),
        allUsersService: get<_i15.AllUsersService>(),
      ));
  gh.factory<_i17.AuthenticationPageBloc>(() => _i17.AuthenticationPageBloc(
        get<_i4.AppSharedPreferences>(),
        get<_i16.AuthService>(),
      ));
  gh.factory<_i18.CareTeamPageService>(() => _i18.CareTeamPageService(
        connection: get<_i8.Connection>(),
        appSharedPreferences: get<_i4.AppSharedPreferences>(),
      ));
  gh.factory<_i19.DietService>(() => _i19.DietService(
        connection: get<_i8.Connection>(),
        appSharedPreferences: get<_i4.AppSharedPreferences>(),
        allUsersService: get<_i15.AllUsersService>(),
      ));
  gh.factory<_i20.HomePageBloc>(() => _i20.HomePageBloc(
        get<_i4.AppSharedPreferences>(),
        get<_i10.HomePageService>(),
      ));
  gh.factory<_i21.PractitionerDietPageBloc>(() => _i21.PractitionerDietPageBloc(
        get<_i19.DietService>(),
        get<_i4.AppSharedPreferences>(),
      ));
  gh.factory<_i22.PractitionerHomePageBloc>(() => _i22.PractitionerHomePageBloc(
        get<_i12.PractitionerService>(),
        get<_i4.AppSharedPreferences>(),
      ));
  gh.factory<_i23.PractitionerSchedulePageBloc>(
      () => _i23.PractitionerSchedulePageBloc(
            get<_i12.PractitionerService>(),
            get<_i4.AppSharedPreferences>(),
          ));
  gh.factory<_i24.ProfilePageService>(() => _i24.ProfilePageService(
        get<_i8.Connection>(),
        get<_i4.AppSharedPreferences>(),
        get<_i15.AllUsersService>(),
      ));
  gh.factory<_i25.RecordPageBloc>(() => _i25.RecordPageBloc(
        get<_i13.RecordPageService>(),
        get<_i4.AppSharedPreferences>(),
      ));
  gh.factory<_i26.ReminderPageBloc>(() => _i26.ReminderPageBloc(
        get<_i14.ReminderPageService>(),
        get<_i4.AppSharedPreferences>(),
      ));
  gh.factory<_i27.CareTeamPageBloc>(() => _i27.CareTeamPageBloc(
        get<_i15.AllUsersService>(),
        get<_i18.CareTeamPageService>(),
      ));
  gh.factory<_i28.DietPageBloc>(() => _i28.DietPageBloc(
        get<_i19.DietService>(),
        get<_i4.AppSharedPreferences>(),
      ));
  gh.factory<_i29.ProfilePageBloc>(
      () => _i29.ProfilePageBloc(get<_i24.ProfilePageService>()));
  return get;
}

class _$ConnectionClientModule extends _i30.ConnectionClientModule {}
