import 'package:flutter_visible/imports.dart';

getInput(Map<String, dynamic> json, int level) {
  if (viewDebugProps) print('getInput');

  final children = getFlatJson(json, result: []);

  final childBorderDefault = children?.firstWhere((element) => element['name'] == 'border', orElse: () => null);
  final childBorderFocus = children?.firstWhere((element) => element['name'] == 'borderFocus', orElse: () => null);
  final childPlaceholder = children?.firstWhere((element) => element['name'] == 'placeholder', orElse: () => null);
  final childLabel = children?.firstWhere((element) => element['name'] == 'label', orElse: () => null);

  Color borderDefaultColor = Colors.grey;
  Color borderFocusColor = Colors.blue;

  if (childBorderDefault != null) {
    borderDefaultColor = getColorFromFills(childBorderDefault);
  }

  if (childBorderFocus != null) {
    borderFocusColor = getColorFromFills(childBorderFocus);
  }

  final placeholder = childPlaceholder != null ? childPlaceholder['characters'] : null;
  final label = childLabel != null ? childLabel['characters'] : null;
  bool isAnimatedLabel = false;

  if (json['mainComponent'] != null && (json['mainComponent']['name'] as String).contains("animated_label=focus")) {
    isAnimatedLabel = true;
  }


  print(childPlaceholder);

  final input = TextField(
    decoration: InputDecoration(
      labelText: !isAnimatedLabel ? (placeholder ?? '') : label,
      hintText: isAnimatedLabel ? (placeholder ?? '') : null,
      hintStyle: getTextStyle(childPlaceholder),
      labelStyle: getTextStyle(childLabel ?? childPlaceholder),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: borderFocusColor),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: borderDefaultColor),
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: borderDefaultColor),
      ),
    ),
  );

  return Stack(
    children: [
      input,
    ],
  );

  return Stack(children: [
    Positioned.fill(child: input),
    // ...(json['children'] ?? <Widget>[])
    //     .map((jsonChild) {
    //       print(jsonChild);
    //       return Positioned.fill(child: getWidgetByMap(jsonChild, level + 1));
    //     })
    //     .toList()
  ]);
}
