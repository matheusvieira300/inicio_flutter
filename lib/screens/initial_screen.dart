import 'package:flutter/material.dart';
import 'package:obpc_front/data/task_inherited.dart';
import 'package:obpc_front/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(), //leading espaçamento no appbar
        title: const Text("Tarefas"),
      ), //topo
      body: ListView(
        padding: const EdgeInsets.only(top: 8, bottom: 70),
        children: TaskInherited.of(context).taskList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  //pra ter uma transição agrádavel
                  //ao clicar em um context se for um contexto diferente fica destacado
                  builder: (contextNew) => FormScreen(
                        taskContext: context,
                      ))); //colocar nova tela na stack
        },
        child: const Icon(Icons.add),
      ), //função anônima
    );
  }
}
