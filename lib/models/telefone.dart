// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Telefone {
  int ddd;
  String telefone;

  Telefone({
    required this.ddd,
    required this.telefone,
  });

  // é um metodo que pega o objeto (telefone) e transforma em um Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'ddd': ddd,
      'telefone': telefone,
    };
  }

  //  é um CONSTRUTOR ele vai pegar um MAP e transformar em um objeto telefone
  factory Telefone.fromMap(Map<String, dynamic> map) {
    return Telefone(
      ddd: map['ddd'] ?? 0,
      telefone: map['telefone'] ?? '',
    );
  }

  // é um metodo que retorna uma string json do meu objeto Telefone
  String toJson() => jsonEncode(toMap());

  // é um método que baseado em uma String json retorna um objeto Telefone
  factory Telefone.fromJson(String json) {
    Map<String, dynamic> jsonMap = jsonDecode(json);
    final telefone = Telefone.fromMap(jsonMap);
    return telefone;
  }
}
