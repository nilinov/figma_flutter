import 'package:flutter_visible/imports.dart';

GWidget getAssets(List<GWidget> items) {
  final images = items.where((element) => element.type == 'png-source').toList();
  final icons = items.where((element) => element.type == 'svg-source').toList();

  String imagesCode = '''
  ''';

  if (images.length > 0) {
    imagesCode = '''
class AppImages {
  ${images.map((e) => "static const ${e.name} = 'assets/images/${e.fileName}';").join('\n')}
}
''';
  }

  String iconsCode = '''
  ''';

  if (icons.length > 0) {
    iconsCode = '''
class AppIcons {
  ${icons.map((e) => "static const ${e.name} = 'assets/icons/${e.fileName}';").join('\n')}
}
''';
  }

  final fullCode = ''' 
$imagesCode
$iconsCode
''';

  return GWidget(
    SizedBox(),
    type: 'assets-code',
    fileName: 'assets.dart',
    fullCode: fullCode,
    name: 'Assets file'
  );
}
