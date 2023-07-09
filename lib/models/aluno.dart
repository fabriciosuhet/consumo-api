import 'dart:convert';

import 'curso.dart';
import 'endereco.dart';

class Aluno {
  String id;
  String nome;
  int? idade;
  List<String> nomeCursos;
  Endereco endereco;
  List<Curso> cursos;

  Aluno({
    required this.id,
    required this.nome,
    required this.idade,
    required this.nomeCursos,
    required this.endereco,
    required this.cursos,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'idade': idade,
      'nomeCursos': nomeCursos,
      'endereco': endereco.toMap(),
      'cursos': cursos.map((curso) => curso.toMap()).toList(),
    };
  }

  factory Aluno.fromMap(Map<String, dynamic> map) {
    return Aluno(
      id: map['id'] ?? '',
      nome: map['nome'] ?? '',
      idade: map['idade'],
      nomeCursos: map['nomeCursos'],
      endereco: Endereco.fromMap(map['endereco']),
      cursos: map['cursos' as List<dynamic>]
          .map<Curso>((cursoMap) => Curso.fromMap(cursoMap))
          .toList(),
    );
  }

  String toJson() => jsonEncode(toMap());

  factory Aluno.fromJson(String json) {
    Map<String, dynamic> jsonMap = jsonDecode(json);
    final aluno = Aluno.fromMap(jsonMap);
    return aluno;
  }
}
