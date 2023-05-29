import 'package:flutter/material.dart';

class Exercicio3_05 extends StatefulWidget {
  const Exercicio3_05({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Exercicio3_05StatefulState();
}

class _Exercicio3_05StatefulState extends State<Exercicio3_05> {
  bool _secret = true;
  String _gender = "";
  bool _email = false;
  bool _cellphone = false;
  double _fontSize = 10.0;
  String _label = "";

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
                    value: _email,
                    onChanged: (bool? value) {
                      setState(() {
                        _email = value!;
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
                    onPressed: () {},
                    child: Text("Register", style: TextStyle(fontSize: _fontSize)),
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
