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
      home: Stack( //com stack dá pra empilhar vários containers
      alignment: AlignmentDirectional.center,//alinhando no centro a Stack
        children: [
          Container(color: Colors.white, width: 125, height: 125,),//altura e largura
          Container(color: Colors.black, width: 100, height: 100,),//altura e largura
          Container(color: Colors.red, width: 75, height: 75,),//altura e largura
          Container(color: Colors.blue, width: 50, height: 50,),
          Container(color: Colors.yellow, width: 25, height: 25,)
        ],
      ), //local principal aonde estará o nosso widget/objeto, pilha
    );
  }
}
