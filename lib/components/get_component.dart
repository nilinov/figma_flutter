import 'package:flutter_visible/imports.dart';

class GetComponentRunTime extends StatelessWidget {
  final Json json;
  final int level;

  const GetComponentRunTime({Key? key, required this.json, required this.level})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var variables = getAllVariables(json, inCodeVariable: false);

    final children = getChildrenByLayoutMode(json, level, variables: variables);

    final componentResult = wrapContainer(
      getChildrenByLayoutMode(json, level, variables: variables),
      json,
      'Component: ${getNameByJson(json)}',
    );

    return componentResult.widget;
  }
}

GWidget getComponent(Json json, int level) {
  final List<GWidget> GIcons = [];

  Future.forEach(<Json>[
    ...getJsonIcon(json),
  ], (Json element) {
    GIcons.addAll(getJsonIcon(element).map((e) => getSvg(e)).toList());
  });

  var variables = getAllVariables(json,  inCodeVariable: true, template: "widget.\$variable");

  final name = getNameByJson(json);

  final componentResult = wrapContainer(
    getChildrenByLayoutMode(json, level, variables: variables),
    json,
    'Component: $name',
  );

  return GWidget(GetComponentRunTime(json: json, level: level + 1),
      code: '$name("${getParamsWithVariables(variables)}")',
      type: 'AppComponent($name)',
      name: name,
      components: [
        GWidget(
          GetComponentRunTime(json: json, level: level + 1),
          type: 'AppComponent($name)-source',
          fullCode: getComponentCode(componentResult, name, variables),
          name: name,
          // TODO проверить экспорт нужных картинок
          components: [],
        ),
        ...GIcons,
      ]);
}

getComponentCode(GWidget variants, String name, List<Variable> variables) => '''
class $name extends StatelessWidget {
  ${getDeclareWithVariables(variables)}
  
  $name(${getParamsWithVariables(variables)});

  @override
  Widget build(BuildContext context) {
    return ${variants.code};
  }
}
''';
