import 'package:flutter_visible/imports.dart';


class GWidget<T extends Widget> {
  final T widget;
  final String? _code;
  final String type;
  final String? name;
  final String? _fileName;
  final dynamic _fullCode;
  final List<GWidget> components;

  const GWidget(
    this.widget, {
    String? code,
    this.components = const [],
    required this.type,
    this.name,
    dynamic fullCode,
    String? fileName,
  })  : _fileName = fileName,
        _fullCode = fullCode,
        _code = code;

  @override
  String toString() => _code ?? _fullCode ?? '';

  String? get code => _code;

  get _name => name ?? type.split('-source').join('');
  String get fileName => _fileName ?? "${name}.dart";

  get fullCode => _fullCode != null
      ? _fullCode
      : '''
class $_name extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return $_code;
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
      code: "SizedBox()",
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
