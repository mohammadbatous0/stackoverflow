import 'package:sqflite/sqflite.dart';

class SqfDataBase {
  static Database? _database;
  // use to check intliaze or not
  Database? mydatabase;
  Future<Database?> get db async {
    _database ??= await initdatabase();
    return _database;
  }

  Future<Database> initdatabase() async {
    String databasepath = await getDatabasesPath();
    String path = '$databasepath/data.db';
    Database db = await openDatabase(
      path,
      onCreate: _oncreate,
      version: 1,
    );
    return db;
  }

  Future<void> _oncreate(Database db, int version) async {
    // await db.execute(
    //     'CREATE TABLE owners (id INTEGER PRIMARY KEY NOT NULL, name TEXT NOT NULL, image TEXT NOT NULL, link TEXT NOT NULL)');
    // ! cant use PRIMARY KEY becuase some time here question_id again
    await db.execute(
        'CREATE TABLE questions (question_id INTEGER  NOT NULL, title TEXT NOT NULL, tags TEXT NOT NULL, owner TEXT NOT NULL, is_answered INTEGER NOT NULL, view_count INTEGER NOT NULL, score INTEGER NOT NULL, answer_count INTEGER NOT NULL,accepted_answer_id INTEGER ,creation_date INTEGER NOT NULL, last_edit_date INTEGER , last_activity_date INTEGER NOT NULL, link TEXT NOT NULL)');
  }

  Future<List<Map<String, dynamic>>> readdata(String table) async {
    mydatabase = await db;
    List<Map<String, dynamic>> response = await mydatabase!.query(table);
    return response;
  }

  Future<int> insertData(String table, Map<String, dynamic> values) async {
    mydatabase = await db;
    int response = await mydatabase!.insert(table, values);
    return response;
  }
}
