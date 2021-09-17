import 'package:recase/recase.dart';

String getNameByJson(Map<String, dynamic> json, { bool? isNotLowerCase }) {
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
      .split('+')
      .join('_')
      .split('%')
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

  return isNotLowerCase == true ? _name : _name.toLowerCase();
}

String getFileName(String? name) {
  if (name == null) return '';

  return name
      .split('String:')
      .join('')
      .split('Date:')
      .join('');
}
