import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart'; //achar o local específico para manipular arquivos

//método assincrono
Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'task.db');
  return openDatabase(path, onCreate: (db, version) {
    db.execute(tableSql);
  }, version: 1);
  //abrindo um database através do caminho e criando caso não exista
}

const String tableSql = 'CREATE TABLE $_tablename('
    '$_name TEXT, '
    '$_difficulty INTEGER,'
    '$_image TEXT)';

const String _tablename = 'taskTable'; //pra poder mudar no futuro o nome
const String _name = "name";
const String _difficulty = "difficulty";
const String _image = "image";
