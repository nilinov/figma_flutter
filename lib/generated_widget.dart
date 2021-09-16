import 'package:flutter_visible/imports.dart';

class GWidget<T extends Widget> {
  final T widget;
  final String? _code;
  final String type;
  final String? name;
  final String? _fileName;
  final dynamic _fullCode;
  final List<GWidget> components;
  final List<GWidget> children;
  final List<Variable> variables;
  final Map<String, String>? props;
  final String prefixCodeLine;
  final String widgetType;

  const GWidget(
    this.widget, {
    String? code,
    required this.components,
    required this.children,
    required this.type,
    this.name,
    dynamic fullCode,
    String? fileName,
    this.variables = const [],
    this.prefixCodeLine = '',
    required this.widgetType,
    this.props,
  })  : _fileName = fileName,
        _fullCode = fullCode,
        _code = code;

  @override
  String toString() => _code ?? _fullCode ?? '';

  String? get code => _code;

  get _name => name ?? type.split('-source').join('');

  String get fileName => _fileName ?? "${name}.dart";

  get fullCode {
    if (_fullCode != null && prefixCodeLine.isNotEmpty)
      return '''
    $prefixCodeLine
    $_fullCode
    ''';
    else if (_fullCode != null) {
      return _fullCode;
    }

    String variablesCode = '''''';
    if (variables.isNotEmpty) {
      variablesCode = '''
        ${variables.map((e) => "final String ${e.name};").join('\n')}
      
        const ${name}({Key? key${variables.map((e) => e.defaultValue == null ? ", required this.${e.name}" : ", this.${e.name} = \"${e.defaultValue}\"").join('')}}) : super(key: key);
      ''';
    }

    return '''
    $prefixCodeLine
class $_name extends StatelessWidget {
  $variablesCode
  @override
  Widget build(BuildContext context) {
    return $_code;
  }
}  
  ''';
  }

  GWidget copyWith({
    T? widget,
    String? code,
    String? type,
    String? name,
    String? fileName,
    dynamic fullCode,
    List<GWidget>? components,
    List<GWidget>? children,
    List<Variable>? variables,
    String? prefixCodeLine,
    String? widgetType,
    final Map<String, String>? props,
  }) {
    if ((widget == null || identical(widget, this.widget)) &&
        (code == null || identical(code, this._code)) &&
        (type == null || identical(type, this.type)) &&
        (name == null || identical(name, this.name)) &&
        (fileName == null || identical(fileName, this._fileName)) &&
        (fullCode == null || identical(fullCode, this._fullCode)) &&
        (components == null || identical(components, this.components)) &&
        (variables == null || identical(variables, this.variables)) &&
        (prefixCodeLine == null ||
            identical(prefixCodeLine, this.prefixCodeLine))) {
      return this;
    }

    return new GWidget(
      widget ?? this.widget,
      code: code ?? this._code,
      type: type ?? this.type,
      name: name ?? this.name,
      fileName: fileName ?? this._fileName,
      fullCode: fullCode ?? this._fullCode,
      components: components ?? this.components,
      children: children ?? this.children,
      variables: variables ?? this.variables,
      prefixCodeLine: prefixCodeLine ?? this.prefixCodeLine,
      widgetType: widgetType ?? this.widgetType,
      props: props ?? this.props,
    );
  }
}

class GWidgetList<T> {
  final List<T> widget;
  final List<String> code;
  final String type;
  final String? name;
  final List<GWidget> components;

  const GWidgetList(this.widget, this.code,
      {required this.components, required this.type, this.name});

  @override
  String toString() => this.code.join('\n');
}

gWidgetSizedBox(String type) => GWidget(
      SizedBox(),
      code: "const SizedBox()",
      components: [],
      children: [],
      type: type,
      widgetType: "SizedBox",
    );

gWidgetExpanded(GWidget widget, String type) => GWidget(
      Expanded(child: widget.widget),
      code: "Expanded(child: ${widget.code})",
      components: [widget],
      children: [widget],
      type: type,
      widgetType: "Expanded",
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
