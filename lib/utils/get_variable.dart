import 'package:flutter_visible/imports.dart';

Variable? getNodeByVariable(Map<String, dynamic> json, String nameVariable,
    {required bool inCodeVariable, required String? template}) {
  final name = json['name'] as String;
  if (name.contains('$String:')) {
    final _name = name.split('$String:')[1];

    if (_name == nameVariable) {
      if (json['type'] == 'TEXT') {
        return Variable(
            defaultValue: json['characters'],
            name: _name,
            type: 'String',
            inCodeVariable: inCodeVariable,
            template: template);
      }
    }
  }

  final inChild = (json['children'] as List?)?.firstWhere(
      (element) =>
          getNodeByVariable(element, nameVariable,
              inCodeVariable: inCodeVariable, template: template) !=
          null,
      orElse: () => null);

  if (inChild != null) {
    return getNodeByVariable(inChild, nameVariable,
        inCodeVariable: inCodeVariable, template: template);
  }

  return null;
}

class Variable {
  final dynamic defaultValue;
  final dynamic value;
  final String? name;
  final String? type;
  final String? template;
  final bool inCodeVariable;

  Variable(
      {this.defaultValue,
      this.name,
      this.type,
      this.value,
      this.inCodeVariable = false,
      this.template});

  toJson() => {
        "defaultValue": defaultValue,
        "name": name,
        "type": type,
        "value": value,
      };

  @override
  String toString() =>
      "Variable(name: $name , defaultValue: $defaultValue , type: $type , value: $value)";
}

Variable? getVariable(Map<String, dynamic> json, String nameVariable,
    {required bool inCodeVariable, String? template}) {
  return getNodeByVariable(json, nameVariable,
      inCodeVariable: inCodeVariable, template: template);
}

List<Variable> getAllVariables(Map<String, dynamic> json, {required bool inCodeVariable, String? template}) {
  final flatJson = getFlatJson(json, result: []);

  final listNodeWithVariables = flatJson
      .where((element) => (element['name'] as String).contains('String:'))
      .map((e) => [e['name'].split('String:')[1], e])
      .toList();

  var res1 = listNodeWithVariables
      .map((List element) => getNodeByVariable(element[1], element[0],
          inCodeVariable: inCodeVariable, template: template))
      .toList();

  var res = <Variable>[];

  Future.forEach(res1.where((e) => e is Variable).toList(), (element) => res.add(element as Variable));

  return res;
}

String getParamsWithVariables(List<Variable> variables) {
  return variables.map((e) => '${e.name}: "${e.value ?? e.defaultValue}"').join(', ');
}

String getDeclareWithVariables(List<Variable> variables) {
  return variables.map((e) => "final ${e.type} ${e.name};").join('\n');
}
