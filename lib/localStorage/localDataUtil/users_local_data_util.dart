import 'package:diabetes_care/localStorage/localDatabase/app_local_database.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:diabetes_care/localStorage/sharedPreferences/app_shared_preferences.dart';
import 'package:diabetes_care/localStorage/userDetailsModel/user_details_model.dart';
import 'package:sqflite/sqflite.dart';

@injectable
class UsersLocalDataUtil {
  final AppSharedPreferences appSharedPreferences;
  UsersLocalDataUtil(this.appSharedPreferences);
  Future addUserToStorage(
      {String? email,
      String? firstName,
      String? lastName,
      String? imagePath,
      String? mainPhone,
      String? userCategory,
      bool? logout = false}) async {
    final db = await AppLocalDatabase.instance.getDataBase;

    final userDetailsModel = UserDetailsModel(
      email: email,
      firstName: firstName,
      fullname: '$firstName $lastName',
      image: imagePath ?? '',
      lastName: lastName,
      logout: logout,
      mainPhone: mainPhone,
      phone: '',
      userAddress: '',
      userCategory: userCategory,
    );

    // Map<String, Object?> jsonValueData = {
    //   'id': '',
    //   'email': email,
    //   'fullname': '$firstName $lastName',
    //   'firstName': firstName,
    //   'lastName': lastName,
    //   'image': imagePath,
    //   'mainPhone': mainPhone,
    //   'phone': '',
    //   'userCategory': userCategory,
    //   'userAddress': '',
    //   'logout': logout! ? 1 : 0
    // };

    final id = await db.insert(userTableName, userDetailsModel.toJson(), conflictAlgorithm: ConflictAlgorithm.replace,);

    return userDetailsModel.copy(id: id);
  }

  Future updateUserRecordForProfileImageState(
      {required String email, required String profileImagePath}) async {
    final getUserData = await getUserDataInStorage();

    final db = await AppLocalDatabase.instance.getDataBase;

    for (var element in getUserData) {
      if (element.email == email) {
        final userData = UserDetailsModel(
          id: element.id,
          email: email,
          firstName: element.firstName,
          fullname: '${element.firstName} ${element.lastName}',
          image: profileImagePath,
          lastName: element.lastName,
          logout: element.logout,
          mainPhone: element.mainPhone,
          phone: element.phone,
          userAddress: element.userAddress,
          userCategory: element.userCategory,
        );

        return db.update(userTableName, userData.toJson(),
            where: '${UserDetailsFields.email} = ?',
            whereArgs: [userData.email], conflictAlgorithm: ConflictAlgorithm.replace,);
      }
    }
  }

  Future updateUserRecordForAddressState(
      {required String email, required String address}) async {
    final getUserData = await getUserDataInStorage();

    final db = await AppLocalDatabase.instance.getDataBase;

    for (var element in getUserData) {
      if (element.email == email) {
        final userData = UserDetailsModel(
          id: element.id,
          email: email,
          firstName: element.firstName,
          fullname: '${element.firstName} ${element.lastName}',
          image: element.image,
          lastName: element.lastName,
          logout: element.logout,
          mainPhone: element.mainPhone,
          phone: element.phone,
          userAddress: address,
          userCategory: element.userCategory,
        );

        return db.update(userTableName, userData.toJson(),
            where: '${UserDetailsFields.email} = ?',
            whereArgs: [userData.email], conflictAlgorithm: ConflictAlgorithm.replace,);
      }
    }
  }

  Future updateUserRecord({
    String? email,
    String? firstName,
    String? lastName,
    String? imagePath,
    String? phone,
    String? mainPhone,
    String? userCategory,
    bool? logout = false,
  }) async {
    final getUserData = await getUserDataInStorage();

    final db = await AppLocalDatabase.instance.getDataBase;

    for (var element in getUserData) {
      if (element.email == email) {
        final userData = UserDetailsModel(
          id: element.id,
          email: email,
          firstName: firstName,
          fullname: '$firstName $lastName',
          image: imagePath ?? element.image,
          lastName: lastName,
          logout: logout,
          mainPhone: mainPhone,
          phone: phone ?? element.phone,
          userAddress: element.userAddress,
          userCategory: userCategory,
        );

        return db.update(userTableName, userData.toJson(),
            where: '${UserDetailsFields.email} = ?',
            whereArgs: [userData.email], conflictAlgorithm: ConflictAlgorithm.replace,);
      }
    }
  }

  Future<List<UserDetailsModel>> getUserDataInStorage() async {
    final db = await AppLocalDatabase.instance.getDataBase;
    final orderBy = '${UserDetailsFields.id} ASC';
    final userData = await db.query(
      userTableName,
      orderBy: orderBy,
    );

    debugPrint('this is the list from local DB $userData');
    //  columns: UserDetailsFields.values
    // if (userData.isNotEmpty) {
    //   return UserDetailsModel.fromJson(userData);
    // }
    return userData.map((json) => UserDetailsModel.fromJson(json)).toList();
  }

