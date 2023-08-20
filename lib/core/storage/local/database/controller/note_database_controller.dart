import 'package:note/core/constants.dart';
import 'package:note/core/storage/local/database/provider/database_operationd.dart';
import 'package:note/core/storage/local/database/provider/database_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../model/note.dart';

class NoteDatabaseController extends DataBaseOperations {
  Database database = DataBaseProvider().database;
  @override
  Future<int> Create(object) async {
    return await database.insert(
      Constants.databaseNotesTableName,
      object.toMap(),
    );
  }

  @override
  Future<bool> Delete(int id) async {
    int counter = await database.delete(Constants.databaseNotesTableName,
        where: '${Constants.databaseNotesIdColumnName} = ?', whereArgs: [id]);
    if (counter > 0) {
      return true;
    }
    return false;
  }

  @override
  Future<List<Note>> Read() async {
    List<Map<String, Object?>> data =
        await database.query(Constants.databaseNotesTableName);

    // List<Note> notes = [];
    // for (Map<String, Object?> note in data) {
    //   notes.add(Note.fromMap(note));
    // }
    // return notes;

    return data.map((row) => Note.fromMap(row)).toList();
  }

  @override
  Future<bool> Update(object) async {
    int counter = await database.update(
      Constants.databaseNotesTableName,
      object.toMap(),
      where: '${Constants.databaseNotesIdColumnName}= ?',
      whereArgs: [object.id]
    );
    return counter >0 ;
  }

  @override
  Future<Note?> show(int id) async{
    List<Map<String, Object?>> data = await database.query(
      Constants.databaseNotesTableName,
      where: '${Constants.databaseNotesIdColumnName} = ?',
      whereArgs: [id],
    );
    if (data.isNotEmpty) {
      return Note.fromMap(data.first);
    }

    return null;
  }
}
