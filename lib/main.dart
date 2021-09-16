import 'package:flutter/material.dart';
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
            isSample: AppEnv.fromAssets, exportType: AppEnv.exportType, isProperties: false),
        '/plugin': (context) =>
            PluginPage(isSample: false, exportType: ExportType.all, isProperties: false),
        '/view_properties': (context) =>
            PluginPage(isSample: false, exportType: ExportType.all, isProperties: true),
        '/export_styles_scss': (context) =>
            PluginPage(isSample: true, exportType: ExportType.scss_styles, isProperties: false),
      },
    );
  }
}

class PluginPage extends StatelessWidget {
  final bool isSample;
  final bool isProperties;
  final ExportType exportType;

  const PluginPage({Key? key, required this.isSample, required this.exportType, required this.isProperties})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          if (exportType != ExportType.scss_styles) ...[
          if (!isProperties)
            GestureDetector(
              onTap: () => Navigator.of(context).pushNamed('/view_properties'),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Open properties', style: TextStyle(fontSize: 18),),
              ),
            ),
          if (isProperties)
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Back to download', style: TextStyle(fontSize: 18),),
              ),
            ),
          Expanded(
              child: Container(
            child: isProperties
                ? DemoWidgetList(isSample: isSample)
                : DemoWidget(isSample: isSample),
          ))]
          else
            Expanded(
                child: Container(child: ExportStylesScss(isSample: isSample))),
          // Expanded(child: Container(child: Widget1())),
        ],
      ),
    );
  }
}