  // Future<String?> getUserTokenInStorage() async {
  //   final getUserData =
  //       await getUserDataInStorage() as List<UsersLocalDatabase>;
  //   final email = await appSharedPreferences.readAuthEmailAddress();
  //   String? token;
  //   for (var element in getUserData) {
  //     if (element.email == email) {
  //       token = element.token;
  //     }
  //   }
  //   return token;
  // }

  Future<String?> getUserFullnameInStorage() async {
    final getUserData = await getUserDataInStorage();
    final email = await appSharedPreferences.readAuthEmailAddress();
    String? fullname;
    for (var element in getUserData) {
      if (element.email == email) {
        fullname = element.fullname;
      }
    }
    return fullname;
  }

  Future<String?> getUserAddressInStorage() async {
    final getUserData = await getUserDataInStorage();
    final email = await appSharedPreferences.readAuthEmailAddress();
    String? userAddress;
    for (var element in getUserData) {
      if (element.email == email) {
        userAddress = element.userAddress;
      }
    }
    return userAddress;
  }

  Future<String?> getUserFirstName() async {
    final getUserData = await getUserDataInStorage();
    final email = await appSharedPreferences.readAuthEmailAddress();
    String? firstName;
    for (var element in getUserData) {
      if (element.email == email) {
        firstName = element.firstName;
      }
    }
    return firstName;
  }

  Future<String?> getUserEmailAddress() async {
    final getUserData = await getUserDataInStorage();
    final email = await appSharedPreferences.readAuthEmailAddress();
    String? emailAddress;
    for (var element in getUserData) {
      if (element.email == email) {
        emailAddress = element.email;
      }
    }
    return emailAddress;
  }

  Future<String?> getUserLastName() async {
    final getUserData = await getUserDataInStorage();
    final email = await appSharedPreferences.readAuthEmailAddress();
    String? lastName;
    for (var element in getUserData) {
      if (element.email == email) {
        lastName = element.lastName;
      }
    }
    return lastName;
  }

  Future<String?> getUserImage() async {
    final getUserData = await getUserDataInStorage();
    final email = await appSharedPreferences.readAuthEmailAddress();
    String? imagePath;
    for (var element in getUserData) {
      if (element.email == email) {
        imagePath = element.image;
      }
    }
    return imagePath;
  }

  Future<String?> getUserPhone() async {
    final getUserData = await getUserDataInStorage();
    final email = await appSharedPreferences.readAuthEmailAddress();
    String? phoneNumber;
    for (var element in getUserData) {
      if (element.email == email) {
        phoneNumber = element.phone;
      }
    }
    return phoneNumber;
  }

  Future<String?> getUserMainPhone() async {
    final getUserData = await getUserDataInStorage();
    final email = await appSharedPreferences.readAuthEmailAddress();
    String? mainPhoneNumber;
    for (var element in getUserData) {
      if (element.email == email) {
        mainPhoneNumber = element.mainPhone;
      }
    }
    return mainPhoneNumber;
  }

  Future<String?> getUserCategoryChoice() async {
    final getUserData = await getUserDataInStorage();
    final email = await appSharedPreferences.readAuthEmailAddress();
    String? userCategoryChoice;
    for (var element in getUserData) {
      if (element.email == email) {
        userCategoryChoice = element.userCategory;
      }
    }
    return userCategoryChoice;
  }

  Future<bool?> isUserInDatabase(String? email) async {
    final getUserData = await getUserDataInStorage();
    bool isUserInThere = false;
    for (var element in getUserData) {
      if (element.email == email) {
        isUserInThere = true;
      } else {
        isUserInThere = false;
      }
    }
    return isUserInThere;
  }

  Future updateUserRecordForLogoutState(String email) async {
    final getUserData = await getUserDataInStorage();

    final db = await AppLocalDatabase.instance.getDataBase;

    for (var element in getUserData) {
      if (element.email == email) {
        final userData = UserDetailsModel(
          id: element.id,
          email: email,
          firstName: element.firstName,
          fullname: '${element.firstName} ${element.lastName}',
          image: element.image,
          lastName: element.lastName,
          logout: true,
          mainPhone: element.mainPhone,
          phone: element.phone,
          userAddress: element.userAddress,
          userCategory: element.userCategory,
        );

        return db.update(userTableName, userData.toJson(),
            where: '${UserDetailsFields.email} = ?',
            whereArgs: [userData.email], conflictAlgorithm: ConflictAlgorithm.replace,);
      }
    }
  }
}
