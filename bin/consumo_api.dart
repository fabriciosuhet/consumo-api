import 'dart:convert';

import 'package:consumo_api/models/telefone.dart';



void main(List<String> args) {
  final cidadeJson = '''
    [{
        "id": 1,
        "nome": "Vicente Pires"
    },
    {
        "id": 2,
        "nome": "Taguatinga Sul"
    }]
''';

  // [] => List
  // {} => Map<String, dynamic>

  final cidadeMap = jsonDecode(cidadeJson);
  print(cidadeMap.runtimeType);
  for (var city in cidadeMap) {
    print(city["nome"]);
  }
  // print(cidadeMap['nome']);

  final telefoneJson = ''' 
  {
    "ddd": 61,
    "telefone": "888888888"
  }
  ''';

  final telefone = Telefone.fromJson(telefoneJson);
  print(telefone.ddd);
  print(telefone.telefone);

}
