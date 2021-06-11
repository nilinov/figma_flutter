import 'package:flutter_visible/imports.dart';

debugPrintWidget(String tag, {int level = 0, String? name, required Json json}) {
  // return;

  final startTabs = List.generate(level, (index) => "\t").join('');

  print(startTabs + " $tag" + ((name != null) ? "($name)" : ''));
}
