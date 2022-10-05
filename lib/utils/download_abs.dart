import 'package:flutter/cupertino.dart';
import 'package:flutter_visible/generated_widget.dart';

abstract class DownloadedAbs {
  static downloadWidget(GWidget<Widget> e) {}
  static Future<String> getData(bool isAssets) async {
    return '';
  }
}
