
import 'package:pruebasilice_app/models/sqlite.dart';
import 'package:sqflite/sqflite.dart';
//import 'package:sqlite3/sqlite3.dart';
import 'package:path/path.dart';

class Operation {

  static Future <Database> _createDB() async {
    return openDatabase(
      join(await getDatabasesPath(),'activities.db'), onCreate: (db, version) {
        return db.execute("CREATE TABLE activities (id INTEGER PRIMARY KEY, Titulo TEXT, Descripcion TEXT, Fecha TEXT )");
      },version: 1);
  }

  static Future<Future<int>> insert(Activity1 activity) async{
    Database database = await _createDB(); 
    return database.insert("activities", activity.toMap());
  }

  static Future<List<Activity1>> activities() async {
    Database database = await _createDB();

   final List<Map<String,dynamic>> activitiesMap = await database.query("activities");

   for (var n in activitiesMap) {
    print("___"+n['Titulo']);     
   }

   return List.generate(activitiesMap.length, (i) => Activity1(
    id: activitiesMap[i]['id'], 
    Titulo: activitiesMap[i]['Titulo'], 
    Descripcion: activitiesMap[i]['Descripcion'], 
    Fecha: activitiesMap[i]['Fecha']
    )
    );
  }

}