import 'package:flutter/material.dart';
import 'package:obpc_front/components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen
  ({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {

  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Container(), //leading espaçamento no appbar
          title: const Text("Tarefas"),
        ), //topo
        body: AnimatedOpacity(
          opacity: opacidade ? 1 : 0, //pra ser visível, se sim 1 senão 0
          duration: const Duration(
            milliseconds: 800,
          ),
          child: ListView(
            //permite scrollar a tela
            children: const [
              Task(
                  'Aprender Flutter',
                  'assets/images/dash.png',
                  3), //chamando o widget
              Task(
                  'Andar de Bike',
                  'assets/images/bike.webp',
                  2),
              Task(
                  'Meditar',
                  'assets/images/meditar.jpeg',
                  5),
              Task(
                  'Ler',
                  'assets/images/livro.jpg',
                  4),
              Task('Jogar',
                  'assets/images/jogar.jpg', 1),
              SizedBox(height: 80,)
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              opacidade = !opacidade; //contrário 0
            });
          },
          child: const Icon(Icons.remove_red_eye),
        ), //função anônima
      );
  }
}
