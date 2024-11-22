import 'package:logging/logging.dart';
import 'package:sqflite/sqflite.dart';
import 'package:token_swarm/src/app/db/model/token_card_db.dart';

class TokenCardRepository {
  static Database? _db;
  static const int _version = 1;
  static const String _tableName = "token";
  static final log = Logger('TokenCardRepository');

  static Future<void> initDB() async {
    if (_db != null) {
      return;
    }
    try {
      String path = '${await getDatabasesPath()}task.db';
      _db = await openDatabase(
        path,
        version: _version,
        onCreate: (db, version) {
          log.info("Creating a new table $_tableName V $_version");
          return db.execute(
            "CREATE TABLE $_tableName("
            "id STRING PRIMARY KEY,"
            "power INTEGER,"
            "toughness INTEGER,"
            "imageUri STRING,"
            "name STRING,"
            "tokenNumber INTEGER,"
            "tappedNumber INTEGER,"
            "untappedNumber INTEGER,"
            "prevTappedNumber INTEGER,"
            "sickNumber INTEGER"
            ")",
          );
        },
      );
    } catch (e, stackTrace) {
      log.severe("Error $e, \n $stackTrace");
    }
  }

  static Future<int> insert(TokenCardDb? token) async {
    log.info("Insert function called on $token");
    return await _db!.insert(_tableName, token!.toMap());
  }

  static Future<List<Map<String, dynamic>>> query() async {
    log.info("query fuction called");
    return await _db!.query(_tableName);
  }

  static delete(TokenCardDb token) async {
    log.info("delete fuction called");
    await _db!.delete(
      _tableName,
      where: "id=?",
      whereArgs: [token.id],
    );
  }

  static Future<int> update({
    required String id,
    required String attribute,
    required dynamic newVal,
  }) async {
    log.info("update fuction called");
    return await _db!
        .update(_tableName, {attribute: newVal}, where: "id='$id'");

    // _db!.rawUpdate('''
    //   UPDATE $_tableName
    //   SET ?=?
    //   WHERE id=?
    // ''', [attribute, newVal, id]);
  }
}
