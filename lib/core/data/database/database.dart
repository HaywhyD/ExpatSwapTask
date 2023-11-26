import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../model/account_details.dart';

class LocalDatabase {
  static const _databaseName = "AccountDetails.db";
  static const _databaseVersion = 1;

  LocalDatabase._();

  static final LocalDatabase instance = LocalDatabase._();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDatabase();
      return _database!;
    }
  }

  _initDatabase() async {
    Directory dataDirectory = await getApplicationDocumentsDirectory();
    String dbPath = join(
      dataDirectory.path,
      _databaseName,
    );
    return await openDatabase(
      dbPath,
      version: _databaseVersion,
      onCreate: _onCreateDb,
    );
  }

  _onCreateDb(Database db, int version) async {
    await db.execute('''
CREATE TABLE ${AccountDetails.tblAccountDetails}(
  ${AccountDetails.colId} INTEGER PRIMARY KEY AUTOINCREMENT,
  ${AccountDetails.colUserId} TEXT NOT NULL,
  ${AccountDetails.colFullName} TEXT NOT NULL,
  ${AccountDetails.colEmail} TEXT NOT NULL,
  ${AccountDetails.colPhoneNumber} TEXT NOT NULL,
  ${AccountDetails.colDateOfBirth} TEXT NOT NULL,
  ${AccountDetails.colAddress} TEXT NOT NULL,
  ${AccountDetails.colPassword} TEXT NOT NULL,
  ${AccountDetails.colIsLoggedIn} TEXT NOT NULL,
   ${AccountDetails.colIsVerified} TEXT NOT NULL
)
''');
  }

  deleteTable() async {
    Directory dataDirectory = await getApplicationDocumentsDirectory();
    String path = join(
      dataDirectory.path,
      _databaseName,
    );
    databaseFactory.deleteDatabase(path);
  }

  Future<int> updateAccountDetails(AccountDetails accountDetails) async {
    Database db = await database;

    return await db.update(
        AccountDetails.tblAccountDetails, accountDetails.toMap());
  }

  Future<int> insertAccountDetails(AccountDetails accountDetails) async {
    Database db = await database;
    return await db.insert(
        AccountDetails.tblAccountDetails, accountDetails.toMap());
  }

  // Future<void> alterTable() async {
  //   Database db = await database;
  //   await db.execute('''ALTER TABLE ${AccountDetails.tblAccountDetails} ADD
  //     COLUMN ${AccountDetails.c} TEXT''');
  // }

  Future<void> updateColumn(String column, dynamic value) async {
    Database db = await database;
    await db.rawUpdate(
        '''UPDATE ${AccountDetails.tblAccountDetails} SET $column = ?''',
        [value]);
  }

  Future<List> fetchAccountDetails() async {
    Database db = await database;
    List<Map> accountDetails = await db.query(AccountDetails.tblAccountDetails);

    return accountDetails.isEmpty ? [] : accountDetails.toList();

    //returns a list in this format
    //[{id: 1, email: adejumooreoluwa@gmail.com, name: Oreoluwa, password: 123456, userId: d49c955b6ba14399bf8eccc3fe94b7fe, loggedIn: true,},]
    // always call the first index[0] to access the parameters e.g Accountdetails[0]['email'];
  }
}
