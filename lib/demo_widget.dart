import 'package:flutter/cupertino.dart';
import 'package:flutter_visible/get_data.dart';

class DemoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return getWidgetByMap(getData());
  }
}
