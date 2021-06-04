import 'package:flutter_visible/imports.dart';

class GWidget<T extends Widget> {
  final T widget;
  final String code;

  const GWidget(this.widget, this.code);
}

class GWidgetList<T>  {
  final List<T> widget;
  final List<String> code;

  const GWidgetList(this.widget, this.code);
}


const gWidgetSizedBox = const GWidget(SizedBox(), "SizedBox()");
