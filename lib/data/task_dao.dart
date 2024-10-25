import 'package:obpc_front/components/task.dart';
import 'package:obpc_front/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  //Estático quer dizer que vai ter o mesmo valor para qualquer instância
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTEGER,'
      '$_image TEXT)';

  static const String _tablename =
      'taskTable'; //pra poder mudar no futuro o nome
  static const String _name = "name";
  static const String _difficulty = "difficulty";
  static const String _image = "image";

  save(Task tarefa) async {
    print("Iniciando o save: ");
    final Database bancoDeDados = await getDatabase();
    var itemExists = await find(tarefa.nome); //verificar se já existe esse nome
    Map<String, dynamic> taskMap = toMap(tarefa); //tarefas em versão de map
    if (itemExists.isEmpty) {
      print("A tarefa não Existia."); //se não existir insere
      return await bancoDeDados.insert(_tablename, taskMap);
    } else {
      print("A tarefa já Existia!"); //atualizar
      return await bancoDeDados.update(
        _tablename,
        taskMap,
        where: '$_name = ?',
        whereArgs: [tarefa.nome],
      );
    }
  }

  //conversão de tarefa para um map de tarefas
  Map<String,dynamic> toMap(Task tarefa){
    print("Convertendo Tarefa em Map: ");
    final Map<String, dynamic> mapDeTarefas = Map();
    mapDeTarefas[_name] = tarefa.nome;
    mapDeTarefas[_difficulty] = tarefa.dificuldade;
    mapDeTarefas[_image] = tarefa.foto;
    print("Mapa de Tarefas: $mapDeTarefas");
    return mapDeTarefas;
  }

  Future<List<Task>> findAll() async {
    print("Estamos acessando o findAll: ");
    final Database bancoDeDados =
        await getDatabase(); //vai esperar o banco ser construido para vincular
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tablename);
    //lendo do banco de dados a tabela tablename
    print("Procurando dados no banco de dados: Encontrado: $result");
    return toList(result);
  }

  //Mapper
  List<Task> toList(List<Map<String, dynamic>> mapDeTarefas) {
    print("Estamos convertendo to List: ");
    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in mapDeTarefas) {
      //pegando cada linha do map de tarefas
      final Task tarefa = Task(linha[_name], linha[_image], linha[_difficulty]);
      tarefas.add(tarefa);
    }
    print('Lista de tarefas: $tarefas');
    return tarefas;
  }

  Future<List<Task>> find(String nomeDaTarefa) async {
    print("Acessando find: ");
    final Database bancoDeDados = await getDatabase();
    //where aonde busca a informação
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
      _tablename,
      where: '$_name = ?', //aonde é equivalente ao nome
      whereArgs: [nomeDaTarefa], //aonde é equivalente ao nome da tarefa
    );
    print("Tarefa encontrada: ${toList(result)}");
    return toList(result);
  }

  delete(String nomeDaTarefa) async {}
}
