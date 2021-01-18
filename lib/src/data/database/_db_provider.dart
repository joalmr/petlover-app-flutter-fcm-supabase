import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '_db_model.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join(documentsDirectory.path, 'LocalDB.db');
    print(path);

    return await openDatabase(
      path,
      version: 5,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('''
        CREATE TABLE local_notifications(
          id INTEGER PRIMARY KEY,
          type TEXT,
          dateTime TEXT,
          frecuency INTEGER,
          petId INTEGER,
          petName TEXT
        )
        ''');

        // await db.execute('''
        // CREATE TABLE pet_food(
        //   id INTEGER PRIMARY KEY,
        //   foodBrand INTEGER,
        //   frecuency INTEGER
        //   hours TEXT,
        //   petId INTEGER,
        //   petName TEXT
        // )
        // ''');

        // await db.execute('''
        // CREATE TABLE user_login_date(
        //   id INTEGER PRIMARY KEY,
        //   userId TEXT,
        //   dateTime TEXT
        // )
        // ''');
      },
    );
  }

  getTables() async {
    final db = await database;
    final res = await db
        .rawQuery('SELECT name FROM sqlite_master WHERE type = "table";');
    print(res);
    return res;
  }

  getPetFood() async {
    final db = await database;
    final res = await db.rawQuery('SELECT * FROM pet_food;');
    print(res);
    return res;
  }

  getUserLoginDate() async {
    final db = await database;
    final res = await db.rawQuery('SELECT * FROM user_login_date;');
    print(res);
    return res;
  }

  Future<int> newLocalNotification(LocalNotification newNotification) async {
    final db = await database;
    final res =
        await db.insert('local_notifications', newNotification.toJson());
    print(res);
    return res;
  }

  Future<List<LocalNotification>> getAllLocalNotification() async {
    final db = await database;
    final res = await db.query('local_notifications');
    print(res);
    return res.isNotEmpty
        ? res.map((e) => LocalNotification.fromJson(e)).toList()
        : [];
  }

  Future<LocalNotification> getLocalNotification(int id) async {
    final db = await database;
    final res =
        await db.query('local_notifications', where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty ? LocalNotification.fromJson(res.first) : null;
  }
}
