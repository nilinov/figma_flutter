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
  debugPrintWidget("getComponent", level: level, name: json['name'], json: json);

  final List<GWidget> gIcons = [];
  final List<GWidget> gImages = [];

  Future.forEach(<Json>[...getJsonIcon(json)], (Json element) {
    gIcons.addAll(getJsonIcon(element).map((e) => getSvg(e)).toList());
  });

  Future.forEach(<Json>[...getJsonImage(json)], (Json element) {
    gImages.addAll(
        getJsonImage(element).map((e) => getImage(e, level + 1)).toList());
  });

  var variables =
      getAllVariables(json, inCodeVariable: true, template: "\$variable");

  final name = getNameByJson(json);

  final componentResult = wrapContainer(
    getChildrenByLayoutMode(json, level, variables: variables),
    json,
    'Component: $name',
  );

  return GWidget(GetComponentRunTime(json: json, level: level + 1),
      code: '${name.pascalCase}(${getParamsWithVariables(variables)})',
      type: 'AppComponent($name)',
      widgetType: 'AppComponent',
      name: name,
      components: [
        GWidget(
          GetComponentRunTime(json: json, level: level + 1),
          type: 'AppComponent($name)-source',
          fullCode: getComponentCode(componentResult, name, variables),
          name: name,
          components: [...gImages, ...gIcons],
          children: [...gImages, ...gIcons],
          widgetType: 'AppComponent-source',
        ),
        ...gIcons,
        ...gImages,
      ],
    children: [componentResult]
  );
}

getComponentCode(GWidget variants, String name, List<Variable> variables) => '''
class ${name.pascalCase} extends StatelessWidget {
  ${getDeclareWithVariables(variables)}
  
  ${name.pascalCase}(${getParamsWithVariablesConstructor(variables)});

  @override
  Widget build(BuildContext context) {
    return ${variants.code};
  }
}
''';
