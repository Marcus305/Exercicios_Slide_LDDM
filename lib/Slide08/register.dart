import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  RegisterStatefulState createState() => RegisterStatefulState();
}

class RegisterStatefulState extends State<Register> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _born = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  String _gender = "";
  bool _emailNotify = false;
  bool _cellphone = false;
  double _fontSize = 10.0;
  bool _secret = true;
  String _label = "";

  _saveData(String key, value) async{
    final prefs = await SharedPreferences.getInstance();
    if(value is String) {
      await prefs.setString(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    }
  }

  bool _checkData() {
    if(_name.text != "") {
      if(_born.text != "") {
        if(_email.text != "") {
          if(_password.text != "") {
            if(_gender != "") {
              return true;
            }
          }
        }
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create an account"),
      ),
      drawer: const Drawer(),
      body: Center(
          child: SizedBox(
            width: 350,
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 15.0),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    maxLength: 20,
                    controller: _name,
                    decoration: InputDecoration(
                      labelText: "Nome",
                      labelStyle: TextStyle(
                        fontSize: _fontSize,
                      ),
                      filled: true,
                      fillColor: Color(0xffffffff),
                    ),
                    style: TextStyle(color: Colors.purple, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15.0),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    maxLength: 10,
                    controller: _born,
                    decoration: InputDecoration(
                      labelText: "Data de nascimento",
                      labelStyle: TextStyle(
                        fontSize: _fontSize,
                      ),
                      filled: true,
                      fillColor: Color(0xffffffff),
                    ),
                    style: TextStyle(color: Colors.purple, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15.0),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _email,
                    decoration: InputDecoration(
                      labelText: "E-mail",
                      labelStyle: TextStyle(
                        fontSize: _fontSize,
                      ),
                      filled: true,
                      fillColor: Color(0xffffffff),
                    ),
                    style: TextStyle(color: Colors.purple, fontSize: 20),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 300,
                      child: TextField(
                        obscureText: _secret,
                        maxLength: 20,
                        controller: _password,
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(
                            fontSize: _fontSize,
                          ),
                          filled: true,
                          fillColor: const Color(0xffffffff),
                        ),
                        style: const TextStyle(color: Colors.purple, fontSize: 20),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            _secret = !_secret;
                          });
                        },
                        icon:
                        Icon(_secret ? Icons.visibility : Icons.visibility_off))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Text("Gênero: Masculino",
                        style: TextStyle(fontSize: _fontSize)),
                    Radio(
                        value: "m",
                        groupValue: _gender,
                        onChanged: (String? value) {
                          setState(() {
                            _gender = value!;
                          });
                        }),
                    Text("Feminino", style: TextStyle(fontSize: _fontSize)),
                    Radio(
                        value: "f",
                        groupValue: _gender,
                        onChanged: (String? value) {
                          setState(() {
                            _gender = value!;
                          });
                        }),
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: Center(
                      child: Text("Notificações:",
                          style: TextStyle(fontSize: _fontSize))),
                ),
                SwitchListTile(
                    title: Text("E-mail", style: TextStyle(fontSize: _fontSize)),
                    value: _emailNotify,
                    onChanged: (bool? value) {
                      setState(() {
                        _emailNotify = value!;
                      });
                    }),
                SwitchListTile(
                    title: Text("Celular", style: TextStyle(fontSize: _fontSize)),
                    value: _cellphone,
                    onChanged: (bool? value) {
                      setState(() {
                        _cellphone = value!;
                      });
                    }),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ))),
                    onPressed: () {
                      print("entrou");
                      if(_checkData()) {
                        _saveData("nome", _name.text);
                        _saveData("nascimento", _born.text);
                        _saveData("email", _email.text);
                        _saveData("senha", _password.text);
                        _saveData("genero", _gender);
                        _saveData("emailNot", _emailNotify);
                        _saveData("celular", _cellphone);
                      }
                    },
                    child: Text("Register", style: TextStyle(fontSize: _fontSize)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ))),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Voltar", style: TextStyle(fontSize: _fontSize)),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text("Fontsize", style: TextStyle(fontSize: _fontSize)),
                    Slider(
                        label: _label,
                        value: _fontSize,
                        min: 10.0,
                        max: 20.0,
                        divisions: 10,
                        onChanged: (double? value) {
                          setState(() {
                            _fontSize = value!;
                            _label = "Tamanho da fonte: $value";
                          });
                        }),
                  ],
                )
              ],
            ),
          )),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Login",
          ),
        ],
      ),
    );
  }
}
