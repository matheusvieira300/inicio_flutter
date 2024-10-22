import 'package:flutter/material.dart';
import 'package:obpc_front/components/task.dart';
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
        //permite scrollar a tela
        children: const [
          Task('Aprender Flutter', 'assets/images/dash.png',
              3), //chamando o widget
          Task('Andar de Bike', 'assets/images/bike.webp', 2),
          Task('Meditar', 'assets/images/meditar.jpeg', 5),
          Task('Ler', 'assets/images/livro.jpg', 4),
          Task('Jogar', 'assets/images/jogar.jpg', 1),
          SizedBox(
            height: 80,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute( //pra ter uma transição agrádavel
                  builder: (context) =>
                      const FormScreen())); //colocar nova tela na stack
        },
        child: const Icon(Icons.add),
      ), //função anônima
    );
  }
}
