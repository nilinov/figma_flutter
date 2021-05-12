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
    if (this == null) return null;

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
    } else if (this is Stack) {
      return '''
      Stack(
        children: [${(this as Stack).children.map((e) => e.toCode()).join(', ')}],
      )
      ''';
    } else if (this is Positioned) {
      return '''
      Positioned(
        child: ${(this as Positioned).child.toCode()},
        left: ${(this as Positioned).left},
        top: ${(this as Positioned).top},
        width: ${(this as Positioned).width},
        height: ${(this as Positioned).height},
      )
      ''';
    } else if (this is Expanded) {
      return '''
      Expanded(
        child: ${(this as Expanded).child.toCode()},
      )
      ''';
    } else if (this is SizedBox) {
      return '''
      SizedBox(
        child: ${(this as SizedBox).child.toCode()},
        width: ${(this as SizedBox).width},
        height: ${(this as SizedBox).height},
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
    if (this == null) return null;

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
          ${(border as Border) != null ? "border: ${(border as Border).toCode()}," : ""}
          borderRadius: $borderRadius,
        )
        ''';
  }
}

extension BorderExt on Border {
  toCode() {
    if (bottom.width == 0) return null;

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
