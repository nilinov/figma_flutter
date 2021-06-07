import 'package:flutter_visible/imports.dart';

class GWidget<T extends Widget> {
  final T widget;
  final String code;
  final String type;
  final String? name;
  final String? fullCode;
  final List<GWidget> components;

  const GWidget(
    this.widget,
    this.code, {
    this.components = const [],
    required this.type,
    this.name,
    this.fullCode,
  });

  @override
  String toString() => this.code;

  get _name => name ?? type.split('-source').join('');

  get widgetCode => fullCode != null ? fullCode : '''
class $_name extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return $code;
  }
}  
  ''';
}

class GWidgetList<T> {
  final List<T> widget;
  final List<String> code;
  final String type;
  final List<GWidget> components;

  const GWidgetList(this.widget, this.code,
      {required this.components, required this.type});

  @override
  String toString() => this.code.join('\n');
}

gWidgetSizedBox(String type) => GWidget(
      SizedBox(),
      "SizedBox()",
      components: [],
      type: type,
    );

List<GWidget> getAllComponents(GWidget item, {required List<GWidget> result}) {
  // print("getAllComponents ${item.type}");
  final List<GWidget> res = [];

  res.add(item);

  item.components.forEach((element) {
    res.addAll(getAllComponents(element, result: []));
  });

  return res;
}
