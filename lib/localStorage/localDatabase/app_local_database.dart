import 'package:diabetes_care/localStorage/failedTxnModel/failed_txn_model.dart';
import 'package:diabetes_care/localStorage/userDetailsModel/user_details_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppLocalDatabase {
  static AppLocalDatabase instance = AppLocalDatabase._init();

  static Database? _database;

  AppLocalDatabase._init();

  Future<Database> get getDataBase async {
    if (_database != null) return _database!;

    _database = await _initDB('user.db');

    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();

    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 2, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    // const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    // const boolType = 'BOOLEAN NOT NULL';
    // const stringType = 'TEXT NOT NULL';

    // await db.execute('''
    //   CREATE TABLE $userTableName(
    //     ${UserDetailsFields.id} $idType,
    //     ${UserDetailsFields.email} $stringType,
    //     ${UserDetailsFields.fullname} $stringType,
    //     ${UserDetailsFields.firstName} $stringType,
    //     ${UserDetailsFields.lastName} $stringType,
    //     ${UserDetailsFields.image} $stringType,
    //     ${UserDetailsFields.mainPhone} $stringType,
    //     ${UserDetailsFields.phone} $stringType,
    //     ${UserDetailsFields.userCategory} $stringType,
    //     ${UserDetailsFields.userAddress} $stringType,
    //     ${UserDetailsFields.logout} $boolType
    //   )
    // ''');
    await userDetailsTable(db);
    await failedTxnTable(db);
  }

  Future userDetailsTable(Database db)async{
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const boolType = 'BOOLEAN NOT NULL';
    const stringType = 'TEXT NOT NULL';

    await db.execute('''
      CREATE TABLE $userTableName(
        ${UserDetailsFields.id} $idType,
        ${UserDetailsFields.email} $stringType,
        ${UserDetailsFields.fullname} $stringType,
        ${UserDetailsFields.firstName} $stringType,
        ${UserDetailsFields.lastName} $stringType,
        ${UserDetailsFields.image} $stringType,
        ${UserDetailsFields.mainPhone} $stringType,
        ${UserDetailsFields.phone} $stringType,
        ${UserDetailsFields.userCategory} $stringType,
        ${UserDetailsFields.userAddress} $stringType,
        ${UserDetailsFields.logout} $boolType
      )
    ''');
  }

  Future failedTxnTable(Database db)async{
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const doubleType = 'DOUBLE NOT NULL';
    const stringType = 'TEXT NOT NULL';

    await db.execute('''
      CREATE TABLE $txnTableName(
        ${FailedTxnTable.id} $idType,
        ${FailedTxnTable.amountToPay} $doubleType,
        ${FailedTxnTable.dateOfPayment} $stringType,
        ${FailedTxnTable.paymentReferId} $stringType,
        ${FailedTxnTable.paystackSuccessfulReturnResponseValue} $stringType
      )
    ''');
  }

  Future closeDb() async {
    final db = await instance.getDataBase;

    db.close();
  }
}
