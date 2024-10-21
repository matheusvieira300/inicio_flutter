import 'package:flutter/material.dart';
import 'package:obpc_front/task.dart';

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
          duration: Duration(
            milliseconds: 800,
          ),
          child: ListView(
            //permite scrollar a tela
            children: [
              Task(
                  'Aprender Flutter',
                  'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
                  3), //chamando o widget
              Task(
                  'Andar de Bike',
                  'https://images.pexels.com/photos/161172/cycling-bike-trail-sport-161172.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  2),
              Task(
                  'Meditar',
                  'https://manhattanmentalhealthcounseling.com/wp-content/uploads/2019/06/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg',
                  5),
              Task(
                  'Ler',
                  'https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg',
                  4),
              Task('Jogar',
                  'https://i.ibb.co/tB29PZB/kako-epifania-2022-2-c-pia.jpg', 1),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              opacidade = !opacidade; //contrário 0
            });
          },
          child: Icon(Icons.remove_red_eye),
        ), //função anônima
      );
  }
}
