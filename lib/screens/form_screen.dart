import 'package:flutter/material.dart';
import '../inherited/TaskInherited.dart';

class FormScreen extends StatefulWidget {
  FormScreen({required this.formContext, super.key});

  BuildContext formContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController levelController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  
  bool checkStringValidator(String? value) {
    return value!.isEmpty;
  }
  
  bool checkIntValidator(String? value) {
    return checkStringValidator(value) 
        || (int.parse(value!) < 1) 
        || (int.parse(value) > 5);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: const Text(
            "Nova tarefa",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                width: 375,
                height: 650,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                      width: 3,
                    ),
                    color: Colors.black12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Nome",
                            fillColor: Colors.white70,
                            filled: true),
                        validator: (value) {
                          if (checkStringValidator(value)) {
                            return "Insira o nome da tarefa";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: levelController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Dificuldade",
                            fillColor: Colors.white70,
                            filled: true),
                        validator: (value) {
                          if (checkIntValidator(value)) {
                            return "Insira um valor entre 1 e 5";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onChanged: (text) {
                          setState(() {});
                        },
                        controller: imageController,
                        keyboardType: TextInputType.url,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Imagem",
                            fillColor: Colors.white70,
                            filled: true),
                        validator: (value) {
                          if (checkStringValidator(value)) {
                            return "Insira uma URL válida";
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      width: 72,
                      height: 100,
                      color: Colors.blue,
                      child: Image.network(
                        imageController.text,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return Image.asset("assets/images/nophoto.png");
                        },
                        fit: BoxFit.cover,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          TaskInherited.of(widget.formContext).addTask(
                              nameController.text,
                              imageController.text,
                              int.parse(levelController.text));
                          ScaffoldMessenger.of(context)
                              .showSnackBar(
                                (const SnackBar(
                                    content: Text("Salvando nova tarefa"))),
                              )
                              .closed
                              .then((SnackBarClosedReason reason) {
                            Navigator.pop(context);
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text(
                        'Adicionar',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
