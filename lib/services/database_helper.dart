import 'package:flutter_finance_tracker_app/models/finance_model.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = "Finance.db";

  static Future<Database> _getDB() async {
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) async => await db.execute('''
  CREATE TABLE Finance(
    id INTEGER PRIMARY KEY,
    date TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    nominal INTEGER NOT NULL,
    keterangan TEXT NOT NULL,
    kategori TEXT NOT NULL
  )
'''), version: _version);
  }

  static Future<int> addFinance(Finance finance) async {
    final db = await _getDB();
    return await db.insert("Finance", finance.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Finance>?> getAllFinance() async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query("Finance");
    if (maps.isEmpty) {
      return null;
    }
    return List.generate(maps.length, (index) => Finance.fromJson(maps[index]));
  }
}
