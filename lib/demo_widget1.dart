import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DemoWidget1 extends StatefulWidget {
  @override
  _DemoWidget1State createState() => _DemoWidget1State();
}

class _DemoWidget1State extends State<DemoWidget1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        border: null,
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
        bottom: 16,
      ),
      child: Column(
        children: [
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
            child: Row(
              children: [
                Container(
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
                        child: null,
                        left: 5.5,
                        top: 13,
                        width: 10,
                        height: 5,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Text("Технические работы",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xffae0148),
                      )),
                ),
                Container(
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
                        child: null,
                        left: 5.5,
                        top: 13,
                        width: 10,
                        height: 5,
                      )
                    ],
                  ),
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
            ),
          ),
          Expanded(
            child: Text(
                "Уважаемые клиенты! 22 ноября 2020 года мы будем проводить технические работы в ароол...",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xff2e3137),
                )),
          ),
          Expanded(
            child: Text("22 ноября 2020 | 13:05",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xff5a6771),
                )),
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
      ),
    );
  }
}
