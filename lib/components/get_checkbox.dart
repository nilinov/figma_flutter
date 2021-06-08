import 'package:flutter_visible/imports.dart';

class GetCheckbox extends StatefulWidget {
  final Json json;
  final int level;

  const GetCheckbox({Key? key, required this.json, required this.level})
      : super(key: key);

  @override
  _GetCheckboxState createState() => _GetCheckboxState();
}

class _GetCheckboxState extends State<GetCheckbox> {
  bool checked = false;

  @override
  void initState() {
    if (viewDebugProps) print('GetCheckbox');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Json _json = widget.json;

    final _jsonChecked = (widget.json['variants']['children'] as List?)
        ?.firstWhere(
            (element) => (element['name'] as String).contains('checked=true'),
            orElse: () => null)!;
    final _jsonUnChecked = (widget.json['variants']['children'] as List?)
        ?.firstWhere(
            (element) => (element['name'] as String).contains('checked=false'),
            orElse: () => null);

    final GIcons = [
      ...getJsonIcon(_jsonChecked),
      ...getJsonIcon(_jsonUnChecked),
    ].map((e) => getJsonIcon(e));

    if (checked) {
      _json = _jsonChecked;
    } else {
      _json = _jsonUnChecked;
    }

    var variable = getVariable(widget.json, 'title', inCodeVariable: false);

    final children =
        getChildrenByLayoutMode(_json, widget.level, variables: [variable]);
    final child = wrapInstance(_json, children, widget.level + 1);

    return GestureDetector(
      onTap: () => setState(() => checked = !checked),
      child: child.widget,
    );
  }
}

GWidget getCheckbox(Json json, int level) {
  final _jsonChecked = (json['variants']['children'] as List?)?.firstWhere(
      (element) => (element['name'] as String).contains('checked=true'),
      orElse: () => null)!;
  final _jsonUnChecked = (json['variants']['children'] as List?)?.firstWhere(
      (element) => (element['name'] as String).contains('checked=false'),
      orElse: () => null);

  final List<GWidget> GIcons = [];

  Future.forEach(<Json>[
    ...getJsonIcon(_jsonChecked),
    ...getJsonIcon(_jsonUnChecked),
  ], (Json element) {
    GIcons.addAll(getJsonIcon(element).map((e) => getSvg(e)).toList());
  });

  var variable = getVariable(json, 'title', inCodeVariable: true, template: "widget.\$variable");

  final childUnChecked = wrapInstance(
      _jsonUnChecked,
      getChildrenByLayoutMode(_jsonUnChecked, level, variables: [variable]),
      level + 1);
  final childChecked = wrapInstance(
      _jsonChecked,
      getChildrenByLayoutMode(_jsonChecked, level, variables: [variable]),
      level + 1);

  final name = getNameByJson(json);

  return GWidget(GetCheckbox(json: json, level: level + 1),
      code: 'AppCheckbox("${variable?.defaultValue}")',
      type: 'AppCheckbox',
      name: name,
      components: [
        GWidget(
          GetCheckbox(json: json, level: level + 1),
          type: 'AppCheckbox-source',
          fullCode: getCheckboxCode(childUnChecked, childChecked, name),
          name: name,
        ),
        ...GIcons,
      ]);
}

getCheckboxCode(GWidget unchecked, GWidget checked, String name) => '''
class $name extends StatefulWidget {
  final String title;
  
  $name(this.title);

  @override
  _${name}State createState() => _${name}State();
}

class _${name}State extends State<$name> {
  bool isChecked = false;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => isChecked = !isChecked),
      child: isChecked ? ${checked.code} : ${unchecked.code},
    );
  }
}
''';
