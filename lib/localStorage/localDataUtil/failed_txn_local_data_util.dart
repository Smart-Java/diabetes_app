import 'package:diabetes_care/localStorage/failedTxnModel/failed_txn_model.dart';
import 'package:diabetes_care/localStorage/localDatabase/app_local_database.dart';
import 'package:diabetes_care/localStorage/sharedPreferences/app_shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

@injectable
class FailedTxnLocalDataUtil {
  final AppSharedPreferences appSharedPreferences;
  FailedTxnLocalDataUtil(this.appSharedPreferences);
  Future addfailedTxn({
    required double amountToPay,
    required String dateOfPayment,
    required String paymentReferId,
    required String paystackSuccessfulReturnResponseValue,
  }) async {
    final db = await AppLocalDatabase.instance.getDataBase;

    final failedTxnModel = FailedTxnModel(
      amountToPay: amountToPay,
      dateOfPayment: dateOfPayment,
      paymentReferId: paymentReferId,
      paystackSuccessfulReturnResponseValue: paystackSuccessfulReturnResponseValue,
    );

    final id = await db.insert(
      txnTableName,
      failedTxnModel.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return failedTxnModel.copy(id: id);
  }

  Future deleteTxnFromFailedTxnRecord({
    required int failedTxnId,
    String? email,
    String? firstName,
    String? lastName,
    String? imagePath,
    String? phone,
    String? mainPhone,
    String? userCategory,
    bool? logout = false,
  }) async {
    final getUserData = await getFailedTxnDataInStorage();

    final db = await AppLocalDatabase.instance.getDataBase;

    for (var element in getUserData) {
      if (element.id == failedTxnId) {
        return db.delete(
          txnTableName,
          where: '${FailedTxnTable.id} = ?',
          whereArgs: [failedTxnId],
        );
      }
    }
  }

  Future<List<FailedTxnModel>> getFailedTxnDataInStorage() async {
    final db = await AppLocalDatabase.instance.getDataBase;
    final orderBy = '${FailedTxnTable.id} ASC';
    final failedTxnData = await db.query(
      txnTableName,
      orderBy: orderBy,
    );

    debugPrint('this is the list from failed txn local DB $failedTxnData');

    return failedTxnData.map((json) => FailedTxnModel.fromJson(json)).toList();
  }
}
