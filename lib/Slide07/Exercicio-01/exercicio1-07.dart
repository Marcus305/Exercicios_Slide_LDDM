import 'package:flutter/material.dart';

class Exercicio1_07 extends StatefulWidget {
  const Exercicio1_07({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Exercicio1_07StatefulState();
}

class _Exercicio1_07StatefulState extends State<Exercicio1_07> {

  @override
  Widget build(BuildContext context) {
    String name = ModalRoute.of(context)?.settings.arguments as String;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Bem vindo(a) $name"),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Alerta"),
                            titleTextStyle: const TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                            ),
                            content: Text("Você clicou no item ${index+1}"),
                            actions: <Widget>[
                              FilledButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Sim")
                              ),
                              FilledButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Não")
                              )
                            ],
                          );
                        }
                    );
                  },
                  title: Text("Item ${index+1}"),
                  subtitle: Text("Description ${index+1}"),
                );
              }
          ),
        )
      ),
    );
  }
}