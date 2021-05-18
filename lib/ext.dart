import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

extension WidgetExt on Widget {
  String toCode() {
    if (this == null) return null;

    if (this is Container) {
      final Container item = this;
      final padding = (item.padding as EdgeInsets).toCode();
      return '''
      Container(
        ${getKey(item)}
        decoration: ${(item.decoration as BoxDecoration).toCode()},
        ${padding != null ? "padding: ${(item.padding as EdgeInsets).toCode()}," : ""}
        child: ${item.child.toCode()},
      )
      ''';
    } else if (this is Row) {
      final Row item = this;
      return '''
      Row(
        ${getKey(item)}
        children: [${item.children.where((element) => element != null).map((e) => e.toCode()).join(', ')}],
        crossAxisAlignment: ${item.crossAxisAlignment},
        mainAxisAlignment: ${item.mainAxisAlignment},
      )
      ''';
    } else if (this is Column) {
      final Column item = this;
      return '''
      Column(
        ${getKey(item)}
        children: [${item.children.where((element) => element != null).map((e) => e.toCode()).join(', ')}],
        crossAxisAlignment: ${item.crossAxisAlignment},
        mainAxisAlignment: ${item.mainAxisAlignment},
      )
      ''';
    } else if (this is Stack) {
      final Stack item = this;
      return '''
      Stack(
        ${getKey(item)}
        children: [${item.children.map((e) => e.toCode()).join(', ')}],
      )
      ''';
    } else if (this is Positioned) {
      final Positioned item = this;
      return '''
      Positioned(
        ${getKey(item)}
        child: ${item.child.toCode()},
        ${wrapProp('top', item.top)}
        ${wrapProp('left', item.left)}
        ${wrapProp('right', item.right)}
        ${wrapProp('bottom', item.bottom)}
      )
      ''';
    } else if (this is Expanded) {
      final Expanded item = this;
      return '''
      Expanded(
        ${getKey(item)}
        child: ${(this as Expanded).child.toCode()},
      )
      ''';
    } else if (this is SizedBox) {
      final SizedBox item = this;
      if (item.child == null && item.width == null && item.height == null) return null;

      return '''
      SizedBox(
        ${getKey(item)}
        child: ${item.child.toCode()},
        ${wrapProp('width', item.width)}
        ${wrapProp('height', item.height)}
      )
      ''';
    } else if (this is Text) {
      final Text item = this;
      return '''
        Text("${(this as Text).data}", ${getKey(item)} textAlign: ${(this as Text).textAlign}, style: ${(this as Text).style.toCode()})
      ''';
    } else if (this is SvgPicture) {
      final SvgPicture item = this;
      return '''
        SvgPicture.string(\'''${(this as SvgPicture).key.toString().split('SVG:')[1]}\''',${getKey(item)}
        ${wrapProp('width', item.width)}
        ${wrapProp('height', item.height)}
        )
      ''';
    } else if (this is Image) {
      final Image item = this;
      return '''
        SvgPicture.string(\'''${item.key.toString().split('PNG:')[1]}\''', ${getKey(item)}
        ${wrapProp('width', item.width)}
        ${wrapProp('height', item.height)}
        )
      ''';
    }
    return this.toStringDeep();
  }

  String toWidget({String name}) {
    return '''
      import 'package:flutter/cupertino.dart';
      import 'package:flutter_svg/flutter_svg.dart';

      class ${name ?? 'Widget1'} extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
          return ${toCode()};
        }
      }
    ''';
  }
}

extension EdgeInsetsExt on EdgeInsets {
  toCode() {
    if (this == null) return null;
    if (top == 0 && left == 0 && right == 0 && bottom == 0) return null;
    if (top == left && left == right && right ==  bottom) return 'EdgeInsets.all($left)';

    return '''
    EdgeInsets.only(
      ${wrapProp('top', top)}
      ${wrapProp('left', left)}
      ${wrapProp('right', right)}
      ${wrapProp('bottom', bottom)}
    )
    ''';
  }
}

extension BoxDecorationExt on BoxDecoration {
  toCode() {
    final _border = border != null ? (border as Border).toCode() : null;
    return '''
        BoxDecoration(
          color: $color,
          ${wrapProp('border', _border)}
          ${wrapProp('borderRadius', borderRadius)}
        )
        ''';
  }
}

extension BorderExt on Border {
  toCode() {
    if (bottom.width == 0) return null;

    return '''
      Border.all(
        ${wrapProp('color', bottom.color)}
        ${wrapProp('width', bottom.width)}
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

int numKey = 1;

getKey(Widget item) {
  final String key = '${numKey.toString()}_' + item.key.toString();
  numKey++;
  return (key != null && key != 'null') ? "\nkey: Key('''$key''')," : '';
}

wrapProp(String name, dynamic value) {
  if (value != null) {
    return "$name: $value,";
  }

  return '';
}
