import 'dart:convert';
import 'dart:js' as js;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    if (json != null) {
      final res = getWidgetByMap(json);
      print(res.toCode());
      return Row(
        children: [
          Expanded(child: Container(child: res)),
          Expanded(
              child: GestureDetector(
                onTap: () {
                  js.context
                      .callMethod('fallbackCopyTextToClipboard', [res.toCode()]);
                },
                child: Container(
                    child: Column(
            children: [
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  child: Text('Click to clipboard text'),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      res.toCode(),
                    ),
                  ),
                ),
            ],
          )),
              )),
        ],
      );
    }

    return Center(child: CircularProgressIndicator());
  }
}
