import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_visible/get_data.dart';
import 'package:flutter_visible/imports.dart';
import 'package:flutter_visible/utils/download.dart'
    if (dart.library.io) 'package:flutter_visible/utils/download_io.dart'
    if (dart.library.js) 'package:flutter_visible/utils/download_web.dart';

class ExportWidgets extends StatefulWidget {
  final bool isSample;

  const ExportWidgets({Key? key, required this.isSample}) : super(key: key);

  @override
  _ExportWidgetsState createState() => _ExportWidgetsState();
}

enum ImageExportEnum { inline, consts, file }

class _ExportWidgetsState extends State<ExportWidgets> {
  Map<String, dynamic>? json;
  String? name;

  @override
  Future<void> didChangeDependencies() async {
    json = jsonDecode(await getData(widget.isSample));

    if (json != null && json!['json'] == null) {
      if (json!['styles'] != null) {
        Navigator.pushNamed(context, '/export_styles');
      }
    }

    setState(() {});
    super.didChangeDependencies();
    // Future.delayed(Duration(seconds: 1)).then((value) => debugDumpApp());
  }

  bool splitComponent = true;
  bool inlineIcons = true;
  bool inlineImages = true;
  ImageExportEnum iconsExport = ImageExportEnum.inline;
  ImageExportEnum imagesExport = ImageExportEnum.inline;

  List<GWidget> componentsFiles = [];
  List<GWidget> stylesFiles = [];
  List<GWidget> iconsFiles = [];
  List<GWidget> imagesFiles = [];

  GWidget rootFile = GWidget(
    SizedBox(),
    components: [],
    type: 'init',
    widgetType: "SizedBox",
    children: [],
  );
  GWidget importFile = GWidget(
    SizedBox(),
    components: [],
    type: 'init',
    widgetType: "SizedBox",
    children: [],
  );
  GWidget declareAssetsFile = GWidget(
    SizedBox(),
    components: [],
    type: 'init',
    widgetType: "SizedBox",
    children: [],
  );

  @override
  Widget build(BuildContext context) {
    // return Container(child: Widget1(), width: MediaQuery.of(context).size.width * 0.5, height: MediaQuery.of(context).size.height * 0.5);

    if (json != null) {
      StylesApp = getStyles((json!['styles'] as List).map((e) => e as Json).toList());
      final res = getWidgetByMap(json!['json'] ?? {}, 0, name: name);
      final styles = getStyleCode(StylesApp);

      if (res != null) {
        name = name ?? res.name ?? 'screen';

        final List<GWidget> list = getAllComponents(res, result: [])
            // .where((element) => element.type.contains('App'))
            .where((element) => element.type.contains('source'))
            .toList();

        list.sort((e1, e2) => e1.type.contains('svg') && !e2.type.contains('svg') ? 1 : -1);
        list.sort((e1, e2) => e1.type.contains('png') && !e2.type.contains('png') ? -1 : 1);

        final Map<String, GWidget> names = {};

        Future.forEach(list, (GWidget element) => names[element.name ?? ''] = element);

        final assetsExport = getAssets(list, name: name ?? '');

        rootFile = res.copyWith(
          prefixCodeLine: 'import "_$name.dart";',
          name: name,
          widgetType: 'SizedBox',
        );

        importFile = getImports([
          ...list,
          assetsExport,
        ], name: name ?? '');

        declareAssetsFile = assetsExport;

        componentsFiles = [
          ...names.values.where((e) => !(e.type.contains('svg') || e.type.contains('png') || e.type.contains('import'))).map((e) {
            if (e.type.contains('svg') || e.type.contains('png') || e.type.contains('import')) return e;

            return e.copyWith(
              prefixCodeLine: 'import "_$name.dart";\n',
              widgetType: 'SizedBox',
            );
          }),
        ];

        iconsFiles = [...names.values.where((e) => (e.type.contains('svg')))];
        imagesFiles = [...names.values.where((e) => (e.type.contains('png')))];

        stylesFiles = styles;
      }

      Widget widget = res?.widget ?? SizedBox();

      if (res?.widgetType == 'Column') {
        widget = Container(child: widget, height: MediaQuery.of(context).size.height * 0.9);
      }

      print(res?.code);

      final items = [
        DemoWidgetContainer(widget: widget),
        DownloadContainer(
          name: name ?? '',
          onChangeName: (text) => setState(() => name = text),
          iconsExport: iconsExport,
          imagesExport: imagesExport,
          componentsFiles: componentsFiles,
          stylesFiles: stylesFiles,
          iconsFiles: iconsFiles,
          imagesFiles: imagesFiles,
          rootFile: rootFile,
          importFile: importFile,
          declareAssetsFile: declareAssetsFile,
        )
      ];

      if (MediaQuery.of(context).size.width > 800) {
        return Row(
          children: items,
        );
      } else {
        return CarouselSlider(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height - 100,
            enlargeCenterPage: false,
            viewportFraction: 1.0,
          ),
          items: items.map((e) => Container(padding: EdgeInsets.all(10), constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width * 0.9), child: e)).toList(),
        );
      }
    }

    return Center(child: CircularProgressIndicator());
  }
}

