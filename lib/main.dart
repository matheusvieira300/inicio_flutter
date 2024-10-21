import 'package:flutter/material.dart';
import 'package:obpc_front/initial_screen.dart';

void main() {
  //todo esse código é em Dart
  runApp(MyApp()); //tudo dentro dela vai rodar no nosso aplicativo
}

class MyApp extends StatefulWidget {
  //classe e extends, Widget é a base do Flutter,
//Existem diversos widgets diferentes no Flutter
  MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //construtor
  @override //build facilita a atualização da tela
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo', //parametros nomeados
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: InitialScreen(),
    );
  }
}