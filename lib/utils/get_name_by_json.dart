import 'package:recase/recase.dart';

String getNameByJson(Map<String, dynamic> json) {
  String name = json['name'] ?? '';

  if (List.generate(9, (index) => "$index").contains(name[0])) {
    name = 'num_' + name;
  }

   final _name = name
      .split(' ')
      .join('_')
      .split(',')
      .join('_')
      .split('%')
      .join('_')
      .split('.')
      .join('_')
      .split('—')
      .join('_')
      .split('/')
      .join('_')
      .split('\\')
      .join('_')
      .split('(')
      .join('_')
      .split(')')
      .join('_')
      .split('#')
      .join('sharp_')
      .split('-')
      .join('_')
      .split('_')
      .where((e) => e != null && e != '')
      .join('_');

  return _name.toLowerCase();
}
