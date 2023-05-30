import 'package:exercicios/Slide07/Exercicio-01/exercicio1-07.dart';
import 'package:exercicios/Slide07/Exercicio-02/exercicio2-07.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Exercicio2_07(),
      initialRoute: "/",
      routes: {
        "/exercicio1" : (context) => const Exercicio1_07()
      },
    ),
  );
}

//o exercicio2-06 em qual das telas é pra fazer
