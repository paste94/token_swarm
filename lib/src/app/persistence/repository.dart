import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:token_swarm/src/app/model/token_preview.dart';

class SqfLiteRepository {
  late final Future<Database> database;

  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    database = openDatabase(
      join(await getDatabasesPath(), 'history.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE history(id TEXT PRIMARY KEY, name TEXT, image_uri TEXT, timestamp INTEGER)',
        );
      },
      version: 1,
    );
  }

  Future<void> insert(TokenPreview token) async {
    final db = await database;
    await db.insert(
      'history',
      token.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<TokenPreview>> get() async {
    late final Database db;
    try {
      db = await database;
    } catch (e) {
      await init();
      db = await database;
    }

    final List<Map<String, Object?>> historyMaps = await db.query(
      'history',
      orderBy: 'timestamp desc',
    );

    final data = historyMaps.map((e) => TokenPreview.fromMap(map: e)).toList();
    return data;
  }

  Future<void> delete(String id) async {
    final db = await database;
    await db.delete(
      'history',
      where: 'id=?',
      whereArgs: [id],
    );
  }
}
