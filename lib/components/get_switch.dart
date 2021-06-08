import 'package:flutter_visible/imports.dart';

class GetSwitchRuntime extends StatefulWidget {
  final Map<String, dynamic> json;
  final int level;

  const GetSwitchRuntime({Key? key, required this.json, required this.level}) : super(key: key);

  @override
  _GetSwitchRuntimeState createState() => _GetSwitchRuntimeState();
}

class _GetSwitchRuntimeState extends State<GetSwitchRuntime> {
  bool checked = false;

  @override
  void initState() {
    if (viewDebugProps) print('GetSwitch');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Map<String, dynamic> _json = widget.json;

    if (widget.json['variants'] != null) {
      if (checked) {
        _json =
            (widget.json['variants']['children'] as List?)?.firstWhere((element) => (element['name'] as String).contains('checked=true'), orElse: () => null);
      } else {
        _json =
            (widget.json['variants']['children'] as List?)?.firstWhere((element) => (element['name'] as String).contains('checked=false'), orElse: () => null);
      }
    }

    var variable = getVariable(widget.json, 'title');

    final children = getChildrenByLayoutMode(_json, widget.level, variables: [variable]);
    final res = wrapInstance(_json, children, widget.level + 1);

    return GestureDetector(
      onTap: () => setState(() => checked = !checked),
      child: res.widget,
    );
  }
}

GWidget getSwitch(Json json, int level) {
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

  return GWidget(GetSwitchRuntime(json: json, level: level + 1),
      code: '$name("${variable?.defaultValue}")',
      fullCode: getSwitchCode(childUnChecked, childChecked, name),
      type: 'AppSwitch',
      name: name,
      components: [
        GWidget(
          GetSwitchRuntime(json: json, level: level + 1),
          type: 'AppSwitch-source',
          fullCode: getSwitchCode(childUnChecked, childChecked, name),
          name: name,
        ),
        ...GIcons,
      ]);
}

getSwitchCode(GWidget unchecked, GWidget checked, String name) => '''
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
