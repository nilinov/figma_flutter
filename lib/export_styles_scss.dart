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
      final styles = getStyleScss(StylesApp);

      components = [
        ...styles,
      ];

      // print(res.toWidget());
      return Row(
        children: [
          Expanded(
              child: Container(
                  child: Column(
            children: [
              Column(
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
            ],
          ))),
        ],
      );
    }

    return Center(child: CircularProgressIndicator());
  }

  void downloadWidget(GWidget<Widget> e) {
    js.context.callMethod('fallbackDownloadWidget', [e.fullCode, e.fileName]);
  }
}

