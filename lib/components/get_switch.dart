import 'package:flutter_visible/imports.dart';

class GetSwitch extends StatefulWidget {
  final Map<String, dynamic> json;
  final int level;

  const GetSwitch({Key? key, required this.json, required this.level}) : super(key: key);

  @override
  _GetSwitchState createState() => _GetSwitchState();
}

class _GetSwitchState extends State<GetSwitch> {
  bool checked = false;

  @override
  void initState() {
    if (viewDebugProps) print('GetSwitch');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Map<String, dynamic> _json = widget.json;

    if (checked) {
      _json = (widget.json['variants']['children'] as List?)?.firstWhere((element) => (element['name'] as String).contains('checked=true'), orElse: () => null);
    } else {
      _json = (widget.json['variants']['children'] as List?)?.firstWhere((element) => (element['name'] as String).contains('checked=false'), orElse: () => null);
    }

    var variable = getVariable(widget.json, 'title');

    final children = getChildrenByLayoutMode(_json, widget.level, variables: [variable]);
    final res = wrapInstance(_json, children.widget, widget.level + 1);

    return GestureDetector(
      onTap: () => setState(() => checked = !checked),
      child: res.widget,
    );
  }
}
