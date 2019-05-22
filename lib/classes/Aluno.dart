import 'dart:convert';

Aluno alunoFromJson(String js) {
    final jsonData = json.decode(js);
    return Aluno.fromJson(jsonData);      
     
}


List<Aluno> allAlunoFromJson(String js) {
    final jsonData = json.decode(js);
    return new List<Aluno>.from(jsonData.map((x) => Aluno.fromJson(x)));       
}


String alunoToJson(Aluno data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}



class Aluno {
    String id;
    String rga;
    String nome;

    Aluno({
        this.id,
        this.rga,
        this.nome,
    });

   factory Aluno.fromJson(Map<String, dynamic> json){ 
      return Aluno(
        id: json["id"],
        rga: json["rga"],
        nome: json["nome"],
    );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "rga": rga,
        "nome": nome,
    };
}