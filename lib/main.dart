import 'package:flutter/material.dart';
import 'package:flutter_visible/export_styles.dart';
import 'package:flutter_visible/export_styles_scss.dart';
import 'package:flutter_visible/export_widgets.dart';
import 'package:flutter_visible/demo_widget1.dart';
import 'package:flutter_visible/demo_widget_list.dart';
import 'package:flutter_visible/env.dart';
import 'package:flutter_visible/export_type.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        '/': (context) => PluginPage(
              isSample: AppEnv.fromAssets,
              exportType: AppEnv.exportType,
            ),
        '/plugin': (context) => PluginPage(
              isSample: AppEnv.fromAssets,
              exportType: ExportType.all,
            ),
        '/view_properties': (context) => PluginPage(
              isSample: AppEnv.fromAssets,
              exportType: ExportType.properties,
            ),
        '/export_styles': (context) => PluginPage(
              isSample: AppEnv.fromAssets,
              exportType: ExportType.only_files,
            ),
        '/export_styles_scss': (context) => PluginPage(
              isSample: AppEnv.fromAssets,
              exportType: ExportType.scss_styles,
            ),
      },
    );
  }
}

class PluginPage extends StatelessWidget {
  final bool isSample;
  final ExportType exportType;

  const PluginPage({
    Key? key,
    required this.isSample,
    required this.exportType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            if (exportType == ExportType.scss_styles)
              Expanded(
                  child: Container(child: ExportStylesScss(isSample: isSample)))
            else if (exportType == ExportType.only_files)
              Expanded(
                child: Column(
                  children: [
                    Text('Export only files'),
                    Expanded(
                        child: Container(child: ExportStyles(isSample: isSample))),
                  ],
                ),
              )
            else if (exportType == ExportType.properties)
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Back to download',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              )
            else
              GestureDetector(
                onTap: () => Navigator.of(context).pushNamed('/view_properties'),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Open properties',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            if (exportType == ExportType.properties || exportType == ExportType.all)
              Expanded(
                  child: Container(
                child: exportType == ExportType.properties
                    ? DemoWidgetList(isSample: isSample)
                    : ExportWidgets(isSample: isSample),
              ))
            // Expanded(child: Container(child: Widget1())),
          ],
        ),
      ),
    );
  }
}
