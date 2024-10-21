import 'package:flutter/material.dart';

void main() {
  //todo esse código é em Dart
  runApp(const MyApp()); //tudo dentro dela vai rodar no nosso aplicativo
}

class MyApp extends StatelessWidget {
  //classe e extends, Widget é a base do Flutter,
//Existem diversos widgets diferentes no Flutter
  const MyApp({super.key}); //construtor

  @override //build facilita a atualização da tela
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
          leading: Container(), //leading espaçamento no appbar
          title: const Text("Tarefas"),
        ), //topo
        body: ListView(
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
        floatingActionButton:
            FloatingActionButton(onPressed: () {}), //função anônima
      ),
    );
  }
}

// statefull ele é dinâmico
class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  const Task(this.nome, this.foto, this.dificuldade, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;

  //construtor
  @override
  Widget build(BuildContext context) {
    //na função build tudo é reescrito
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
            Column(
              children: [
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
                        child: Image.network(
                          widget.foto,
                          fit: BoxFit
                              .cover, // para aumentar a imagem para o tamanho do container
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width:
                                  200, //dentro de um container para não dar overflow
                              child: Text(
                                widget.nome,
                                style: const TextStyle(
                                  fontSize: 24,
                                  overflow: TextOverflow
                                      .ellipsis, //coloca três pontinhos quando o texto é muito grande
                                ),
                              )),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 15,
                                color: Colors.blue,
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: Colors.blue,
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: Colors.blue,
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: Colors.blue[100],
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: Colors.blue[100],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 52,
                        width: 52,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nivel++;
                            });
                            print(nivel);
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceEvenly, //espaço igual entre eles
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.arrow_drop_up),
                              Text(
                                'UP',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ), // Ícones
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(
                          8), //edge insets qual lado tenha um espaçamento
                      child: SizedBox(
                        //container para diminuir o tamanho
                        width: 200,
                        //container para diminuir o tamanho
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: nivel / 10, // 1 a barra fica completa
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        "Nível: $nivel",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ), // chamando a váriavel nivel
              ],
            ),
          ],
        ),
      ),
    ); //corpo;
  }
}
