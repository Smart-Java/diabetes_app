import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@injectable
class AppFlutterSecureStorage {
  final storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
  );

  Future setLoginEmailAddress(String emailAddress) async {
    await storage.write(
      key: 'loginEmailAddress',
      value: emailAddress,
    );
  }

  Future setLoginPassword(String pasword) async {
    await storage.write(
      key: 'loginPassword',
      value: pasword,     
    );
  }

  Future setLoginToken(String token) async {
    await storage.write(
      key: 'loginToken',
      value: token,
    );
  }

  Future setLastLoginDate() async {
    var date = DateTime.now().toString();
    await storage.write(
      key: 'lastLoginDate',
      value: date,
    );
  }

  Future readLoginEmailAddress() async {
    final loginEmailAddress = await storage.read(key: 'loginEmailAddress', );
    return loginEmailAddress;
  }

  Future readLoginPassword() async {
    final loginPassword = await storage.read(key: 'loginPassword', );
    return loginPassword;
  }

  Future readLoginToken() async {
    final loginToken = await storage.read(key: 'loginToken', );
    return loginToken;
  }

  Future readLastLoginDate() async {
    final loginDate = await storage.read(key: 'lastLoginDate', );
    return loginDate;
  }
}
