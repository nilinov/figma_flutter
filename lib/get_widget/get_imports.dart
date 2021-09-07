import 'package:flutter_visible/imports.dart';

GWidget getImports(List<GWidget> items, {required String name}) {
  final files = items
      .where((element) =>
          element.type != 'png-source' && element.type != 'svg-source')
      .toList();

  String filesCode = '''
  ''';

  if (files.length > 0) {
    final imageNames = <String, GWidget>{};
    Future.forEach(
        files, (GWidget element) => imageNames[element.name ?? ''] = element);

    filesCode = '''
export "../_imports.dart";

  ${imageNames.values.map((e) => "export \"${e.fileName}\";").join('\n')}
''';
  }

  return GWidget(
    SizedBox(),
    type: 'imports-code',
    widgetType: 'SizedBox',
    fileName: '_$name.dart',
    fullCode: filesCode,
    name: 'Imports file',
    components: [],
  );
}
