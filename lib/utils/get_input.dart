import 'package:flutter_visible/imports.dart';

getInput(Map<String, dynamic> json, int level) {
  if (viewDebugProps) print('getInput');

  final childBorderDefault = (json['children'] as List)?.firstWhere((element) => element['name'] == 'border', orElse: () => null);
  final childBorderFocus = (json['children'] as List)?.firstWhere((element) => element['name'] == 'borderFocus', orElse: () => null);

  Color borderDefaultColor = Colors.grey;
  Color borderFocusColor = Colors.blue;

  if (childBorderDefault != null) {
    borderDefaultColor = getColorFromFills(childBorderDefault);
  }

  if (childBorderFocus != null) {
    borderFocusColor = getColorFromFills(childBorderFocus);
  }

  print(borderDefaultColor);

  final input = TextField(
    decoration: InputDecoration(
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
