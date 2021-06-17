import 'package:flutter/material.dart';
import 'package:flutter_visible/export_styles_scss.dart';
import 'package:flutter_visible/export_widgets.dart';
import 'package:flutter_visible/demo_widget1.dart';
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
            isSample: AppEnv.fromAssets, exportType: AppEnv.exportType),
        '/plugin': (context) =>
            PluginPage(isSample: false, exportType: ExportType.all),
        '/export_styles_scss': (context) =>
            PluginPage(isSample: true, exportType: ExportType.scss_styles),
      },
    );
  }
}

class PluginPage extends StatelessWidget {
  final bool isSample;
  final ExportType exportType;

  const PluginPage({Key? key, required this.isSample, required this.exportType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Version: 1'),
          if (exportType != ExportType.scss_styles)
            Expanded(
                child: Container(child: ExportWidgets(isSample: isSample))),
          if (exportType == ExportType.scss_styles)
            Expanded(
                child: Container(child: ExportStylesScss(isSample: isSample))),
          // Expanded(child: Container(child: Widget1())),
        ],
      ),
    );
  }
}
