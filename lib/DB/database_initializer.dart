import 'package:sqflite/sqlite_api.dart';

class DataBaseInitializer {
  static Database? _db;
  static final int _version = 1;
  static final String _tableName = "tasks";

  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
  }
}
