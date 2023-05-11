import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:diabetes_care/connectivityManager/connection_interface/connection.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: Connection)
class ConnectivityManager implements Connection {
  ConnectivityManager(this._connectivity);
  final Connectivity _connectivity;

  @override
  Future<bool> isConnectedToAWifi() async {
    var connectivityResult = await (_connectivity.checkConnectivity());
    return (connectivityResult == ConnectivityResult.wifi);
  }

  @override
  Future<bool> isConnectedToMobileNetwork() async {
    var connectivityResult = await (_connectivity.checkConnectivity());
    return (connectivityResult == ConnectivityResult.mobile);
  }

  @override
  Future<bool> isInternetEnabled() async {
    var connectivityResult = await (_connectivity.checkConnectivity());
    return (connectivityResult != ConnectivityResult.none);
  }

  @override
  Future<bool> isConnectedToAnEthernet() async {
    var connectivityResult = await (_connectivity.checkConnectivity());
    return (connectivityResult == ConnectivityResult.ethernet);
  }
}
