import 'package:exercicios/Slide07/Exercicio-01/exercicio1-07.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Welcome extends StatefulWidget {
  String? username;
  Welcome(String this.username, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => WelcomeStatefulState();
}

class WelcomeStatefulState extends State<Welcome> {
  
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "List"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: [
            HomePage(widget.username as String),
            List(),
            Profile(),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget{
  String username;
  HomePage(String this.username, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/chowchow.jpg"), fit: BoxFit.cover),
      ),
      child: Center(
        child: Text("Bem vindo(a) ${username}", style: TextStyle(color: Colors.white, fontSize: 30.0)),
      ),
    );
  }
}

class List extends StatefulWidget {
  const List({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ListStatefulState();
}

class ListStatefulState extends State<List> {

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Bem vindo(a)"),
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

class Profile extends StatefulWidget{
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController _nome = TextEditingController();

  TextEditingController data = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController genero = TextEditingController();

  TextEditingController emailNot = TextEditingController();

  TextEditingController celular = TextEditingController();

  _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    _nome.text = prefs.getString("nome")!;
    data.text = prefs.getString("nascimento")!;
    email.text = prefs.getString("email")!;
    genero.text = prefs.getString("genero")!;
    if(prefs.getBool("emailNot")!) {
      emailNot.text = "Ativado";
    } else {
      emailNot.text = "Desativado";
    }
    if(prefs.getBool("celular")!) {
      celular.text = "Ativado";
    } else {
      celular.text = "Desativado";
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    _loadData();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/chowchow2.jpg"), fit: BoxFit.cover),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Nome: ${_nome.text}", style: TextStyle(fontSize: 20.0, color: Colors.white)),
            Text("Data de nascimento: ${data.text}", style: TextStyle(fontSize: 20.0, color: Colors.white)),
            Text("Email: ${email.text}", style: TextStyle(fontSize: 20.0, color: Colors.white)),
            Text("Gênero: ${genero.text}", style: TextStyle(fontSize: 20.0, color: Colors.white)),
            Text("Notificações no email: ${emailNot.text}", style: TextStyle(fontSize: 20.0, color: Colors.white)),
            Text("Notificações no celular: ${celular.text}", style: TextStyle(fontSize: 20.0, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}


