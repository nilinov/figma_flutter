import 'package:flutter/material.dart';
import 'package:flutter_visible/demo_widget.dart';
import 'package:flutter_visible/demo_widget1.dart';
import 'package:flutter_visible/demo_widget_list.dart';
import 'package:flutter_visible/env.dart';

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
        '/': (context) =>
            PluginPage(isSample: AppEnv.fromAssets, isProperties: false),
        '/plugin': (context) =>
            PluginPage(isSample: false, isProperties: false),
        '/view_properties': (context) =>
            PluginPage(isSample: false, isProperties: true),
      },
    );
  }
}

class PluginPage extends StatelessWidget {
  final bool isSample;
  final bool isProperties;

  const PluginPage(
      {Key? key, required this.isSample, required this.isProperties})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
          )),
          // Expanded(child: Container(child: Widget1())),
        ],
      ),
    );
  }
}
