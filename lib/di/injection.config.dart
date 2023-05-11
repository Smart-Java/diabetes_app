// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i6;
import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../api/apiRequestHelper/api_request_helper.dart' as _i10;
import '../connectivityManager/connection_interface/connection.dart' as _i14;
import '../connectivityManager/connectivity_manager.dart' as _i15;
import '../dioClient/dio_client_module.dart' as _i19;
import '../interceptors/authentication_interceptor.dart' as _i5;
import '../interceptors/network_interceptor.dart' as _i16;
import '../localStorage/flutterSecureStorage/app_flutter_secure_storage.dart'
    as _i3;
import '../localStorage/localDataUtil/failed_txn_local_data_util.dart' as _i8;
import '../localStorage/localDataUtil/users_local_data_util.dart' as _i9;
import '../localStorage/sharedPreferences/app_shared_preferences.dart' as _i4;
import '../pages/authenticationPage/bloc/authentication_page_bloc.dart' as _i18;
import '../pages/authenticationPage/data/authentication_page_data.dart' as _i11;
import '../pages/authenticationPage/repo/authentication_page_repo.dart' as _i13;
import '../pages/authenticationPage/repo/repoInterface/authentication_page_repo_interface.dart'
    as _i12;
import '../pages/splashPage/bloc/splash_page_bloc.dart'
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
  final dioClientModule = _$DioClientModule();
  gh.factory<_i3.AppFlutterSecureStorage>(() => _i3.AppFlutterSecureStorage());
  gh.factory<_i4.AppSharedPreferences>(() => _i4.AppSharedPreferences());
  gh.lazySingleton<_i5.AuthenticationInterceptor>(
      () => _i5.AuthenticationInterceptor(
            get<_i4.AppSharedPreferences>(),
            get<_i3.AppFlutterSecureStorage>(),
          ));
  gh.factory<_i6.Connectivity>(() => dioClientModule.connectivity);
  gh.lazySingleton<_i7.Dio>(() => dioClientModule.dioClient);
  gh.factory<_i8.FailedTxnLocalDataUtil>(
      () => _i8.FailedTxnLocalDataUtil(get<_i4.AppSharedPreferences>()));
  gh.factory<_i9.UsersLocalDataUtil>(
      () => _i9.UsersLocalDataUtil(get<_i4.AppSharedPreferences>()));
  gh.factory<_i10.ApiRequestHelper>(() => _i10.ApiRequestHelper(
        get<_i6.Connectivity>(),
        get<_i7.Dio>(),
      ));
  gh.factory<_i11.AuthenticationPageData>(() => _i11.AuthenticationPageData(
        get<_i10.ApiRequestHelper>(),
        get<_i4.AppSharedPreferences>(),
        get<_i6.Connectivity>(),
        get<_i3.AppFlutterSecureStorage>(),
      ));
  gh.factory<_i12.AuthenticationPageRepoInterface>(
      () => _i13.AuthenticationPageRepo(
            get<_i4.AppSharedPreferences>(),
            get<_i11.AuthenticationPageData>(),
            get<_i3.AppFlutterSecureStorage>(),
            get<_i9.UsersLocalDataUtil>(),
          ));
  gh.lazySingleton<_i14.Connection>(
      () => _i15.ConnectivityManager(get<_i6.Connectivity>()));
  gh.lazySingleton<_i16.NetworkInterceptor>(
      () => _i16.NetworkInterceptor(get<_i14.Connection>()));
  gh.factory<_i17.SplashPageBloc>(() => _i17.SplashPageBloc(
        get<_i4.AppSharedPreferences>(),
        get<_i9.UsersLocalDataUtil>(),
        get<_i3.AppFlutterSecureStorage>(),
        get<_i12.AuthenticationPageRepoInterface>(),
      ));
  gh.factory<_i18.AuthenticationPageBloc>(() => _i18.AuthenticationPageBloc(
        get<_i12.AuthenticationPageRepoInterface>(),
        get<_i4.AppSharedPreferences>(),
      ));
  return get;
}

class _$DioClientModule extends _i19.DioClientModule {}
