import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter_visible/ext.dart';
import 'package:flutter_visible/imports.dart';

GWidget getGButton(
  Map<String, dynamic> json,
  int level,
) {
  final childrenJson = getFlatJson(json, result: []);

  GWidget? title = getWidgetByMap(
      childrenJson.firstWhere((element) => element['name'] == "\$String:title",
          orElse: () => {}),
      level + 1);

  Color bg = getColorFromFills(
      {...json, 'fills': (json['fills'] as List).reversed.toList()});
  Color bgTapped = getColorFromFills(json);
  double height = json['height'] ?? 0.0;

  BorderRadius borderRadius = getBorderRadius(json) ?? BorderRadius.zero;
  String borderRadiusString = getBorderRadiusString(json) ?? '';

  final item = AppButton(
    bg: bg,
    bgTapped: bgTapped,
    title: title?.widget ?? SizedBox(),
    height: height,
    borderRadius: borderRadius,
    onTap: () {},
  );

  final code = '''
  AppButton(
    ${wrapProp('title', title?.code)}
    ${wrapProp('bg', bg)}
    ${wrapProp('bgTapped', bgTapped)}
    ${wrapProp('height', height)}
    ${wrapProp('borderRadius', borderRadiusString)}
    onTap: () {},
  )''';

  return GWidget(
    item,
    code,
    components: [GWidget(item, AppButtonCode, type: 'AppButton-source', fullCode: AppButtonCode)],
    type: 'AppButton'
  );
}

class AppButton extends StatefulWidget {
  final Widget title;
  final Color bg;
  final Color bgTapped;
  final BorderRadius borderRadius;
  final double height;
  final VoidCallback onTap;

  const AppButton({
    Key? key,
    required this.title,
    required this.bg,
    required this.bgTapped,
    required this.borderRadius,
    required this.height,
    required this.onTap,
  }) : super(key: key);

  @override
  _AppButtonState createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool isProcessTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      onTapDown: (details) {
        setState(() => isProcessTapped = true);
        if (widget.onTap is VoidCallback) widget.onTap();
      },
      onTapUp: (details) {
        setState(() => isProcessTapped = false);
        if (widget.onTap is VoidCallback) widget.onTap();
      },
      child: Container(
        width: double.infinity,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: widget.borderRadius,
          color: isProcessTapped ? widget.bgTapped : widget.bg,
        ),
        child: Align(child: widget.title, alignment: Alignment.center),
      ),
    );
  }
}

const AppButtonCode = '''
class AppButton extends StatefulWidget {
  final Widget title;
  final Color bg;
  final Color bgTapped;
  final BorderRadius borderRadius;
  final double height;
  final VoidCallback onTap;

  const AppButton({
    Key? key,
    required this.title,
    required this.bg,
    required this.bgTapped,
    required this.borderRadius,
    required this.height,
    required this.onTap,
  }) : super(key: key);

  @override
  _AppButtonState createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool isProcessTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      onTapDown: (details) {
        setState(() => isProcessTapped = true);
        if (widget.onTap is VoidCallback) widget.onTap(); 
      },
      onTapUp: (details) {
        setState(() => isProcessTapped = false);
        if (widget.onTap is VoidCallback) widget.onTap();
      },
      child: Container(
        width: double.infinity,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: widget.borderRadius,
          color: isProcessTapped ? widget.bgTapped : widget.bg,
        ),
        child: Align(child: widget.title, alignment: Alignment.center),
      ),
    );
  }
}
''';
