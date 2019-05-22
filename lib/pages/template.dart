import 'package:flutter/material.dart';
import 'package:Alunos_mobile/pages/home.dart';
import 'package:Alunos_mobile/pages/listAlunos.dart';
import 'package:Alunos_mobile/pages/postAluno.dart';

class Template extends StatefulWidget {
  @override
  _TemplateState createState() => _TemplateState();
}

class _TemplateState extends State<Template> {
  var home = new HomeApp();
  var _selectedPages = 0;
  var list = ListAlunos();
  var post = PostAlunos();

  var _pages;

  @override
  Widget build(BuildContext context) {
    _pages = [
      home,
      list,
      post
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de alunos do Jivago"),
      ),
      body: _body(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.list), title: Text("Listar")),
          BottomNavigationBarItem(icon: Icon(Icons.person_add), title: Text("Novo"))
          
        ],
        currentIndex: _selectedPages,
        onTap: (int index){
          setState(() {
            _selectedPages = index;
          });
        },
      ),
    );
  }

  _body() {
    return Container(
      constraints: BoxConstraints.expand(),
      child: _pages[_selectedPages],
    );
  }
}
