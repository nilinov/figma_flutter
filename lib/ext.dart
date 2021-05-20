import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

extension WidgetExt on Widget {
  String toCode([bool extractComponents]) {
    if (this == null) return null;

    if (extractComponents == true) {
      final name = (this.key as ValueKey).value.toString().split(':');
      print("name $name");
      if (name[0] == 'COMPONENT' || name[0] == 'INSTANCE') {
        return '''
          ${name[1]}()
        ''';
      }
    }

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
    } else if (this is Align) {
      final Align item = this;
      return '''
        Align(
          child: ${item.child.toCode()},
          ${wrapProp('alignment', item.alignment)}
        )
      ''';
    } else if (this is Divider) {
      final Divider item = this;
      return '''
        Divider(color: ${item.color})
      ''';
    } else if (this is VerticalDivider) {
      final VerticalDivider item = this;
      return '''
        VerticalDivider(color: ${item.color})
      ''';
    } else if (this is SvgPicture) {
      final SvgPicture item = this;
      return '''
        SvgPicture.string(\'''${getKeyValue(item)}\''',${getKey(item)}
        ${wrapProp('width', item.width)}
        ${wrapProp('height', item.height)}
        )
      ''';
    } else if (this is Image) {
      final Image item = this;
      return '''
        SvgPicture.string(\'''${getKeyValue(item)}\''', ${getKey(item)}
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

  List<String> toWidgetsExport() {

  }

  List<String> toWidgets({String name}) {
    return [
      '''
      class ${name ?? 'Widget1'} extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
          return ${toCode(true)};
        }
      }
    '''];
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
    final _borderRadius = (borderRadius != null && borderRadius != BorderRadius.zero) ? borderRadius : null;
    return '''
        BoxDecoration(
          ${wrapProp('color', color)}
          ${wrapProp('border', _border)}
          ${wrapProp('borderRadius', _borderRadius)}
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
  if (item.key == null) return '';
  dynamic value = (item.key as ValueKey)?.value ?? item.key;
  if (value is Map<String, String>) {
    if (value['type'] == 'SVG' || value['type'] == 'PNG') {
      value = '${value['type']}:${value['name']}';
    }
  }

  value = value.toString();

  final String key = '$value:${numKey.toString()}';
  numKey++;
  return (key != null && key != 'null') ? "\nkey: Key('''$key''')," : '';
}

getKeyValue(Widget item) {
  if (item.key == null) return '';
  dynamic value = (item.key as ValueKey)?.value;
  if (value is Map<String, String>) {
    if (value['type'] == 'SVG' || value['type'] == 'PNG') {
      return value['value'];
    }
  }

  return value.split(':')[1] ?? value;
}

wrapProp(String name, dynamic value) {
  if (value != null) {
    return "$name: $value,";
  }

  return '';
}
