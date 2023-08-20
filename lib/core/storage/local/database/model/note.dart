import 'package:note/core/constants.dart';

class Note {
  late int id;
  late String content;
  late String title;

  Note();
  Note.fillData({
    required int id,
    required String content,
    required String title,
  });

  Note.fromMap(Map<String ,dynamic> map){
    id = map[Constants.databaseNotesIdColumnName];
    content = map[Constants.databaseNotesContentColumnName];
    title = map[Constants.databaseNotesTitleColumnName];
  }

  Map<String,dynamic> toMap (){
    return <String ,dynamic>{
      Constants.databaseNotesIdColumnName :id,
      Constants.databaseNotesContentColumnName :content,
      Constants.databaseNotesTitleColumnName:title
    };
  }
}
