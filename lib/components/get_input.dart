import 'package:collection/collection.dart' show IterableExtension;
import 'package:flutter_visible/imports.dart';

getInput(Map<String, dynamic> json, int level) {
  if (viewDebugProps) print('getInput');

  final children = getFlatJson(json, result: []);

  final childBorderDefault = children.firstWhereOrNull((element) => element['name'] == 'border');
  final childBorderFocus = children.firstWhereOrNull((element) => element['name'] == 'borderFocus');
  final childPlaceholder = children.firstWhereOrNull((element) => element['name'] == 'placeholder')!;
  final childLabel = children.firstWhereOrNull((element) => element['name'] == 'label');

  Color borderDefaultColor = Colors.grey;
  Color borderFocusColor = Colors.blue;

  if (childBorderDefault != null) {
    borderDefaultColor = getColorFromFills(childBorderDefault);
  }

  if (childBorderFocus != null) {
    borderFocusColor = getColorFromFills(childBorderFocus);
  }

  final placeholder = childPlaceholder['characters'];
  final label = childLabel != null ? childLabel['characters'] : null;
  bool isAnimatedLabel = false;

  if (json['mainComponent'] != null && (json['mainComponent']['name'] as String).contains("animated_label=focus")) {
    isAnimatedLabel = true;
  }

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

  return input;
}
