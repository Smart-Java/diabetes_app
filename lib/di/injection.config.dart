// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../connectionClientModule/connection_client_module.dart' as _i24;
import '../connectivityManager/connection_interface/connection.dart' as _i8;
import '../connectivityManager/connectivity_manager.dart' as _i9;
import '../localStorage/flutterSecureStorage/app_flutter_secure_storage.dart'
    as _i3;
import '../localStorage/localDataUtil/failed_txn_local_data_util.dart' as _i6;
import '../localStorage/localDataUtil/users_local_data_util.dart' as _i7;
import '../localStorage/sharedPreferences/app_shared_preferences.dart' as _i4;
import '../pages/authenticationPage/bloc/authentication_page_bloc.dart' as _i15;
import '../pages/authenticationPage/service/auth_service.dart' as _i14;
import '../pages/patientPage/careTeamPage/bloc/care_team_page_bloc.dart'
    as _i16;
import '../pages/patientPage/dietPage/bloc/diet_page_bloc.dart' as _i22;
import '../pages/patientPage/homePage/bloc/home_page_bloc.dart' as _i18;
import '../pages/patientPage/homePage/service/home_page_service.dart' as _i10;
import '../pages/patientPage/recordPage/bloc/record_page_bloc.dart' as _i20;
import '../pages/patientPage/recordPage/service/record_page_service.dart'
    as _i11;
import '../pages/patientPage/reminderPage/bloc/reminder_page_bloc.dart' as _i21;
import '../pages/patientPage/reminderPage/service/reminder_page_service.dart'
    as _i12;
import '../pages/profilePage/bloc/profile_page_bloc.dart' as _i23;
import '../pages/profilePage/service/profile_page_service.dart' as _i19;
import '../util/allUsersService/service/all_users_service.dart' as _i13;
import '../util/dietService/service/diet_service.dart'
    as _i17; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i11.RecordPageService>(() => _i11.RecordPageService(
        connection: get<_i8.Connection>(),
        appSharedPreferences: get<_i4.AppSharedPreferences>(),
      ));
  gh.factory<_i12.ReminderPageService>(() => _i12.ReminderPageService(
        connection: get<_i8.Connection>(),
        appSharedPreferences: get<_i4.AppSharedPreferences>(),
      ));
  gh.factory<_i13.AllUsersService>(
      () => _i13.AllUsersService(connection: get<_i8.Connection>()));
  gh.factory<_i14.AuthService>(() => _i14.AuthService(
        connection: get<_i8.Connection>(),
        appSharedPreferences: get<_i4.AppSharedPreferences>(),
        allUsersService: get<_i13.AllUsersService>(),
      ));
  gh.factory<_i15.AuthenticationPageBloc>(() => _i15.AuthenticationPageBloc(
        get<_i4.AppSharedPreferences>(),
        get<_i14.AuthService>(),
      ));
  gh.factory<_i16.CareTeamPageBloc>(
      () => _i16.CareTeamPageBloc(get<_i13.AllUsersService>()));
  gh.factory<_i17.DietService>(() => _i17.DietService(
        connection: get<_i8.Connection>(),
        appSharedPreferences: get<_i4.AppSharedPreferences>(),
        allUsersService: get<_i13.AllUsersService>(),
      ));
  gh.factory<_i18.HomePageBloc>(() => _i18.HomePageBloc(
        get<_i4.AppSharedPreferences>(),
        get<_i10.HomePageService>(),
      ));
  gh.factory<_i19.ProfilePageService>(() => _i19.ProfilePageService(
        get<_i8.Connection>(),
        get<_i4.AppSharedPreferences>(),
        get<_i13.AllUsersService>(),
      ));
  gh.factory<_i20.RecordPageBloc>(() => _i20.RecordPageBloc(
        get<_i11.RecordPageService>(),
        get<_i4.AppSharedPreferences>(),
      ));
  gh.factory<_i21.ReminderPageBloc>(() => _i21.ReminderPageBloc(
        get<_i12.ReminderPageService>(),
        get<_i4.AppSharedPreferences>(),
      ));
  gh.factory<_i22.DietPageBloc>(() => _i22.DietPageBloc(
        get<_i17.DietService>(),
        get<_i4.AppSharedPreferences>(),
      ));
  gh.factory<_i23.ProfilePageBloc>(
      () => _i23.ProfilePageBloc(get<_i19.ProfilePageService>()));
  return get;
}

class _$ConnectionClientModule extends _i24.ConnectionClientModule {}
