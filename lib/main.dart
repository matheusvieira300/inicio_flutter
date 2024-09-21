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
      home: Row( //row é linha, horizontal
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start, //para ir para o ínicio
        children: [
           Container(color: Colors.red, width: 100, height: 100,),//altura e largura
          Container(color: Colors.blue, width: 50, height: 50,),
        ],
      ), //local principal aonde estará o nosso widget/objeto, pilha
    );
  }
}
