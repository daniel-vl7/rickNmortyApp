import 'package:exam_practice_rm/database/app_database.dart';
import 'package:exam_practice_rm/models/character.dart';
import 'package:sqflite/sqflite.dart';

class CharacterDao{

  insert(Character character) async{
    Database db = await AppDatabase().openDb();
    await db.insert(AppDatabase().tableName, character.toMap());
  }

  delete(Character character) async{
    Database db = await AppDatabase().openDb();
    await db.delete(AppDatabase().tableName, where: "id = ?", whereArgs: [character.id]);
  }

  Future<bool> isFavorite(Character character) async{
    Database db = await AppDatabase().openDb();

    List<Map<String, dynamic>> maps = await db.query(
      AppDatabase().tableName, where: "id = ?", whereArgs: [character.id],
    );

    return maps.isNotEmpty;
  }

  Future<List<Character>> getAll() async{
    Database db = await AppDatabase().openDb();
    
    List<Map<String, dynamic>> maps = await db.query(AppDatabase().tableName);

    print(maps);
    return maps.map((map) => Character.fromMap(map)).toList();
  }
}