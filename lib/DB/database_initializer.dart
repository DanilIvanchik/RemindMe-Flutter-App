import 'package:flutter_remind_me_app/models/task.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DataBaseInitializer {
  static Database? _db;
  static final int _version = 1;
  static final String _tableName = "tasks";

  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + 'tasks.db';
      _db = await openDatabase(
        _path,
        version: _version,
        onCreate: (db, version) {
          print("Creatin database");
          return db.execute(
            "CREATE TABLE $_tableName("
            "id INTEGER PRIMARY KEY AUTOINCREMENT, "
            "title String, note TEXT, date STRING, "
            "startTime STRING, endTime String"
            "remind INTEGER, repeat STRING, "
            "color INTEGER, "
            "isCompleted INTEGER",
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insert(Task? task) async {
    return await _db?.insert(_tableName, task!.toJson()) ?? 1;
  }
}
