import 'dart:io';
import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseManager {
  //buat privat constructor
  DatabaseManager._privateConstructor();
  static DatabaseManager instance = DatabaseManager._privateConstructor();

  Database? _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await _initDB();
      return _db!;
    } else {
      return _db!;
    }
  }

  Future _initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentDirectory.path, "crudlokal.db");

    return await openDatabase(path, version: 1,
        onCreate: (database, version) async {
      return await database.execute('''
        CREATE TABLE crudlokal(
          nik INTEGER PRIMARY KEY,
          nama TEXT NOT NULL,
          umur TEXT NOT NULL,
          kota TEXT NOT NULL
      )''');
    });
  }

  Future closeDB() async {
    _db = await instance.db;

    _db!.close();
  }
}
