import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Widget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey(
          '{type: WIDGET, value: Column(direction: vertical, mainAxisAlignment: start, crossAxisAlignment: start), name: info}'),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            child: Text("Кофе латте 300 мл за 59 ₽",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: "Roboto-Bold",
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.3799999952316284)),
          ),
          SizedBox(height: 8),
          Container(
            key: ValueKey(
                '{type: WIDGET, value: Row(direction: horizontal, mainAxisAlignment: start, crossAxisAlignment: start), name: FRAME:row_info (2) 324:516}'),
            width: null,
            height: 24,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  key: ValueKey(
                      '{type: WIDGET, value: Row(direction: horizontal, mainAxisAlignment: start, crossAxisAlignment: center), name: FRAME:date (4) 324:383}'),
                  width: null,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.string(
                        '''<svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
<circle cx="10" cy="10" r="8" stroke="#8A96A5" stroke-width="1.8"/>
<path d="M10 5V10.4167L13.5 13.5" stroke="#8A96A5" stroke-width="1.8"/>
</svg>
''',
                        key: ValueKey('icon / 20 / clock'),
                        height: 20,
                        width: 20,
                      ),
                      SizedBox(width: 6),
                      Expanded(
                          child: Text("до 11 января 2021",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Roboto-Regular",
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: -0.23999999463558197)))
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  key: ValueKey(
                      '{type: WIDGET, value: Row(direction: horizontal, mainAxisAlignment: start, crossAxisAlignment: start), name: FRAME:count_coupons (4) 324:454}'),
                  width: null,
                  height: null,
                  decoration: BoxDecoration(
                    color: Color(0xff1d8d31),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Купонов 2",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontFamily: "Roboto-Black",
                              fontStyle: FontStyle.normal,
                              letterSpacing: -0.4099999964237213))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
