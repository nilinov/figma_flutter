import 'package:flutter_visible/json_text.dart';

import 'imports.dart';

import 'dart:js' as js;


Future<String> getData() async {
  if (AppEnv.fromAssets) {
    // return json_text;

    return await rootBundle.loadString('assets/data.json');
  }

  var res = js.context.callMethod('getData');
  while (res.isEmpty) {
    print('read data...');
    try {
      res = js.context.callMethod('getData');
    } catch (e) {
      print('error read');
    }
    await Future.delayed(Duration(seconds: 1));
  }
  print({res});
  return res as String;
}






