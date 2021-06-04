import 'package:flutter/material.dart';
import 'package:flutter_visible/demo_widget.dart';
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
        '/': (context) => PluginPage(isSample: AppEnv.fromAssets),
        '/plugin': (context) => PluginPage(isSample: false),
      },
    );
  }
}

class PluginPage extends StatelessWidget {
  final bool isSample;

  const PluginPage({Key? key, required this.isSample}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Version: 1'),
          Expanded(child: Container(child: DemoWidget(isSample: isSample))),
        ],
      ),
    );
  }
}

