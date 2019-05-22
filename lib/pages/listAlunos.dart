import 'package:flutter/material.dart';
import 'package:Alunos_mobile/classes/Aluno.dart';
import 'package:Alunos_mobile/services/service.dart';

class ListAlunos extends StatefulWidget {
  @override
  _ListAlunosState createState() => _ListAlunosState();
  final Future<Aluno> aluno;
  ListAlunos({Key key, this.aluno}) : super(key: key);
}

class _ListAlunosState extends State<ListAlunos> {
  @override
  Widget build(BuildContext context) {
    var alunos = getAlunos();

    return Column(
      children: <Widget>[
        FutureBuilder(          
            future: alunos,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done)
                //  return listAluno(snapshot.data);     
                return scrollAlunos(snapshot.data);
              else  
                return Column(
                  children: <Widget>[
                      Text("carregando dados..."),
                      Icon(Icons.refresh, size: 50,)
                  ],
                );     
            }
        )
      ],
    );
  }
}


scrollAlunos(List<Aluno> _aluno){
  return Column(
    children: <Widget>[
      Scrollbar(
         child: ListView.builder(
          shrinkWrap: true,
          itemCount: _aluno.length,
          itemBuilder: (context, index){
            return ListTile(  
              title:  Text('Nome: '+_aluno[index].nome),
              subtitle: Text('Rga: '+_aluno[index].rga),
              leading: Icon(Icons.people),
            );  
          }
        ), 
      ) 
    ],
  );
}