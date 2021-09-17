import 'package:flutter_visible/imports.dart';

GWidget getSvg(Json json) {
  final svgImage = SvgPicture.string(
    json['svg'],
    key: getValueKeyImage(json['svg'], type: 'SVG', name: json['name']),
    height: toDouble(json['height']),
    width: toDouble(json['width']),
  );

  final name = getNameByJson(json);

  return GWidget(
    svgImage,
    code: '''AppIcons.${name.camelCase}''',
    type: 'svg-image',
    widgetType: 'SvgPicture',
    components: [
      GWidget(
        svgImage,
        type: 'svg-source',
        widgetType: 'svg-source',
        fullCode: json['svg'],
        fileName: "${getFileName(name)}.svg",
        name: name,
        components: [],
        children: [],
      )
    ],
    children: [
      GWidget(
        svgImage,
        type: 'svg-source',
        widgetType: 'svg-source',
        fullCode: json['svg'],
        fileName: "${getFileName(name)}.svg",
        name: name,
        components: [],
        children: [],
      )
    ],
  );
}
