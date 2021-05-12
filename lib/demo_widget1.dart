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
          Container(
            decoration: BoxDecoration(
              color: Color(0x00000000),
              border: null,
              borderRadius: BorderRadius.zero,
            ),
            padding: EdgeInsets.only(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
            ),
            child: Stack(
              children: [
                Positioned(
                  child: Expanded(
                    child: Text("+7 (999) 678-99-00|",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 15,
                          color: null,
                        )),
                  ),
                  left: 16,
                  top: 32,
                  width: 319,
                  height: 20,
                ),
                Positioned(
                  child: Expanded(
                    child: Text("Номер телефона",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xff8a96a5),
                        )),
                  ),
                  left: 16,
                  top: 12,
                  width: 343,
                  height: 16,
                ),
                Positioned(
                  child: SizedBox(
                    child: null,
                    width: null,
                    height: null,
                  ),
                  left: 16,
                  top: 64,
                  width: 359,
                  height: 0,
                ),
                Positioned(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      border: null,
                      borderRadius: BorderRadius.zero,
                    ),
                    padding: EdgeInsets.only(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          child: SizedBox(
                            child: null,
                            width: null,
                            height: null,
                          ),
                          left: 5.5,
                          top: 13,
                          width: 10,
                          height: 5,
                        )
                      ],
                    ),
                  ),
                  left: 351,
                  top: 24,
                  width: 16,
                  height: 16,
                )
              ],
            ),
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
