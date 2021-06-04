import 'package:flutter_visible/imports.dart';

class GetCheckbox extends StatefulWidget {
  final Map<String, dynamic> json;
  final int level;

  const GetCheckbox({Key? key, required this.json, required this.level}) : super(key: key);

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

    Map<String, dynamic> _json = widget.json;

    if (checked) {
      _json = (widget.json['variants']['children'] as List?)?.firstWhere((element) => (element['name'] as String).contains('checked=true'), orElse: () => null);
    } else {
      _json = (widget.json['variants']['children'] as List?)?.firstWhere((element) => (element['name'] as String).contains('checked=false'), orElse: () => null);
    }

    var variable = getVariable(widget.json, 'title');


    final children = getChildrenByLayoutMode(_json, widget.level, variables: [variable]);
    final child = wrapInstance(_json, children, widget.level + 1);

    return GestureDetector(
      onTap: () => setState(() => checked = !checked),
      child: child.widget,
    );
  }
}
