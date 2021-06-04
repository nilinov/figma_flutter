Variable? getNodeByVariable(Map<String, dynamic> json, String nameVariable) {
  final name = json['name'] as String;
  if (name.contains('$String:')) {
    final _name = name.split('$String:')[1];

    if (_name == nameVariable) {
      if (json['type'] == 'TEXT') {
        return Variable(defaultValue: json['characters'], name: _name, type: 'String');
      }
    }
  }

  final inChild = (json['children'] as List?)?.firstWhere((element) => getNodeByVariable(element, nameVariable) != null, orElse: () => null);

  if (inChild != null) {
    return getNodeByVariable(inChild, nameVariable);
  }

  return null;
}

class Variable {
  final dynamic defaultValue;
  final dynamic value;
  final String? name;
  final String? type;

  Variable({this.defaultValue, this.name, this.type, this.value});

  toJson() => {
    "defaultValue": defaultValue,
    "name": name,
    "type": type,
    "value": value,
  };

  @override
  String toString() => "Variable(name: $name , defaultValue: $defaultValue , type: $type , value: $value)";
}

Variable? getVariable(Map<String, dynamic> json, String nameVariable) {
  return getNodeByVariable(json, nameVariable);
}
