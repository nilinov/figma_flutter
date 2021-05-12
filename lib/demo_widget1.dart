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
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0x00000000),
        border: null,
        borderRadius: BorderRadius.zero,
      ),
      padding: EdgeInsets.only(
        top: 0,
        left: 16,
        right: 16,
        bottom: 0,
      ),
      child: Column(
        children: [
          Expanded(
            child: Text("Поделиться купоном",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 25,
                  color: Color(0xff141e2e),
                )),
          ),
          Expanded(
            child: Text(
                "Введите номер телефона друга, с которым вы хотите поделиться этим купоном",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xff141e2e),
                )),
          ),
          SizedBox(
            child: null,
            width: null,
            height: null,
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xffae0148),
              border: null,
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: EdgeInsets.only(
              top: 13,
              left: 10,
              right: 10,
              bottom: 13,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text("Поделиться",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(0xffffffff),
                      )),
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
      ),
    );
  }
}
