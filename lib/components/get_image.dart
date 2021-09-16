import 'package:flutter_visible/imports.dart';

GWidget getImage(Json json, int level) {
  debugPrintWidget("Image", level: level, name: json['name'], json: json);

  final imageJson = [...(json['strokes'] ?? []), ...(json['fills'] ?? [])]
      .firstWhere((element) => element['type'] == 'IMAGE', orElse: () => null);

  BoxFit fitted = BoxFit.fill;

  switch (imageJson['scaleMode']) {
    case 'FILL':
      fitted = BoxFit.cover;
      break;
    case 'FIT':
      fitted = BoxFit.contain;
      break;
    case 'CROP':
      fitted = BoxFit.cover;
      break;
  }

  final pngImage = Image.memory(
    base64Decode(json['png']),
    key: getValueKeyImage(json['png'], type: 'PNG', name: json['name']),
    height: toDouble(json['height']),
    width: toDouble(json['width']),
    fit: fitted,
  );

  final name = getNameByJson(json);

  // final variables = getAllVariables(json, inCodeVariable: false);
  //
  // print(variables);

  return GWidget(pngImage,
      code: '''Image.asset(AppImages.${getFileName(name)}, fit: $fitted)''',
      type: 'png-image',
      widgetType: 'Image',
      name: name,
      components: [
        GWidget(pngImage,
            type: 'png-source',
            widgetType: 'Image',
            fullCode: base64Decode(json['png']),
            name: name,
            components: [],
            children: [],
            fileName: "${getFileName(name)}.png")
      ],
      children: [
        GWidget(pngImage,
            type: 'png-source',
            widgetType: 'Image',
            fullCode: base64Decode(json['png']),
            name: name,
            components: [],
            children: [],
            fileName: "${getFileName(name)}.png")
      ]);
}
