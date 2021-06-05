import 'package:flutter_visible/imports.dart';

class GWidget<T extends Widget> {
  final T widget;
  final String code;
  final String type;
  final List<GWidget> components;

  const GWidget(this.widget, this.code, {this.components = const [], required this.type});

  @override
  String toString() => this.code;
}

class GWidgetList<T> {
  final List<T> widget;
  final List<String> code;
  final String type;
  final List<GWidget> components;

  const GWidgetList(this.widget, this.code, {required this.components, required this.type});

  @override
  String toString() => this.code.join('\n');
}

gWidgetSizedBox(String type) => GWidget(SizedBox(), "SizedBox()", components: [], type: type);

List<GWidget> getAllComponents(GWidget item, { required List<GWidget> result }) {
  print("getAllComponents ${item.type}");
  final List<GWidget> res = [];

  item.components.forEach((element) {
    res.addAll(getAllComponents(element, result: []));
  });

  return res;
}
