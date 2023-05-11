abstract class Connection {
  Future<bool> isInternetEnabled();
  Future<bool> isConnectedToMobileNetwork();
  Future<bool> isConnectedToAWifi();
  Future<bool> isConnectedToAnEthernet();
}