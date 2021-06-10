import 'package:flutter/material.dart';
import 'package:flutter_visible/imports.dart';
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

class PluginPage extends StatefulWidget {
  final bool isSample;

  const PluginPage({Key? key, required this.isSample}) : super(key: key);

  @override
  _PluginPageState createState() => _PluginPageState();
}

class _PluginPageState extends State<PluginPage> {
  Json json = {};
  GWidget? res;

  @override
  Future<void> didChangeDependencies() async {
    json = jsonDecode(await rootBundle.loadString('assets/data.json'));

    setState(() {
      res = getWidgetByMap(json['json'] ?? {}, 0, name: 'screen');
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final widget = res?.widget ?? CircularProgressIndicator();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [widget],
          ),
        ),
      ),
    );
  }
}
