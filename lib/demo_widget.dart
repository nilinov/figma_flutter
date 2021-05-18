import 'dart:convert';
import 'dart:js' as js;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_visible/demo_widget1.dart';
import 'package:flutter_visible/get_data.dart';

import 'ext.dart';

class DemoWidget extends StatefulWidget {
  @override
  _DemoWidgetState createState() => _DemoWidgetState();
}

class _DemoWidgetState extends State<DemoWidget> {
  Map<String, dynamic> json;

  @override
  Future<void> didChangeDependencies() async {
    json = jsonDecode(await getData());
    setState(() {});
    super.didChangeDependencies();
    // Future.delayed(Duration(seconds: 1)).then((value) => debugDumpApp());
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Widget1(), width: MediaQuery.of(context).size.width * 0.5, height: MediaQuery.of(context).size.height * 0.5);

    if (json != null) {
      final res = getWidgetByMap(json, 0);
      print(res.toWidget());
      return Row(
        children: [
          Expanded(
              child: Padding(
            child: FittedBox(
              child: Container(child: res),
              fit: BoxFit.contain,
            ),
            padding: EdgeInsets.all(20),
          )),
          Expanded(
              child: Container(
                  child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          js.context
                              .callMethod('fallbackCopyTextToClipboard', [res.toWidget()]);
                        },
                        child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(10),
                          child: Text('Click to clipboard text'),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          js.context
                              .callMethod('fallbackDownloadWidget', [res.toWidget(), 'demo_widget_1.dart']);
                        },
                        child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(10),
                          child: Text('Click to download widget'),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: GestureDetector(
                        onTap: () {
                          js.context
                              .callMethod('fallbackCopyTextToClipboard', [res.toWidget()]);
                        },
                        child: Text(
                          res.toCode(),
                        ),
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
