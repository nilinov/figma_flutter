import 'package:collection/collection.dart' show IterableExtension;
import 'package:flutter_visible/imports.dart';

GWidget getInput(Map<String, dynamic> json, int level) {
  if (viewDebugProps) print('getInput');

  final children = getFlatJson(json, result: []);

  final childBorderDefault = children.firstWhereOrNull((element) => element['name'] == 'border');
  final childBorderFocus = children.firstWhereOrNull((element) => element['name'] == 'borderFocus');
  final childPlaceholder = children.firstWhereOrNull((element) => element['name'] == 'placeholder')!;
  final childLabel = children.firstWhereOrNull((element) => element['name'] == 'label');

  final styleLabel = getTextStyle(childLabel ?? childPlaceholder);
  final stylePlaceholder = getTextStyle(childPlaceholder);

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

  if (json['mainComponent'] != null &&
      (json['mainComponent']['name'] as String)
          .contains("animated_label=focus")) {
    isAnimatedLabel = true;
  }

  final input = AppInput(
    placeholder: placeholder,
    borderDefaultColor: borderDefaultColor,
    borderFocusColor: borderFocusColor,
    stylePlaceholder: stylePlaceholder.textStyle,
    isAnimatedLabel: isAnimatedLabel,
    label: label,
    styleLabel: styleLabel.textStyle,
  );

  return GWidget(
      input,
      '''AppInput("$label", placeholder: "$placeholder", isAnimatedLabel: $isAnimatedLabel)''',
      components: [
        GWidget(
          input,
          '''
          AppInput(
            placeholder: "$placeholder",
            borderDefaultColor: $borderDefaultColor,
            borderFocusColor: $borderFocusColor,
            stylePlaceholder: ${stylePlaceholder.code},
            isAnimatedLabel: $isAnimatedLabel,
            label: $label,
            styleLabel: ${styleLabel.textStyle},
          )
          ''',
          type: 'AppInput-source',
        )
      ],
    type: 'AppInput',
  );
}

class AppInput extends StatelessWidget {
  final bool isAnimatedLabel;
  final String? placeholder;
  final String label;
  final TextStyle? styleLabel;
  final TextStyle stylePlaceholder;
  final Color borderFocusColor;
  final Color borderDefaultColor;

  const AppInput({
    Key? key,
    required this.isAnimatedLabel,
    this.placeholder,
    required this.label,
    this.styleLabel,
    required this.stylePlaceholder,
    required this.borderFocusColor,
    required this.borderDefaultColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: !isAnimatedLabel ? (placeholder ?? '') : label,
        hintText: isAnimatedLabel ? (placeholder ?? '') : null,
        hintStyle: stylePlaceholder,
        labelStyle: styleLabel ?? stylePlaceholder,
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
  }
}
