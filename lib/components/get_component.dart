import 'package:flutter_visible/imports.dart';

class GetComponentRunTime extends StatelessWidget {
  final Json json;
  final int level;

  const GetComponentRunTime({Key? key, required this.json, required this.level})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var variables = getAllVariables(json, inCodeVariable: false);

    final componentResult = wrapContainer(
      getChildrenByLayoutMode(json, level, variables: variables),
      json,
      'Component: ${getNameByJson(json)}',
    );

    return componentResult.widget;
  }
}

GWidget getComponent(Json json, int level) {
  final List<GWidget> gIcons = [];
  final List<GWidget> gImages = [];

  Future.forEach(<Json>[...getJsonIcon(json)], (Json element) {
    gIcons.addAll(getJsonIcon(element).map((e) => getSvg(e)).toList());
  });

  Future.forEach(<Json>[...getJsonImage(json)], (Json element) {
    gImages.addAll(getJsonImage(element).map((e) => getImage(e, level + 1)).toList());
  });

  var variables = getAllVariables(json,
      inCodeVariable: true, template: "widget.\$variable");

  final name = getNameByJson(json);

  final componentResult = wrapContainer(
    getChildrenByLayoutMode(json, level, variables: variables),
    json,
    'Component: $name',
  );

  return GWidget(GetComponentRunTime(json: json, level: level + 1),
      code: '$name(${getParamsWithVariables(variables)})',
      type: 'AppComponent($name)',
      name: name,
      components: [
        GWidget(
          GetComponentRunTime(json: json, level: level + 1),
          type: 'AppComponent($name)-source',
          fullCode: getComponentCode(componentResult, name, variables),
          name: name,
          components: [...gImages, ...gIcons],
        ),
        ...gIcons,
        ...gImages,
      ]);
}

getComponentCode(GWidget variants, String name, List<Variable> variables) => '''
class $name extends StatelessWidget {
  ${getDeclareWithVariables(variables)}
  
  $name(${getParamsWithVariablesConstructor(variables)});

  @override
  Widget build(BuildContext context) {
    return ${variants.code};
  }
}
''';
