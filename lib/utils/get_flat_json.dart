import 'package:flutter_visible/imports.dart';

List<Map<String, dynamic>> getFlatJson(Map<String, dynamic> json, {@required List<Map<String, dynamic>> result}) {
  if (json['children'] is List) {
    final items = (json['children'] as List).map((element) => getFlatJson(element, result: [...result])).toList();
    for(var i=0; i<items.length; i++) {
      result.addAll(items[i]);
    }
  }

  return [...result, json];
}
