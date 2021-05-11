import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_visible/get_data.dart';

class DemoWidget extends StatefulWidget {
  @override
  _DemoWidgetState createState() => _DemoWidgetState();
}

class _DemoWidgetState extends State<DemoWidget> {
  Map<String, dynamic> json;

  @override
  Future<void> didChangeDependencies() async {
    json = jsonDecode(await getData());
    setState(() {

    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (json != null) return getWidgetByMap(json);

    return Center(child: CircularProgressIndicator());
  }
}
