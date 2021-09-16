import 'package:flutter_visible/ext.dart';
import 'package:flutter_visible/imports.dart';

class GTextStyle {
  final TextStyle textStyle;
  final String code;

  GTextStyle(this.textStyle, this.code);

  @override
  String toString() => code;
}

GTextStyle getTextStyleScss(Map<String, dynamic> json) {
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
    textStyle = textStyle.copyWith(fontSize: toDouble(json['fontSize']));
  if (json['fills'] != null)
    textStyle = textStyle.copyWith(color: getColorFromFills(json));

  var source = '''
      ${wrapProp('font-size', toDouble(json['fontSize']), delimiter: ';')}
      ${wrapProp('color', getColorFromFillsString(json, defaultColor: 'transparent'), delimiter: ';')}
      font-weight: ${fontWeightToScss(fontWeight)};
      font-family: "$fontFamily";
      font-style: ${fontStyleToScss(fontStyle)};
      letter-spacing: $letterSpacing;
  ''';

  // if (json['textStyleId'] != null && json['textStyleId'] != '') {
  //   final style = StylesApp.firstWhere((element) => element.id == json['textStyleId'], orElse: () => Style(json: {}));
  //   if (style.type == StyleType.TEXT) {
  //     source = "AppStyledText.${style.name}.copyWith(color: ${getColorFromFillsString(json, defaultColor: 'transparent')})";
  //
  //     if (json['fillStyleId'] != null && json['fillStyleId'] != '') {
  //       final styleFill = StylesApp.firstWhere((element) => element.id == json['fillStyleId'], orElse: () => Style(json: {}));
  //
  //       if (styleFill.type != StyleType.INVALID) {
  //         source = "AppStyledText.${style.name}.copyWith(color: AppStyledPaint.${styleFill.name})";
  //       }
  //     }
  //   }
  // }

  return GTextStyle(textStyle, source);
}

String fontWeightToScss(FontWeight fontWeight) {
  switch (fontWeight) {
    case FontWeight.w100:
      return '100';
    case FontWeight.w200:
      return '200';
    case FontWeight.w300:
      return '300';
    case FontWeight.w400:
      return '400';
    case FontWeight.w500:
      return '500';
    case FontWeight.w600:
      return '600';
    case FontWeight.w700:
      return '700';
    case FontWeight.w800:
      return '800';
    case FontWeight.w900:
      return '900';
    case FontWeight.normal:
      return 'normal';
    case FontWeight.bold:
      return 'bold';
    default:
      return 'normal';
  }
}
String fontStyleToScss(FontStyle fontStyle) {
  switch (fontStyle) {
    case FontStyle.normal:
      return 'normal';
    case FontStyle.italic:
      return 'italic';
    default:
      return 'normal';
  }
}
