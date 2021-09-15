String getNameByJson(Map<String, dynamic> json) {
  String name = json['name'] ?? '';

  if (List.generate(9, (index) => "$index").contains(name[0])) {
    name = 'num_' + name;
  }

  return name
      .split(' ')
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
}

String getFileName(String? name) {
  if (name == null) return '';

  return name
      .split('String:')
      .join('')
      .split('Date:')
      .join('');
}
