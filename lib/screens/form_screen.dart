import 'package:flutter/material.dart';
import 'package:obpc_front/data/task_inherited.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key, required this.taskContext});

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<
      FormState>(); //form key globla que verifica estado de formulário

  @override
  Widget build(BuildContext context) {
    return Form(
      //verifica validações do TextFormField
      key: _formKey, //precisa de uma chave
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Nova Tarefa"),
        ),
        body: Center(
          child: SingleChildScrollView(
            // scrollview para não dar problema na caixa de dialogo
            child: Container(
              height: 650,
              width: 375,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 3), //borda que aborda todo o conteúdo
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (value != null && value.isEmpty) {
                          return 'Insira o nome da tarefa ?';
                        } else {
                          return null;
                        }
                      }, //validator serve para validar se há valor
                      controller: nameController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(), //borda no textfield
                        hintText: 'Nome',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty ||
                            int.parse(value) > 5 ||
                            int.parse(value) < 1) {
                          //verificando se não é nulo e se nãoe está vazio
                          return 'Insira uma dificuldade entre 1 e 5!';
                        } else {
                          return null;
                        }
                      },
                      keyboardType:
                          TextInputType.number, //mudar método do teclado
                      controller: difficultyController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(), //borda no textfield
                        hintText: 'Dificuldade',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      // campo de texto
                      onChanged: (text) {
                        //para verificar quando o textfiel alterar
                        setState(() {
                          //setState avisa a mudança pro statefullWidget
                        });
                      },
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Insira uma URL de imagem!';
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.url,
                      controller: imageController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(), //borda no textfield
                        hintText: 'Imagem',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 72,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2, color: Colors.blue),
                    ),
                    child: ClipRRect(
                      // para modificar borda de uma imagem
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imageController.text,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          //optional
                          return Image.asset(
                              "assets/images/nophoto.png"); //invés de mostrar o X mostra outra coisa
                        }, //identifica exceções no image network
                        fit: BoxFit
                            .cover, //para ter o espaçamento correto na imagem
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // print(nameController
                          //     .text); //para pegar o texto digitado
                          // print(int.parse(difficultyController.text)); //parse
                          // print(imageController.text);
                          TaskInherited.of(widget.taskContext).newTask(
                              nameController.text,
                              imageController.text,
                              int.parse(difficultyController.text));
                          //pegando o contexto trazido do formulário
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "Criando uma nova Tarefa!"))); // aparece quando todas as validações dão certo
                          Navigator.pop(
                              context); //voltar para o ínicio, volta a stack
                        }
                      },
                      child: const Text('Adicionar!'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
