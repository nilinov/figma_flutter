import 'package:flutter_visible/imports.dart';

List<Json> getJsonIcon(Json json) {
  print(json['name']);
  final res = <Json>[];
  if ((json['name'] as String?)?.toUpperCase().contains('ICON') == true) {
    res.add({...json});
  } else {
    final List<List<Json>> res1 = (json['children'] as List?)?.map((e) => getJsonIcon(e as Json)).toList() ?? [];
    Future.forEach(res1, (element) => res.addAll(element as List<Json>));
  }

  return res;
}
