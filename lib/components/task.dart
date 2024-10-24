// statefull ele é dinâmico
import 'package:flutter/material.dart';
import 'package:obpc_front/components/difficulty.dart';

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  Task(this.nome, this.foto, this.dificuldade, {super.key});

  int nivel = 0;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {

  //método para verificar se a informação é da net
  bool assetOrNetwork() {
    if (widget.foto.contains("http")) {
      return false;
    }
    return true;
  }

  //construtor
  @override
  Widget build(BuildContext context) {
    //na função build tudo é reescrito
    return Padding(
      // Ctrl + . para fazer wrap
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            // color: Colors.blue, o box decoration já tem cor
            decoration: BoxDecoration(
              //widget para borda
              borderRadius: BorderRadius.circular(4),
              color: Colors.blue,
            ),
            height: 140,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.black26,
                      ),
                      width: 72,
                      height: 100,
                      child: ClipRRect(
                        //para usar a borda na imagem
                        borderRadius: BorderRadius.circular(4),
                        child: assetOrNetwork()
                            ? Image.asset(
                                //se for true
                                widget.foto,
                                fit: BoxFit
                                    .cover, // para aumentar a imagem para o tamanho do container
                              )
                            : Image.network(
                                widget.foto,
                                fit: BoxFit.cover,
                              ), //se for false
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
                        Difficulty(
                            difficultyLevel:
                                widget.dificuldade), //recebendo o widget
                      ],
                    ),
                    SizedBox(
                      height: 52,
                      width: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            widget.nivel++;
                          });
                          // print(nivel);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
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
                        value: (widget.dificuldade >
                                0) //se dificuldade maior que zero
                            ? (widget.nivel / widget.dificuldade) /
                                10 // se for verdadeiro
                            : 1, // 1 a barra fica completa, se não for verdadeiro
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      "Nível: ${widget.nivel}",
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ), // chamando a váriavel nivel
            ],
          ),
        ],
      ),
    ); //corpo;
  }
}
