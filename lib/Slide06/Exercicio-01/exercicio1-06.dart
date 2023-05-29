import 'package:exercicios/Slide05/Exercicio-03/exercicio3-05.dart';
import 'package:flutter/material.dart';

class Exercicio1_06 extends StatelessWidget {
  const Exercicio1_06({Key ? key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const Drawer(),
      body: Center(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/chowchow.jpg"), fit: BoxFit.cover),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 15.0),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Email",
                          filled: true,
                          fillColor: Color(0xffffffff),
                        ),
                        style: TextStyle(color: Colors.purple, fontSize: 20),
                      ),
                    ),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: "Password",
                        filled: true,
                        fillColor: Color(0xffffffff),
                      ),
                      style: TextStyle(color: Colors.purple, fontSize: 20),
                    ),
                    ElevatedButton(
                      onPressed: (){},
                      child: const Text("Enter"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("New here?", style: TextStyle(color: Colors.white),),
                        TextButton(
                          onPressed: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Exercicio3_05()),
                            );
                          },
                          child: const Text("Create an account", style: TextStyle(color: Colors.green),),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home",),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Login",),
        ],
      ),
    );
    throw UnimplementedError();
  }

}