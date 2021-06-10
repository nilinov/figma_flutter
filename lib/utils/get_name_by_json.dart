String getNameByJson(Map<String, dynamic> json) {
  final String name = json['name'] ?? '';

  return name.split(' ').join('_').split('/').join('_').split('\\').join('_').split('(').join('_').split(')').join('_').split('#').join('sharp_').split('-').join('_').split('_').where((e) => e != null && e != '').join('_');
}
