// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

import 'imports.dart';

Future<String> getData(bool isAssets) async {
  if (isAssets) {
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
  // print({res});
  return res as String;
}
