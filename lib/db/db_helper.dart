import 'package:reminder/models/Task.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper{
  static Database? _db;
  static final int _version = 1;
  static final String _tableName='tasks';

  static Future<void> initdb()async{
    if (_db!= null){
      return;
    }
    try {
      String _path = await getDatabasesPath() + 'task.db';
      _db = await openDatabase(
        _path,
        version: _version,
        onCreate: (db, version) {
          print('creating a new one');
          return db.execute(
            'CREAT TABLE $_tableName('
                'id INTEGER PRIMARY KEY AUOTINCREMENT,'
                'title STRING, note TEXT, date STRING,'
                'startTime STRING, endTime STRING,'
                'iscCompleted INTEGER',
          );
        },
      );
    }catch (e){
      print(e);
    }
  }
  static Future<int> insert(Task? task) async{
    print('isert function called');
    return await _db!.insert(_tableName, task!.toJson());
  }
  static Future<List<Map<String, dynamic>>> query() async {
    print('query dfunction called');
    return await _db!.query(_tableName);
  }
}