import 'package:flutter_visible/ext.dart';
import 'package:flutter_visible/imports.dart';

class GTextStyle {
  final TextStyle textStyle;
  final String code;

  GTextStyle(this.textStyle, this.code);

  @override
  String toString() => code;
}

GTextStyle getTextStyle(Map<String, dynamic> json) {
  FontStyle fontStyle = FontStyle.normal;
  FontWeight fontWeight = FontWeight.normal;
  String? fontFamily = 'Roboto';
  double? letterSpacing = 0;

  if (json['fontName'] != null) {
    fontFamily = json['fontName']['family'];
    String _fontStyle = json['fontName']['style'];

    if ((_fontStyle).contains('Italic')) {
      fontStyle = FontStyle.italic;
      if (!_fontStyle.contains('Regular')) {
        fontFamily = "$fontFamily-${_fontStyle}Italic";
      }
    } else {
      fontFamily = "$fontFamily-$_fontStyle";
    }

    if ((_fontStyle).contains('Thin')) {
      fontWeight = FontWeight.w100;
    }

    if ((_fontStyle).contains('Light')) fontWeight = FontWeight.w300;

    if ((_fontStyle).contains('Medium')) fontWeight = FontWeight.w500;

    if ((_fontStyle).contains('Bold')) fontWeight = FontWeight.bold;

    if ((_fontStyle).contains('Black')) fontWeight = FontWeight.w900;
  }

  if (json['letterSpacing'] != null &&
      json['letterSpacing']['unit'] == 'PIXELS') {
    letterSpacing = json['letterSpacing']['value'];
  }

  TextStyle textStyle = TextStyle(
      fontWeight: fontWeight,
      fontFamily: fontFamily,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing);

  if (json['fontSize'] != null)
    textStyle = textStyle.copyWith(fontSize: json['fontSize']);
  if (json['fills'] != null)
    textStyle = textStyle.copyWith(color: getColorFromFills(json));

  var source = '''
  TextStyle(
      ${wrapProp('fontSize', json['fontSize'])}
      ${wrapProp('color', getColorFromFillsString(json))}
      fontWeight: $fontWeight,
      fontFamily: "$fontFamily",
      fontStyle: $fontStyle,
      letterSpacing: $letterSpacing)
  ''';

  if (json['textStyleId'] != null && json['textStyleId'] != '') {
    final style = StylesApp.firstWhere((element) => element.id == json['textStyleId'], orElse: () => Style(json: {}));
    if (style.type == StyleType.TEXT) {
      source = "AppStyledText.${style.name}.copyWith(color: ${getColorFromFillsString(json)})";

      if (json['fillStyleId'] != null && json['fillStyleId'] != '') {
        final styleFill = StylesApp.firstWhere((element) => element.id == json['fillStyleId'], orElse: () => Style(json: {}));

        if (styleFill.type != StyleType.INVALID) {
          source = "AppStyledText.${style.name}.copyWith(color: AppStyledPaint.${styleFill.name})";
        }
      }
    }
  }

  return GTextStyle(textStyle, source);
}

