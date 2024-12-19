import 'package:logging/logging.dart';
import 'package:sqflite/sqflite.dart';
import 'package:token_swarm/src/app/db/model/token_card_db.dart';
import 'package:token_swarm/src/app/provider/token_provider.dart';

class TableNames {
  static const String tokenTableName = "token";
  static const String aggTableName = "aggregate_info_settings";
}

class TokenCardRepository {
  static Database? _db;
  static const int _version = 2;
  static final log = Logger('TokenCardRepository');

  static Future _createDb(Database db) async {
    log.info('Table created');
    await db.execute('DROP TABLE If EXISTS ${TableNames.tokenTableName}');
    await db.execute('DROP TABLE If EXISTS ${TableNames.aggTableName}');
    await db.execute(
      "CREATE TABLE ${TableNames.tokenTableName}("
      "internal_id INTEGER PRIMARY KEY AUTOINCREMENT,"
      "id STRING,"
      "power INTEGER,"
      "toughness INTEGER,"
      "imageUri STRING,"
      "name STRING,"
      "text STRING,"
      "typeLine STRING,"
      "tokenNumber INTEGER,"
      "tappedNumber INTEGER,"
      "untappedNumber INTEGER,"
      "prevTappedNumber INTEGER,"
      "sickNumber INTEGER,"
      "imageUriArtCrop STRING,"
      "isCreature INTEGER,"
      "isSicknessActive INTEGER"
      ")",
    );
    await db.execute(
      "CREATE TABLE ${TableNames.aggTableName}("
      "type STRING PRIMARY KEY,"
      "pinned INTEGER"
      ")",
    );
  }

  static Future<void> initDB() async {
    if (_db != null) {
      return;
    }
    try {
      String path = '${await getDatabasesPath()}tokens.db';
      _db = await openDatabase(
        path,
        version: _version,
        onCreate: (db, version) => _createDb(db),
        onUpgrade: (db, oldVersion, newVersion) =>
            oldVersion < _version ? _createDb(db) : null,
      );
    } catch (e, stackTrace) {
      log.severe("Error $e, \n $stackTrace");
    }
  }

  static Future<int> insertToken(TokenCardDb? token) async {
    log.info("Insert function called on $token");
    return await _db!.insert(TableNames.tokenTableName, token!.toMap());
  }

  static Future<int> insertAggInfo(String type, bool pinned) async {
    log.info(
        "Insert function called on ${TableNames.aggTableName}: $type, $pinned");
    try {
      return await _db!
          .insert(TableNames.aggTableName, {'type': type, 'pinned': pinned});
    } on DatabaseException catch (e) {
      if (e.isUniqueConstraintError()) {
        return 0;
      }
      log.severe(e);
      return 0;
    } catch (e) {
      log.severe(e);
      return 0;
    }
  }

  static Future<List<Map<String, dynamic>>> queryToken() async {
    log.info("query fuction called on table TOKEN");
    return await _db!.query(TableNames.tokenTableName);
  }

  static Future<List<Map<String, dynamic>>> queryAggInfo() async {
    log.info("query fuction called on table AGGREGATE INFO");
    return await _db!.query(TableNames.aggTableName);
  }

  static deleteToken(TokenCardDb token) async {
    log.info("delete fuction called on TOKEN");
    await _db!.delete(
      TableNames.tokenTableName,
      where: "id=?",
      whereArgs: [token.id],
    );
  }

  static deleteAggInfo(String type) async {
    log.info("delete fuction called on table AGGREGATE INFO");
    await _db!.delete(
      TableNames.aggTableName,
      where: "type=?",
      whereArgs: [type],
    );
  }

  static Future<int> updateToken({
    required String id,
    required String attribute,
    required dynamic newVal,
  }) async {
    log.info("update fuction called");
    return await _db!.update(
      TableNames.tokenTableName,
      {attribute: newVal},
      where: "id='$id'",
    );
  }

  static Future<int> updateAggInfo({
    required String type,
    required String attribute,
    required dynamic newVal,
  }) async {
    log.info("update fuction called");
    return await _db!.update(
      TableNames.aggTableName,
      {attribute: newVal},
      where: "type='$type'",
    );
  }

  static Future<int> newTurn() async {
    log.info("update fuction called");

    return await _db!.rawUpdate('''
      UPDATE ${TableNames.tokenTableName} 
      SET untappedNumber=tokenNumber, 
          tappedNumber=0,
          sickNumber=0
    ''');
  }

  static Future<int> tap(String tokenId) async {
    log.info("update fuction called");

    return await _db!.rawUpdate('''
      UPDATE ${TableNames.tokenTableName} 
      SET untappedNumber=untappedNumber-1, 
          tappedNumber=tappedNumber+1
      WHERE id='$tokenId'
    ''');
  }

  static Future<int> untap(String tokenId) async {
    log.info("update fuction called");

    return await _db!.rawUpdate('''
      UPDATE ${TableNames.tokenTableName} 
      SET untappedNumber=untappedNumber+1, 
          tappedNumber=tappedNumber-1
      WHERE id='$tokenId'
    ''');
  }
}
