// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../connectionClientModule/connection_client_module.dart' as _i12;
import '../connectivityManager/connection_interface/connection.dart' as _i8;
import '../connectivityManager/connectivity_manager.dart' as _i9;
import '../localStorage/flutterSecureStorage/app_flutter_secure_storage.dart'
    as _i3;
import '../localStorage/localDataUtil/failed_txn_local_data_util.dart' as _i6;
import '../localStorage/localDataUtil/users_local_data_util.dart' as _i7;
import '../localStorage/sharedPreferences/app_shared_preferences.dart' as _i4;
import '../pages/authenticationPage/bloc/authentication_page_bloc.dart' as _i11;
import '../pages/authenticationPage/service/auth_service.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i10.AuthService>(
      () => _i10.AuthService(connection: get<_i8.Connection>()));
  gh.factory<_i11.AuthenticationPageBloc>(() => _i11.AuthenticationPageBloc(
        get<_i4.AppSharedPreferences>(),
        get<_i10.AuthService>(),
      ));
  return get;
}

class _$ConnectionClientModule extends _i12.ConnectionClientModule {}
