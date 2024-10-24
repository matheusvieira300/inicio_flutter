import 'package:flutter/material.dart';
import 'package:obpc_front/data/task_inherited.dart';
import 'package:obpc_front/screens/initial_screen.dart';

void main() {
  //todo esse código é em Dart
  runApp(const MyApp()); //tudo dentro dela vai rodar no nosso aplicativo
}

class MyApp extends StatelessWidget {
  //classe e extends, Widget é a base do Flutter,
//Existem diversos widgets diferentes no Flutter
  const MyApp({super.key});
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
      home: TaskInherited(child: const InitialScreen()),
    );
  }
}