String getNameByJson(Map<String, dynamic> json) {
  final String name = json['name'] ?? '';

  return name.split(' ').join('_').split('/').join('_').split('\\').join('_');
}