class DemoWidgetContainer extends StatelessWidget {
  final Widget widget;

  const DemoWidgetContainer({Key? key, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      child: Container(
        child: SingleChildScrollView(child: Column(children: [widget])),
        constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.9, maxWidth: MediaQuery.of(context).size.width / 2),
      ),
      padding: EdgeInsets.all(20),
    ));
  }
}

class DownloadContainer extends StatelessWidget {
  final String name;
  final Function(String) onChangeName;

  final ImageExportEnum iconsExport;
  final ImageExportEnum imagesExport;

  final List<GWidget> componentsFiles;
  final List<GWidget> stylesFiles;
  final List<GWidget> iconsFiles;
  final List<GWidget> imagesFiles;

  final GWidget rootFile;
  final GWidget importFile;
  final GWidget declareAssetsFile;

  const DownloadContainer(
      {Key? key,
      required this.name,
      required this.onChangeName,
      required this.iconsExport,
      required this.imagesExport,
      required this.componentsFiles,
      required this.stylesFiles,
      required this.iconsFiles,
      required this.imagesFiles,
      required this.rootFile,
      required this.importFile,
      required this.declareAssetsFile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Divider(),
        TextFormField(
          initialValue: name,
          onChanged: onChangeName,
          decoration: InputDecoration(hintText: 'Name component'),
        ),
        Divider(),
        Expanded(
          child: ListView(
            children: [
              ...getDownloadItems([rootFile], label: 'Widget'),
              ...getDownloadItems(componentsFiles, label: 'Nested Components'),
              ...getDownloadItems([declareAssetsFile], label: 'Resource declaration file'),
              ...getDownloadItems(iconsFiles, label: 'Icon files'),
              ...getDownloadItems(imagesFiles, label: 'Images files'),
              ...getDownloadItems([importFile], label: 'Import Declaration File'),
              ...getDownloadItems(stylesFiles, label: 'Styles files'),
            ],
          ),
        ),
        Divider(),
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    ));
  }
}

class ExportSettingImage extends StatelessWidget {
  final String title;
  final ImageExportEnum iconsExport;
  final Function(ImageExportEnum? value)? onChange;

  final bool expand;

  const ExportSettingImage({Key? key, required this.iconsExport, required this.onChange, required this.title, required this.expand}) : super(key: key);

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
      return 'Embedded';
    case ImageExportEnum.consts:
      return 'Constants';
    case ImageExportEnum.file:
      return 'File';
  }
}

List<Widget> getDownloadItems(List<GWidget> componentsFiles, {String? label}) {
  if (componentsFiles.length == 0) return [];

  return [
    if (label != null) Text(label, style: TextStyle(fontSize: 15)),
    ...componentsFiles
        .map((e) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Downloaded.downloadWidget(e);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.save),
                    SizedBox(width: 10),
                    Text(getFileName("${e.name ?? e.type}")),
                  ],
                ),
              ),
            ))
        .toList(),
    SizedBox(height: 15),
  ];
}
