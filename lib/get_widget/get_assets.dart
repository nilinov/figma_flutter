import 'package:flutter_visible/imports.dart';

GWidget getAssets(List<GWidget> items, { required String name}) {
  final images = items.where((element) => element.type == 'png-source').toList();
  final icons = items.where((element) => element.type == 'svg-source').toList();

  String imagesCode = '''
  ''';

  if (images.length > 0) {
    final imageNames = <String, GWidget>{};
    Future.forEach(images, (GWidget element) => imageNames[element.name ?? ''] = element);

    imagesCode = '''
class AppImages {
  ${imageNames.values.map((e) => "static const ${getFileName(e.name)} = 'assets/images/${getFileName(e.fileName)}';").join('\n')}
}
''';
  }

  String iconsCode = '''
  ''';

  if (icons.length > 0) {
    final iconsNames = <String, GWidget>{};

    Future.forEach(icons, (GWidget element) => iconsNames[element.name ?? ''] = element);

    iconsCode = '''
class AppIcons {
  ${iconsNames.values.map((e) => "static const ${getFileName(e.name)} = 'assets/icons/${getFileName(e.fileName)}';").join('\n')}
}
''';
  }

  final fullCode = ''' 
  import "_$name.dart";
  
$imagesCode
$iconsCode
''';

  return GWidget(
    SizedBox(),
    type: 'assets-code',
    widgetType: 'SizedBox',
    fileName: 'assets.dart',
    fullCode: fullCode,
    name: 'Assets file',
    components: [],
  );
}
