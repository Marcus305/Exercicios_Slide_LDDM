import 'package:flutter/material.dart';

class Exercicio1_05 extends StatefulWidget {
  const Exercicio1_05({Key ? key}) : super(key : key);

  @override
  State<StatefulWidget> createState() => _Exercicio1_05StatefulState();
}

class _Exercicio1_05StatefulState extends State<Exercicio1_05> {
  bool _secret = true;
  bool _remember = false;

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
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Email",
                          filled: true,
                          fillColor: Color(0xffffffff),
                        ),
                        style: TextStyle(color: Colors.purple, fontSize: 20),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 250,
                          child: TextField(
                            obscureText: _secret,
                            decoration: const InputDecoration(
                              labelText: "Password",
                              filled: true,
                              fillColor: Color(0xffffffff),
                            ),
                            style: const TextStyle(color: Colors.purple, fontSize: 20),
                          ),
                        ),
                        IconButton(
                            onPressed: (){
                              setState(() {
                                _secret = !_secret;
                              });
                            },
                            icon: Icon(_secret ? Icons.visibility : Icons.visibility_off)
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Remember me", style: TextStyle(color: Colors.white),),
                        Checkbox(
                          value: _remember,
                            fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                              if (states.contains(MaterialState.disabled)) {
                                return Colors.blue.withOpacity(.32);
                              }
                              return Colors.blue;
                            }),
                          onChanged: (bool? value) {
                            setState(() {
                              _remember = value!;
                            });
                          }
                        ),
                      ],
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
                          onPressed: (){},
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
  }

}