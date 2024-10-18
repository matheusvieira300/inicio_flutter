import 'package:flutter/material.dart';

void main() {
  //todo esse código é em Dart
  runApp(const MyApp()); //tudo dentro dela vai rodar no nosso aplicativo
}

class MyApp extends StatelessWidget {
  //classe e extends, Widget é a base do Flutter,
//Existem diversos widgets diferentes no Flutter
  const MyApp({super.key}); //construtor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo', //parametros nomeados
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tarefas"),
        ), //topo
        body: ListView(
          //permite scrollar a tela
          children: [
            Task("Aprender Flutter"), //chamando o widget
            Task("Andar de Bike"),
            Task("Meditar"),
            Task("Meditar"),
            Task("Meditar"),
            Task("Meditar"),
          ],
        ),
        floatingActionButton:
            FloatingActionButton(onPressed: () {}), //função anônima
      ),
    );
  }
}

// statefull ele é dinâmico
class Task extends StatefulWidget {
  final String nome;

  const Task(this.nome, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
 
    int nivel = 0;

 //construtor
  @override
  Widget build(BuildContext context) { //na função build tudo é reescrito
    return Padding(
      // Ctrl + . para fazer wrap
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Container(
              color: Colors.blue,
              height: 140,
            ),
            Container(
              color: Colors.white,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Colors.black26,
                    width: 72,
                    height: 100,
                  ),
                  Column(
                    children: [
                      Container(
                          width:
                              200, //dentro de um container para não dar overflow
                          child: Text(
                            widget.nome,
                            style: TextStyle(
                              fontSize: 24,
                              overflow: TextOverflow
                                  .ellipsis, //coloca três pontinhos quando o texto é muito grande
                            ),
                          )),
                      Text(
                        "Nível: $nivel",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ), // chamando a váriavel nivel
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          nivel++;
                        });
                        print(nivel);
                      },
                      child: Icon(Icons.arrow_drop_up)) // Ícones
                ],
              ),
            ),
          ],
        ),
      ),
    ); //corpo;
  }
}
