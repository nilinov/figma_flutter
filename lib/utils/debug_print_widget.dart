import 'package:flutter_visible/imports.dart';

debugPrintWidget(String tag, {int level = 0, String name}) {
  // return;
  print(List.generate(level, (index) => "\t").join('') + " $tag" + ((name != null) ? "($name)" : ''));
}
