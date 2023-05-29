import 'package:flutter/material.dart';

class Exercicio2_05 extends StatefulWidget {
  const Exercicio2_05({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Exercicio2_05StatefulState();
}

class _Exercicio2_05StatefulState extends State<Exercicio2_05> {
  bool _secret = true;
  String _gender = "";
  bool _email = false;
  bool _cellphone = false;
  double _fontSize = 20.0;

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
                const Padding(
                  padding: EdgeInsets.only(bottom: 15.0),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    maxLength: 20,
                    decoration: InputDecoration(
                      labelText: "Nome",
                      filled: true,
                      fillColor: Color(0xffffffff),
                    ),
                    style: TextStyle(color: Colors.purple, fontSize: 20),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 15.0),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    maxLength: 10,
                    decoration: InputDecoration(
                      labelText: "Data de nascimento",
                      filled: true,
                      fillColor: Color(0xffffffff),
                    ),
                    style: TextStyle(color: Colors.purple, fontSize: 20),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 15.0),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "E-mail",
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
                        decoration: const InputDecoration(
                          labelText: "Password",
                          filled: true,
                          fillColor: Color(0xffffffff),
                        ),
                        style: const TextStyle(
                            color: Colors.purple, fontSize: 20),
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
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start, children: [
                    const Text("Gênero:   Masculino"),
                    Radio(
                        value: "m",
                        groupValue: _gender,
                        onChanged: (String? value) {
                          setState(() {
                            _gender = value!;
                          });
                        }),
                    const Text("Feminino"),
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
                const Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: Center(child: Text("Notificações:")),
                ),
                SwitchListTile(
                    title: const Text("E-mail"),
                    value: _email,
                    onChanged: (bool? value) {
                      setState(() {
                        _email = value!;
                      });
                    }),
                SwitchListTile(
                    title: const Text("Celular"),
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
                        shape: MaterialStateProperty.all<
                            RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            )
                        )
                    ),
                    onPressed: () {},
                    child: const Text("Register"),
                  ),
                ),
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
