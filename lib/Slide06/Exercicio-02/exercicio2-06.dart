import 'package:flutter/material.dart';

class Exercicio2_06 extends StatefulWidget {
  const Exercicio2_06({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Exercicio2_06StatefulState();
}

class _Exercicio2_06StatefulState extends State<Exercicio2_06> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.account_balance), label: "About")
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: const [
            HomePage(),
            AboutPage(),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget{
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/chowchow.jpg"), fit: BoxFit.cover),
      ),
      child: const Center(
        child: Text("Home Page", style: TextStyle(color: Colors.white, fontSize: 30.0)),
      ),
    );
  }
}

class AboutPage extends StatelessWidget{
  const AboutPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/chowchow2.jpg"), fit: BoxFit.cover),
      ),
      child: const Center(
        child: Text("About Page", style: TextStyle(color: Colors.white, fontSize: 30.0)),
      ),
    );
  }
}
