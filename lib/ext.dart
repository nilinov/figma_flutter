import 'package:flutter/material.dart';

extension ContainerExt on Container {
  String toCode() {
    return '''
    Container(
      child: $child,
      decoration: $decoration,
      padding: $padding,
    ),
    ''';
  }
}

extension WidgetExt on Widget {
  String toCode() {
    if (this is Container) {
      return '''
      Container(
        decoration: ${((this as Container).decoration as BoxDecoration).toCode()},
        padding: ${((this as Container).padding as EdgeInsets).toCode()},
        child: ${(this as Container).child.toCode()},
      )
      ''';
    } else if (this is Row) {
      return '''
      Row(
        children: [${(this as Row).children.map((e) => e.toCode()).toList().join(', ')}],
        crossAxisAlignment: ${(this as Row).crossAxisAlignment},
        mainAxisAlignment: ${(this as Row).mainAxisAlignment},
      )
      ''';
    } else if (this is Column) {
      return '''
      Column(
        children: [${(this as Column).children.map((e) => e.toCode()).join(', ')}],
        crossAxisAlignment: ${(this as Column).crossAxisAlignment},
        mainAxisAlignment: ${(this as Column).mainAxisAlignment},
      )
      ''';
    } else if (this is Text) {
      return '''
        Text("${(this as Text).data}", textAlign: ${(this as Text).textAlign}, style: ${(this as Text).style.toCode()})
      ''';
    }
    return this.toStringDeep();
  }
}

extension EdgeInsetsExt on EdgeInsets {
  toCode() {
    return '''
    EdgeInsets.only(
      top: $top,
      left: $left,
      right: $right,
      bottom: $bottom,
    )
    ''';
  }
}

extension BoxDecorationExt on BoxDecoration {
  toCode() {
    return '''
        BoxDecoration(
          color: $color,
          border: ${(border as Border).toCode()},
          borderRadius: $borderRadius,
        )
        ''';
  }
}

extension BorderExt on Border {
  toCode() {
    return '''
      Border.all(
        color: ${bottom.color},
        width: ${bottom.width},
      )
    ''';
  }
}

extension TextStyleExt on TextStyle {
  toCode() {
    return '''
      TextStyle(
        fontSize: ${this.fontSize},
        color: ${this.color},
      )
    ''';
  }
}
