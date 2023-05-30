import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Home extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => TelaBD();


}

class TelaBD extends State<Home>{
  Future<Database> _recuperarBancoDados() async {
    final caminhoBD = await getDatabasesPath();
    final localBD = join(caminhoBD, "banco.bd");
    return openDatabase(
        localBD,
        version: 1,
        onCreate: (db, dbVersaoRecente) {
          String sql = "CREATE TABLE usuarios ("
              "id INTEGER PRIMARY KEY AUTOINCREMENT, "
              "nome VARCHAR, idade INTEGER";
          db.execute(sql);
        }
    );
    //print("Aberto " + retorno.isOpen.toString());

  }

  _salvarDados(String nome, int idade) async {
    Database bd = await _recuperarBancoDados();
    print("Aberto " + bd.toString());
    Map<String, dynamic> dadosUsuario = {
      "nome" : nome,
      "idade" : idade,
    };
    int id = await bd.insert("usuarios", dadosUsuario);
    print("Salvo: $id ");
  }

  _listarUsuarios() async {
    Database bd = await _recuperarBancoDados();
    String sql = "SELECT * FROM usuarios";
    List usuarios = await bd.rawQuery(sql);
    for(var usu in usuarios) {
      print(" id "+usu['id'].toString() +
      " nome: "+usu['nome']+
      " idade: "+usu['idade'].toString());
    }
  }

  _listarUmUsuarios(int id) async {
    Database bd = await _recuperarBancoDados();
    List usuarios = await bd.query(
      "usuarios",
      columns: ["id", "nome", "idade"],
      where: "id = ?",
      whereArgs: [id]
    );
    for(var usu in usuarios) {
      print(" id "+usu['id'].toString() +
          " nome: "+usu['nome']+
          " idade: "+usu['idade'].toString());
    }
  }

  _excluirUsuario(int id) async {
    Database bd = await _recuperarBancoDados();
    int retorno = await bd.delete(
        "usuarios",
        where: "id = ?",
        whereArgs: [id]
    );
    print("Itens excluidos: "+retorno.toString());
  }

  _atualizarUsuario(int id, String nome, int idade) async {
    Database bd = await _recuperarBancoDados();
    Map<String, dynamic> dadosUsuario = {
      "nome" : nome,
      "idade" : idade,
    };
    int retorno = await bd.update(
        "usuarios", dadosUsuario,
        where: "id = ?",
        whereArgs: [id]
    );
    print("Itens atualizados: "+retorno.toString());
  }

  TextEditingController _nome = TextEditingController();
  TextEditingController _idade = TextEditingController();
  TextEditingController _id = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 46.0, left: 16, right: 16, bottom: 16),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              controller: _nome,
              decoration: const InputDecoration(
                labelText: "Digite o nome",
                filled: true,
                fillColor: Color(0xffffffff),
              ),
              style: const TextStyle(color: Colors.purple, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              controller: _idade,
              decoration: const InputDecoration(
                labelText: "Digite a idade",
                filled: true,
                fillColor: Color(0xffffffff),
              ),
              style: const TextStyle(color: Colors.purple, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              controller: _id,
              decoration: const InputDecoration(
                labelText: "Digite um id",
                filled: true,
                fillColor: Color(0xffffffff),
              ),
              style: const TextStyle(color: Colors.purple, fontSize: 20),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _salvarDados(_nome.text, int.parse(_idade.text));
            },
            child: const Text("Salvar um usuário"),
          ),
          ElevatedButton(
            onPressed: () {
              _listarUsuarios();
            },
            child: const Text("Listar todos os usuários"),
          ),
          ElevatedButton(
            onPressed: () {
              _listarUmUsuarios(_id.text as int);
            },
            child: const Text("Listar um usuário"),
          ),
          ElevatedButton(
            onPressed: () {
              _atualizarUsuario(_id.text as int, _nome.text, _idade.text as int);
            },
            child: const Text("Atualizar um usuário"),
          ),
          ElevatedButton(
            onPressed: () {
              _excluirUsuario(_id.text as int);
            },
            child: const Text("Excluir um usuário"),
          ),
        ],
      ),
    );
  }

}