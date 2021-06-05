import 'dart:core';

import 'package:flutter_visible/imports.dart';

GWidget getButtonLayout(Map<String, dynamic> json, bool isProcessTapped,
    {required int level}) {
  List? bg = (json['fills'] as List).reversed.toList();

  if (isProcessTapped) {
    bg = (json['fills'] as List?)!;
  }

  final _json = {...json, 'fills': bg};

  final children = getChildrenByLayoutMode(json, level);
  return wrapInstance(_json, children, level + 1);
}

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
    return getChild(widget, this);
  }
}

Widget getChild(GetButton widget, _GetButtonState state) {
  if (viewDebugProps) print('getButton');

  return GestureDetector(
    onTap: () {},
    onTapDown: (details) => state.setState(() => state.isProcessTapped = true),
    onTapUp: (details) => state.setState(() => state.isProcessTapped = false),
    child:
        getButtonLayout(widget.json, state.isProcessTapped, level: widget.level)
            .widget,
  );
}

String GetButtonToCode({required String title, required String onTap}) {
  return 'AppButton(title: "$title", onTap: $onTap)';
}

GWidget getGButton(
  Map<String, dynamic> json,
  int level,
) {
  final item = GetButton(json: json, level: level);
  return GWidget(
    item,
    GetButtonToCode(title: 'title', onTap: 'onTap'),
    components: [
      GWidget(AppButton(), GetButtonToCode(title: 'title', onTap: 'onTap'), type: 'AppButton-source')
    ],
    type: 'AppButton'
  );
}

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
      child: SizedBox(),
    );
  }
}
