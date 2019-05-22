import 'package:http/http.dart' as http;
import 'dart:async' show Future;
import 'package:Alunos_mobile/classes/Aluno.dart';
import 'dart:convert';


String url = 
// 'https://mysterious-citadel-88157.herokuapp.com/api/alunos';
'http://paw.ic.ufmt.br/jivago/alunos-api/public/index.php/alunos';
 
Future<Aluno> getAlunoById() async{
  final response = await http.get(url, headers: {"Accept": "application/json"} );

  if (response.statusCode == 200) {
    return Aluno.fromJson(json.decode(response.body));
  }
  else{
    throw Exception('Erro ao listar');
  }
}

Future<List<Aluno>> getAlunos() async {
  final response = await http.get(url);
  print(response.body);
  return allAlunoFromJson(response.body);
}

Future<Aluno> createPost(Aluno post) async{
  final response = await http.post('$url',
      body: alunoToJson(post)
  );
  return alunoFromJson(response.body);
}