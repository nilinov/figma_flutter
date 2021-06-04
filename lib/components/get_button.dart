import 'package:flutter_visible/imports.dart';
import 'package:flutter_visible/ext.dart';

class GetButton extends StatefulWidget {
  final Map<String, dynamic> json;
  final int level;

  const GetButton({Key? key, required this.json, required this.level})
      : super(key: key);

  @override
  _GetButtonState createState() => _GetButtonState();
}

class _GetButtonState extends State<GetButton> {
  bool isProcessTapped = false;

  @override
  Widget build(BuildContext context) {
    return getChild();
  }

  Widget getChild() {
    if (viewDebugProps) print('getButton');

    List? bg = (widget.json['fills'] as List).reversed.toList();

    if (isProcessTapped) {
      bg = (widget.json['fills'] as List?)!;
    }

    final _json = {...widget.json, 'fills': bg};

    return GestureDetector(
      onTap: () {},
      onTapDown: (details) => setState(() => isProcessTapped = true),
      onTapUp: (details) => setState(() => isProcessTapped = false),
      child: wrapInstance(_json,
          getChildrenByLayoutMode(widget.json, widget.level), widget.level + 1),
    );
  }

  String toCode({required bool extractComponents}) {
    return '''
class AppButton extends StatefulWidget {
  @override
  _AppButtonState createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool isProcessTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      onTapDown: (details) => setState(() => isProcessTapped = true),
      onTapUp: (details) => setState(() => isProcessTapped = false),
      child: ${getChild().toCode(extractComponents: extractComponents)},
    );
  }
}
''';
  }
}
