import 'package:sqflite/sqflite.dart';

const CLASSROOM_TABLE = "class_room_db";

abstract class ClassRoomDB {
  static String getCreateSQL() {
    return '''CREATE TABLE $CLASSROOM_TABLE (
      id INTEGER PRIMARY KEY,
      name TEXT not null,      
      createDate TEXT,      
      tuition INTEGER,      
      isOpen INTEGER,          
      softIndex INTEGER,
      image TEXT      
      )''';
  }

  Future<List<Map<String, Object?>>> getAllClassRoom();
  Future<bool> isExist(int id);
  Future<int> insertOrUpdate(Map<String, Object?> values);
  Future<int> insert(Map<String, Object?> values);
  Future<int> update(Map<String, Object?> values);
}

class ClassRoomDBImpl extends ClassRoomDB {
  final Database _;
  final table = CLASSROOM_TABLE;
  ClassRoomDBImpl(this._);

  @override
  Future<List<Map<String, Object?>>> getAllClassRoom() async {
    return await _.query(table);
  }

  @override
  Future<int> insertOrUpdate(Map<String, Object?> values) async {
    final id = values['id'] as int?;
    if (id == null || !await isExist(id)) {
      return insert(values);
    } else {
      return update(values);
    }
  }

  @override
  Future<bool> isExist(int id) async {
    return (await _.query(table, where: 'id = $id')).isNotEmpty;
  }

  @override
  Future<int> insert(Map<String, Object?> values) async {
    return await _.insert(table, values);
  }

  @override
  Future<int> update(Map<String, Object?> values) async {
    return await _.update(table, values);
  }
}
