import 'package:exercicios/Slide05/Exercicio-03/exercicio3-05.dart';
import 'package:exercicios/Slide06/Exercicio-02/exercicio2-06.dart';
import 'package:exercicios/Slide08/register.dart';
import 'package:exercicios/Slide08/welcome.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key ? key}) : super(key : key);

  @override
  State<StatefulWidget> createState() => LoginStatefulState();
}

class LoginStatefulState extends State<Login> {
  bool _secret = true;
  bool _remember = false;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  String _username = "";

  _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    if(prefs.getString("email") == _email.text && prefs.getString("senha") == _password.text) {
      print("entrei");
      _username = prefs.getString("nome") ?? "Erro";
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const Drawer(),
      body: Center(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/chowchow2.jpg"), fit: BoxFit.cover),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 15.0),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _email,
                        decoration: const InputDecoration(
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
                            controller: _password,
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
                      onPressed: () async {
                        _loadData();
                        if(await _loadData()) {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Welcome(_username))
                          );
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  title: Text("Dados inválidos"),
                                  titleTextStyle: TextStyle(
                                    fontSize: 20,
                                    color: Colors.red,
                                  ),
                                  content: Text("Usuário e/ou senha incorreto(a)"),
                                );
                              }
                          );
                        }
                      },
                      child: const Text("Enter"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("New here?", style: TextStyle(color: Colors.white),),
                        TextButton(
                          onPressed: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Register()),
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
  }

}