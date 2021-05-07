import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_visible/demo_widget.dart';
import 'package:path_provider/path_provider.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  GlobalKey scr;

  @override
  void initState() {
    scr = new GlobalKey();
    super.initState();
  }

  takescrshot() async {
    RenderRepaintBoundary boundary = scr.currentContext.findRenderObject();
    var image = await boundary.toImage();
    var byteData = await image.toByteData(format: ImageByteFormat.png);
    var pngBytes = base64Encode(byteData.buffer.asUint8List());
    final path = await _localPath;
    return File('$path/image.txt').writeAsString(pngBytes);
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero).then((value) {
      print('screenshot');
      takescrshot();
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: RepaintBoundary(
                key: scr,
                child: DemoWidget(),
              ),
              constraints: BoxConstraints(maxHeight: 300, maxWidth: 300),
            ),
          ],
        ),
      ),
    );
  }
}
