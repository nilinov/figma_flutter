// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

import 'package:flutter_visible/imports.dart';
import 'package:flutter_visible/utils/download_abs.dart';

class Downloaded implements DownloadedAbs {
  static downloadWidget(GWidget<Widget> e) {
    js.context.callMethod('fallbackDownloadWidget', [e.fullCode, e.fileName]);
  }

  static Future<String> getData(bool isAssets) async {
    if (isAssets) {
      return await rootBundle.loadString('assets/data.json');
    }

    var res = js.context.callMethod('getData');
    while (res.isEmpty) {
      print('read data 2...');
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
}
