// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
import 'package:flutter_visible/imports.dart';


class DemoWidget extends StatefulWidget {
  final bool isSample;

  const DemoWidget({Key? key, required this.isSample}) : super(key: key);

  @override
  _DemoWidgetState createState() => _DemoWidgetState();
}

enum ImageExportEnum { inline, consts, file }

class _DemoWidgetState extends State<DemoWidget> {
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

  @override
  Widget build(BuildContext context) {
    // return Container(child: Widget1(), width: MediaQuery.of(context).size.width * 0.5, height: MediaQuery.of(context).size.height * 0.5);

    if (json != null) {
      final res = getWidgetByMap(json ?? {}, 0);
      // print(res.toWidget());
      return Row(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              child: Container(
                child: res?.widget ?? SizedBox(),
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.8,
                    maxWidth: MediaQuery.of(context).size.width / 2),
              ),
              padding: EdgeInsets.all(20),
            ),
          )),
          if (MediaQuery.of(context).size.width > 800)
          Expanded(
              child: Container(
                  child: Column(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          js.context.callMethod(
                              'fallbackCopyTextToClipboard', [res?.code]);
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text("Copy")));
                        },
                        child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(10),
                          child: Text('Click to clipboard text'),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          js.context.callMethod('fallbackDownloadWidget',
                              [res?.code, 'demo_widget_1.dart']);
                        },
                        child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(10),
                          child: Text('Click to download widget'),
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Checkbox(
                        value: splitComponent,
                        onChanged: (bool? newValue) =>
                            setState(() => splitComponent = (newValue ?? true)),
                      ),
                      Text('Разделить компоненты'),
                    ],
                  ),
/*
                  ExportSettingImage(
                    title: 'Иконки',
                    iconsExport: iconsExport,
                    onChange: (props) => setState(() => iconsExport = props),
                  ),
                  ExportSettingImage(
                    title: 'Встроенные картинки',
                    iconsExport: imagesExport,
                    onChange: (props) => setState(() => imagesExport = props),
                  ),
*/
                  Divider(),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: GestureDetector(
                    onTap: () {
                      js.context.callMethod(
                          'fallbackCopyTextToClipboard', [res?.code]);
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text("Copy")));
                    },
                    child: Text((splitComponent ? res?.code : res?.code) ?? ''),
                  ),
                ),
              ),
            ],
          ))),
        ],
      );
    }

    return Center(child: CircularProgressIndicator());
  }
}

class ExportSettingImage extends StatelessWidget {
  final String title;
  final ImageExportEnum iconsExport;
  final Function(ImageExportEnum? value)? onChange;

  final bool expand;

  const ExportSettingImage(
      {Key? key, required this.iconsExport, required this.onChange, required this.title, required this.expand})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 12),
        Text(title, style: TextStyle(fontSize: 18)),
        RadioListTile<ImageExportEnum>(
          title: Text(getTitleExportImage(ImageExportEnum.inline)),
          value: ImageExportEnum.inline,
          groupValue: iconsExport,
          onChanged: onChange,
        ),
        RadioListTile<ImageExportEnum>(
          title: Text(getTitleExportImage(ImageExportEnum.consts)),
          value: ImageExportEnum.consts,
          groupValue: iconsExport,
          onChanged: onChange,
        ),
        RadioListTile<ImageExportEnum>(
          title: Text(getTitleExportImage(ImageExportEnum.file)),
          value: ImageExportEnum.file,
          groupValue: iconsExport,
          onChanged: onChange,
        ),
      ],
    );
  }
}

String getTitleExportImage(ImageExportEnum iconsExport) {
  switch (iconsExport) {
    case ImageExportEnum.inline:
      return 'Встроенные';
    case ImageExportEnum.consts:
      return 'Константы';
    case ImageExportEnum.file:
      return 'Файл';
  }
}
