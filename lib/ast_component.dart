/*
import 'package:flutter/cupertino.dart';

abstract class AstComponent {
  final String? name;

  AstComponent({required this.name});

  dynamic toComponent();

  String print();
}

mixin AstComponentExt implements AstComponent {
  String? name;

  toComponent();

  String print();
}

abstract class AstChild with AstComponentExt {
  final AstComponent child;

  AstChild({required this.child});
}

class AstBoxDecoration with AstComponentExt {
  final String name = 'BoxDecoration';
  final AstColor color;
  final AstBorder? border;
  final AstBorderRadius? borderRadius;
  final Map<String, dynamic> json;

  AstBoxDecoration(
      {required this.color,
      this.border,
      this.borderRadius,
      required this.json});

  factory AstBoxDecoration.fromJson(Map<String, dynamic> json) =>
      AstBoxDecoration(
        color: AstColor.fromJson(
          json['fills'].firstWhere((element) => element['type'] == 'SOLID',
              orElse: () => null),
        ),
        borderRadius: AstBorderRadius.fromJson(json),
        border: AstBorder.fromJson(json),
        json: json,
      );

  @override
  BoxDecoration toComponent() {
    return BoxDecoration(
      border: AstBorder.fromJson(json).toComponent(),
      color: AstColor.fromJsonFills(json).toComponent(),
      borderRadius: AstBorderRadius.fromJson(json).toComponent(),
    );
  }
}

class AstBorderRadius with AstComponentExt {
  final name = 'BorderRadius';
  final double topLeft;
  final double topRight;
  final double bottomLeft;
  final double bottomRight;

  AstBorderRadius({
    required this.topLeft,
    required this.topRight,
    required this.bottomLeft,
    required this.bottomRight,
  });

  factory AstBorderRadius.fromJson(Map<String, dynamic> json) =>
      AstBorderRadius(
        topLeft: json['topLeftRadius'] ?? 0,
        topRight: json['topRightRadius'] ?? 0,
        bottomLeft: json['bottomLeftRadius'] ?? 0,
        bottomRight: json['bottomRightRadius'] ?? 0,
      );

  @override
  String print() {
    return this.toComponent().toString();
  }

  @override
  toComponent() {
    return BorderRadius.only(
      topLeft: Radius.circular(topLeft ?? 0),
      topRight: Radius.circular(topRight ?? 0),
      bottomLeft: Radius.circular(bottomLeft ?? 0),
      bottomRight: Radius.circular(bottomRight ?? 0),
    );
  }
}

class AstBorder with AstComponentExt {
  final name = 'Border';
  final AstColor color;
  final double width;

  AstBorder({
    required this.color,
    required this.width,
  });

  factory AstBorder.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return AstBorder(
      color: AstColor.fromJson(json['color']),
      width: json['strokeWeight'] ?? 0,
    );
  }

  @override
  String print() {
    return toComponent().toString();
  }

  @override
  toComponent() {
    return Border.all(
      color: color.toComponent(),
      width: this.width ?? 0,
    );
  }
}

class AstColor with AstComponentExt {
  final name = 'Color';
  final int? r;
  final int? g;
  final int? b;
  final double? o;

  AstColor({
    required this.r,
    required this.g,
    required this.b,
    this.o,
  });

  factory AstColor.fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    return AstColor(
      r: (json['r'] * 255).round(),
      g: (json['g'] * 255).round(),
      b: (json['b'] * 255).round(),
    );
  }

  factory AstColor.fromJsonFills(Map<String, dynamic> json) {
    if (json == null) return null;

    final color = (json['fills'] ?? []).firstWhere(
        (element) => element['type'] == 'SOLID',
        orElse: () => null);

    if (color != null) {
      return AstColor(
        r: (color['r'] * 255).round(),
        g: (color['g'] * 255).round(),
        b: (color['b'] * 255).round(),
      );
    }

    return null;
  }

  @override
  String print() {
    return this.toComponent().toString();
  }

  @override
  toComponent() {
    return Color.fromRGBO(this.r!, this.g!, this.b!, this.o ?? 1);
  }
}

class AstSizes {
  final double width;
  final double height;

  AstSizes({required this.width, required this.height});

  factory AstSizes.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return AstSizes(
      width: json['width'] ?? 0,
      height: json['height'] ?? 0,
    );
  }
}

class AstEdgeInsets with AstComponentExt {
  final double top;
  final double left;
  final double right;
  final double bottom;

  AstEdgeInsets({
    required this.top,
    required this.left,
    required this.right,
    required this.bottom,
  });

  factory AstEdgeInsets.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return AstEdgeInsets(
      top: json['paddingTop'] ?? 0,
      left: json['paddingLeft'] ?? 0,
      right: json['paddingRight'] ?? 0,
      bottom: json['paddingBottom'] ?? 0,
    );
  }

  @override
  String print() {
    return toComponent().toString();
  }

  @override
  toComponent() {
    return EdgeInsets.only(
      top: top ?? 0,
      left: left ?? 0,
      right: right ?? 0,
      bottom: bottom ?? 0,
    );
  }
}

class AstContainer with AstComponentExt implements AstChild, AstComponent {
  final String name = 'Container';

  final AstComponent child;
  final AstBoxDecoration decoration;
  final AstEdgeInsets padding;
  final AstSizes size;

  AstContainer({
    required this.child,
    required this.decoration,
    required this.padding,
    required this.size,
  });

  @override
  String print() {
    return this.toComponent().toString();
  }

  @override
  toComponent() {
    return Container(
      decoration: decoration.toComponent(),
      padding: padding.toComponent(),
      child: child.toComponent(),
    );
  }
}

class AstLayout with AstComponentExt {
  final List<AstComponent> items;
  final Axis? axis;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  AstLayout({
    required this.items,
    required this.axis,
    required this.mainAxisAlignment,
    required this.crossAxisAlignment,
  });

  factory AstLayout.fromJson(Map<String, dynamic> json) {
    if (json == null || json['children'] == null) return null;
    Axis? axis;

    switch(json['layoutMode']) {
      case 'VERTICAL':
        axis = Axis.vertical;
        break;
      case 'HORIZONTAL':
        axis = Axis.horizontal;
        break;
    }

    return AstLayout(
      items: [],
      axis: axis,
      crossAxisAlignment: getCrossAxisAlignment(json),
      mainAxisAlignment: getMainAxisAlignment(json),
    );
  }

  @override
  String print() {
    // TODO: implement print
    throw UnimplementedError();
  }

  @override
  toComponent() {
    // TODO: implement toComponent
    throw UnimplementedError();
  }
}

getCrossAxisAlignment(Map<String, dynamic> json) {
  print('getCrossAxisAlignment');
  if (json['constraints'] != null) {
    switch (json['constraints']['vertical']) {
      case 'CENTER':
        return CrossAxisAlignment.center;
    }
  }
  switch (json['counterAxisAlignItems']) {
    case 'CENTER':
      return CrossAxisAlignment.center;
  }
  return CrossAxisAlignment.start;
}

getMainAxisAlignment(Map<String, dynamic> json) {
  print('getCrossAxisAlignment');
  if (json['constraints'] != null) {
    switch (json['constraints']['horizontal']) {
      case 'CENTER':
        return MainAxisAlignment.center;
    }
  }
  switch (json['primaryAxisAlignItems']) {
    case 'CENTER':
      return MainAxisAlignment.center;
  }

  return MainAxisAlignment.start;
}
*/
