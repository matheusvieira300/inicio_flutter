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
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Container(
          //Container sendo um objeto pai para poder mudar a cor de tudo
          color: Colors.white,
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.spaceEvenly, //espaço equilibrado
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    color: Colors.red,
                    width: 100,
                    height: 100,
                  ), //altura e largura
                  Container(
                    color: Colors.blue,
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    color: Colors.blue,
                    width: 100,
                    height: 100,
                  ), //altura e largura
                  Container(
                    color: Colors.red,
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
              Row(
                //linha deixando um do lado do outro espaçado igualmente
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.cyan,
                    height: 50,
                    width: 50,
                  ),
                  Container(
                    color: Colors.pinkAccent,
                    height: 50,
                    width: 50,
                  ),
                  Container(
                    color: Colors.purple,
                    height: 50,
                    width: 50,
                  ),
                ],
              ),
              Container(
                color: Colors.amber,
                height: 30,
                width: 300,
                child: Text(
                  'Diamante Amarelo',
                  style: TextStyle(
                    //estilo do texto
                    color: Colors.black,
                    fontSize: 28, //tamanho
                  ),
                  textAlign: TextAlign.center, //para deixar o texto no centro
                ),
              ), //child para escrever dentro de um container
              ElevatedButton(
                onPressed: () {
                  print('Você apertou o Botão');
                },
                child: Text('Aperte o Botão!'),
              ), // botão, mais função anonima
            ],
          ),
        ) //local principal aonde estará o nosso widget/objeto, pilha
        );
  }
}
