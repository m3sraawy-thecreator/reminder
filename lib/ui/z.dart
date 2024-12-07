// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
//
// class DatabaseHelper {
//   static final DatabaseHelper instance = DatabaseHelper._init();
//
//   static Database? _database;
//
//   DatabaseHelper._init();
//
//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDB('tasks.db');
//     return _database!;
//   }
//
//   Future<Database> _initDB(String filePath) async {
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, filePath);
//
//     return await openDatabase(path, version: 1, onCreate: _createDB);
//   }
//
//   Future _createDB(Database db, int version) async {
//     const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
//     const textType = 'TEXT NOT NULL';
//
//     await db.execute('''
//       CREATE TABLE tasks (
//         id $idType,
//         title $textType
//       )
//     ''');
//   }
//
//   Future<int> createTask(String title) async {
//     final db = await instance.database;
//     return await db.insert('tasks', {'title': title});
//   }
//
//   Future<List<Map<String, dynamic>>> readAllTasks() async {
//     final db = await instance.database;
//     return await db.query('tasks');
//   }
//
//   Future<int> updateTask(int id, String title) async {
//     final db = await instance.database;
//     return await db.update('tasks', {'title': title}, where: 'id = ?', whereArgs: [id]);
//   }
//
//   Future<int> deleteTask(int id) async {
//     final db = await instance.database;
//     return await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
//   }
// }
