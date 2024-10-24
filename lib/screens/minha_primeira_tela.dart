import 'package:flutter/material.dart';

class MyFirstWidget extends StatelessWidget {
  const MyFirstWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          //Container sendo um objeto pai para poder mudar a cor de tudo
          color: Colors.white,
          child: Column(
            mainAxisAlignment: // eixo principal do widget
                MainAxisAlignment.spaceEvenly, //espaço equilibrado
            crossAxisAlignment: CrossAxisAlignment.center, // cross horizontal
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(// no container não há o risco de ocorrer o erro 
//overflowed porque o container só ocupa o espaço do widget não podendo ser infinito
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
                child: const Text(
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
                  // print('Você apertou o Botão');
                },
                child: const Text('Aperte o Botão!'),
              ), // botão, mais função anonima
            ],
          ),
        ); //local principal aonde estará o nosso widget/objeto, pilha
  }
}