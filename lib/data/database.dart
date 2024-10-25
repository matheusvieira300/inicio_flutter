import 'package:obpc_front/data/task_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart'; //achar o local específico para manipular arquivos

//método assincrono
Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'task.db');
  return openDatabase(path, onCreate: (db, version) {
    db.execute(TaskDao.tableSql);
  }, version: 1);
  //abrindo um database através do caminho e criando caso não exista
}

