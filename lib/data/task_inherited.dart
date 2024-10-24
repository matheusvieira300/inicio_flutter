import 'package:flutter/material.dart';
import 'package:obpc_front/components/task.dart';

class TaskInherited extends InheritedWidget {
   TaskInherited({
    super.key,
    required super.child,
  });

  final List<Task> taskList = [ 
         Task('Aprender Flutter', 'assets/images/dash.png', 3), //chamando o widget
         Task('Andar de Bike', 'assets/images/bike.webp', 2),
         Task('Meditar', 'assets/images/meditar.jpeg', 5),
         Task('Ler', 'assets/images/livro.jpg', 4),
         Task('Jogar', 'assets/images/jogar.jpg', 1),]; //lista dinâmica

    void newTask(String name, String photo, int difficulty){
      taskList.add(Task(name, photo, difficulty));
    }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
        //depende do contexto do inheritedWidget e o tipo taskInhrited
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override //ele quem fica de olho no estado da informação no caso a lista
  bool updateShouldNotify(TaskInherited old) {
    return old.taskList.length != taskList.length;
    //verificando se o tamanho é diferente do atual e assim será true notificará todo mundo
    //se apenas true ele notifica todo mundo
  }
}
