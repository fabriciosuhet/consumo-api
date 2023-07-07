import 'dart:convert';

import 'package:consumo_api/consumo_api.dart';

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
}
