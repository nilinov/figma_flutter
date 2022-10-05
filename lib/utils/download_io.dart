import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_visible/generated_widget.dart';
import 'package:flutter_visible/utils/download.dart';

class Downloaded1 implements Downloaded {
  static downloadWidget(GWidget<Widget> e) {
  }

  static Future<String> getData(bool isAssets) async {
    return await rootBundle.loadString('assets/data.json');
  }

}
