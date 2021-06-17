// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
import 'package:flutter_visible/get_data.dart';
import 'package:flutter_visible/imports.dart';

class ExportStylesScss extends StatefulWidget {
  final bool isSample;

  const ExportStylesScss({Key? key, required this.isSample}) : super(key: key);

  @override
  _ExportStylesScssState createState() => _ExportStylesScssState();
}

enum ImageExportEnum { inline, consts, file }

class _ExportStylesScssState extends State<ExportStylesScss> {
  Map<String, dynamic>? json;

  @override
  Future<void> didChangeDependencies() async {
    json = jsonDecode(await getData(widget.isSample));
    setState(() {});
    super.didChangeDependencies();
    // Future.delayed(Duration(seconds: 1)).then((value) => debugDumpApp());
  }

  bool splitComponent = true;
  bool inlineIcons = true;
  bool inlineImages = true;
  ImageExportEnum iconsExport = ImageExportEnum.inline;
  ImageExportEnum imagesExport = ImageExportEnum.inline;

  List<GWidget> components = [];

  @override
  Widget build(BuildContext context) {
    // return Container(child: Widget1(), width: MediaQuery.of(context).size.width * 0.5, height: MediaQuery.of(context).size.height * 0.5);

    if (json != null) {
      StylesApp =
          getStyles((json!['styles'] as List).map((e) => e as Json).toList());
      final res = getWidgetByMap(json!['json'] ?? {}, 0, name: 'screen');
      final styles = getStyleScss(StylesApp);

      if (res != null) {
        final List<GWidget> list = getAllComponents(res, result: [])
            // .where((element) => element.type.contains('App'))
            .where((element) => element.type.contains('source'))
            .toList();

        list.sort((e1, e2) =>
            e1.type.contains('svg') && !e2.type.contains('svg') ? 1 : -1);
        list.sort((e1, e2) =>
            e1.type.contains('png') && !e2.type.contains('png') ? -1 : 1);

        final Map<String, GWidget> names = {};

        Future.forEach(
            list, (GWidget element) => names[element.name ?? ''] = element);

        final assetsExport = getAssets(list, name: res.name ?? '');

        components = [
          ...names.values.where((e) {
            if (e.type.contains('svg') ||
                e.type.contains('png') ||
                e.type.contains('import')) return true;

            return false;
          }).toList(),
          assetsExport,
          getImports([
            ...list,
            assetsExport,
          ], name: res.name ?? ''),
          ...styles,
        ];
      }

      // print(res.toWidget());
      return Row(
        children: [
          Expanded(
              child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...components.map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            downloadWidget(e);
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.save),
                              SizedBox(width: 10),
                              Text("${e.name ?? e.type}"),
                            ],
                          ),
                        ),
                      )),
                  Divider(),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
          )),
        ],
      );
    }

    return Center(child: CircularProgressIndicator());
  }

  void downloadWidget(GWidget<Widget> e) {
    js.context.callMethod('fallbackDownloadWidget', [e.fullCode, e.fileName]);
  }
}
