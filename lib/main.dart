import 'package:flutter/material.dart';
import 'package:flutter_visible/demo_widget.dart';

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
        '/': (context) => PluginPage(isSample: false),
        '/plugin': (context) => PluginPage(isSample: false),
      },
    );
  }
}

class PluginPage extends StatelessWidget {
  final bool isSample;

  const PluginPage({Key key, this.isSample}) : super(key: key);

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

