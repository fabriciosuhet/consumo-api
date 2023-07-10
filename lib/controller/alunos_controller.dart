import 'package:consumo_api/models/aluno.dart';
import 'package:consumo_api/models/cidade.dart';
import 'package:consumo_api/models/curso.dart';
import 'package:consumo_api/models/endereco.dart';
import 'package:consumo_api/models/telefone.dart';
import 'package:consumo_api/repositories/alunos_repository.dart';

class AlunosController {
  final _alunosRepository = AlunosRepository();

  Future<void> findAll() async {
    final alunos = await _alunosRepository.findAll();

    alunos.forEach(print);
  }

  Future<void> findById(String id) async {
    final aluno = await _alunosRepository.findById(id);
    print(aluno);
  }

  Future<void> update() async {
    final aluno = await _alunosRepository.findById("1");

    aluno.nomeCursos.add('Imersão Shelf');
    _alunosRepository.update(aluno);

    final alunoAlterado = await _alunosRepository.findById("1");
    print(alunoAlterado.nome);
    print('Tem os cursos:');
    print(alunoAlterado.nomeCursos);
  }

  Future<void> insert() async {
    final aluno = Aluno(
      nome: "Fabrício Silva",
      idade: 32,
      nomeCursos: ["Academia do Flutter"],
      endereco: Endereco(
          rua: "Rua tal",
          numero: 157,
          cep: "1234567",
          cidade: Cidade(
            id: 1,
            nome: "Psul",
          ),
          telefone: Telefone(
            ddd: 61,
            telefone: "40028922",
          )),
      cursos: [
        Curso(id: 1, nome: "Academia do Flutter", isAluno: true),
        Curso(id: 2, nome: "Imersão GetX", isAluno: false),
      ],
    );

    _alunosRepository.insert(aluno);
  }
}
