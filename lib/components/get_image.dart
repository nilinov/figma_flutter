import 'package:flutter_visible/imports.dart';

GWidget getImage(Json json, int level) {
  debugPrintWidget("Image", level: level, name: json['name'], json: json);

  final pngImage = Image.memory(
    base64Decode(json['png']),
    key: getValueKeyImage(json['png'], type: 'PNG', name: json['name']),
    height: toDouble(json['height']),
    width: toDouble(json['width']),
  );

  final name = getNameByJson(json);

  final variables = getAllVariables(json, inCodeVariable: false);

  print(variables);

  return GWidget(pngImage,
      code: '''Image.asset(AppImages.${getFileName(name)})''',
      type: 'png-image',
      name: name,
      components: [
        GWidget(pngImage,
            type: 'png-source',
            fullCode: base64Decode(json['png']),
            name: name,
            components: [],
            fileName: "${getFileName(name)}.png")
      ]);
}
