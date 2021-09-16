import 'package:flutter_visible/imports.dart';

class GetComponentRunTime extends StatelessWidget {
  final Json json;
  final int level;

  const GetComponentRunTime({Key? key, required this.json, required this.level})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var variables = getAllVariables(json, inCodeVariable: false);

    final componentResult =
        getChildrenByLayoutMode(json, level, variables: variables);

    return componentResult.widget;
  }
}

Map<String, dynamic> getComponentChild(GWidget gWidget) {
  final Map<String, dynamic> names = {};

  if (gWidget.name != null && gWidget.name!.isNotEmpty && gWidget.type == 'component')
    names.addAll({gWidget.name ?? '': gWidget});

  if (gWidget.components.isNotEmpty)
    gWidget.components.forEach((element) {
      names.addAll(getComponentChild(element));
    });

  return names;
}

GWidget getComponent(Json json, int level) {
  debugPrintWidget("getComponent",
      level: level, name: json['name'], json: json);

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

  final componentResult =
      getChildrenByLayoutMode(json, level, variables: variables, name: name);

  final childComponents = getComponentChild(componentResult).values/*.where((element) {
    return element.name != name;
  })*/.toList();

  return GWidget(
    GetComponentRunTime(json: json, level: level + 1),
    code: '${name.pascalCase}(${getParamsWithVariables(variables)})',
    type: 'AppComponent($name)',
    widgetType: 'AppComponent($name)',
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
      ...childComponents,
    ],
    children: [
      componentResult,
    ],
    props: {
      'name': name,
      'children': childComponents.map((e) => e.name ?? '').join(', '),
      'type': componentResult.type,
      'widgetType': componentResult.widgetType,
      'variables': componentResult.variables.join(', '),
    },
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
