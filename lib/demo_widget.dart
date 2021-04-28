import 'package:flutter/cupertino.dart';

class DemoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12))),
        padding: EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
        child: Column(
          children: [
            Container(
                child: Row(
              children: [
                Expanded(
                    child: Text("Технические работы",
                        style: TextStyle(color: Color.fromRGBO(174, 1, 72, 1)), textAlign: TextAlign.center))
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            )),
            Text("Уважаемые клиенты! 22 ноября 2020 года мы будем проводить технические работы в ароол...",
                style: TextStyle(color: Color.fromRGBO(46, 49, 55, 1)), textAlign: TextAlign.left),
            Text("22 ноября 2020  |  13:05",
                style: TextStyle(color: Color.fromRGBO(90, 103, 113, 1)), textAlign: TextAlign.left)
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ));
  }
}
