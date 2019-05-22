import 'package:flutter/material.dart';
import 'package:Alunos_mobile/classes/Aluno.dart';
import 'package:Alunos_mobile/services/service.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Aluno> postAluno(String url, {Map body}) async {
  return http.post(url, body: body, headers: {"Accept": "application/json"}).then((http.Response response) {
    final int statusCode = response.statusCode;
 
    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Erro");
    }
    return Aluno.fromJson(json.decode(response.body));
  });
}

class PostAlunos extends StatefulWidget {
  @override
  _PostAlunosState createState() => _PostAlunosState();
   final Future<Aluno> aluno;
  PostAlunos({Key key, this.aluno}) : super(key: key);
}

class _PostAlunosState extends State<PostAlunos> {
 

  static final CREATE_ALUNO_URL = 'http://paw.ic.ufmt.br/jivago/alunos-api/public/index.php/alunos';
  TextEditingController nomeControler = new TextEditingController();
  TextEditingController rgaControler = new TextEditingController();
  @override
  Widget build(BuildContext context) {
     return Column(
        children: <Widget>[ 
            new TextField(
                  controller: nomeControler,
                  decoration: InputDecoration(
                      hintText: "Nome", labelText: 'Nome do aluno'),
                ),
                 new TextField(
                  controller: rgaControler,
                  decoration: InputDecoration(
                      hintText: "Rga....", labelText: 'Rga do aluno'),
                ),
                new RaisedButton(
                  onPressed: () async {
                    Aluno aluno = new Aluno(
                      nome: nomeControler.text, rga: rgaControler.text);
                       createPost(aluno).then((response){
                            if(response == 200){
                             return AlertDialog(
                              title: Text('Sucesso!'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Text('Aluno cadastrado com sucesso!'),
                                  ],
                                ),
                              )
                             );
                          }
                            else
                              print(response.nome);
                       });
                    // Aluno p = await postAluno(CREATE_ALUNO_URL,
                    //     body: aluno.toJson());
                    //     print(p.nome);
                  },
                  child: const Text("Novo"),
              )                  
        ],
      );
    
  }   
  
}
