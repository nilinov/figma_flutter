import 'package:flutter_visible/imports.dart';

extension WidgetExt on Widget {
  String toCode({@required bool extractComponents}) {
    if (this == null) return null;

    if (extractComponents == true && this.key != null) {
      final value = (this.key as ValueKey).value;
      if (value is Map) {
        if (value['type'] == 'WIDGET') {
          return '''
          ${value['name']}()
        ''';
        }
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
        child: ${item.child.toCode(extractComponents: extractComponents)},
      )
      ''';
    } else if (this is Row) {
      final Row item = this;
      return '''
      Row(
        ${getKey(item)}
        children: [${item.children.where((element) => element != null).map((e) => e.toCode(extractComponents: extractComponents)).join(', ')}],
        crossAxisAlignment: ${item.crossAxisAlignment},
        mainAxisAlignment: ${item.mainAxisAlignment},
      )
      ''';
    } else if (this is Column) {
      final Column item = this;
      return '''
      Column(
        ${getKey(item)}
        children: [${item.children.where((element) => element != null).map((e) => e.toCode(extractComponents: extractComponents)).join(', ')}],
        crossAxisAlignment: ${item.crossAxisAlignment},
        mainAxisAlignment: ${item.mainAxisAlignment},
      )
      ''';
    } else if (this is Stack) {
      final Stack item = this;
      return '''
      Stack(
        ${getKey(item)}
        children: [${item.children.map((e) => e.toCode(extractComponents: extractComponents)).join(', ')}],
      )
      ''';
    } else if (this is Positioned) {
      final Positioned item = this;
      return '''
      Positioned(
        ${getKey(item)}
        child: ${item.child.toCode(extractComponents: extractComponents)},
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
        child: ${(this as Expanded).child.toCode(extractComponents: extractComponents)},
      )
      ''';
    } else if (this is SizedBox) {
      final SizedBox item = this;
      if (item.child == null && item.width == null && item.height == null)
        return null;
      return '''
      SizedBox(
        ${getKey(item)}
        child: ${item.child.toCode(extractComponents: extractComponents)},
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
          child: ${item.child.toCode(extractComponents: extractComponents)},
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
      class ${name ?? 'Widget1'} extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
          return ${toCode(extractComponents: false)};
        }
      }
    ''';
  }

  List<String> toWidgetsExport() {}

  List<String> toWidgets({String name}) {
    final items = getChildren([this]);

    return [
      ...items.map((e) {
        return e.toWidget();
      }),
      '''
      class ${name ?? 'Widget1'} extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
          return ${toCode(extractComponents: true)};
        }
      }
    '''
    ];
  }
}

extension EdgeInsetsExt on EdgeInsets {
  toCode() {
    if (this == null) return null;
    if (top == 0 && left == 0 && right == 0 && bottom == 0) return null;
    if (top == left && left == right && right == bottom)
      return 'EdgeInsets.all($left)';

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
    final _borderRadius =
        (borderRadius != null && borderRadius != BorderRadius.zero)
            ? borderRadius
            : null;
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
  if (value is Map) {
    if (value['type'] == 'SVG' || value['type'] == 'PNG') {
      value = '${value['type']}:${value['name']}';
    } else if (value['type'] == 'WIDGET') {
      value = '${value['type']}:${value['name']}';
    }
  }

  value = value.toString();

  final String key = '$value:${numKey.toString()}';
  numKey++;
  return (key != null && key != 'null') ? "\nkey: Key('$key')," : '';
}

getKeyName(Widget item) {
  print(item);
  if (item.key == null) return '';
  dynamic value = (item.key as ValueKey)?.value ?? item.key;
  if (value is Map) {
    if (value['type'] == 'SVG' || value['type'] == 'PNG') {
      return value['name'];
    } else if (value['type'] == 'WIDGET') {
      return value['name'];
    }
  }

  return value.toString();
}

getKeyValue(Widget item) {
  if (item.key == null) return '';
  dynamic value = (item.key as ValueKey)?.value;
  if (value is Map) {
    if (value['type'] == 'SVG' || value['type'] == 'PNG') {
      return value['value'];
    } else if (value['type'] == 'WIDGET') {
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

List<Widget> getChildren(List<Widget> items) {
  for (var i = 0; i < items.length; i++) {
    final item = items[i];

    if (item is Row || item is Column || item is Stack) {
      return [...items, ...getChildren((item as dynamic).children)];
    }

    if (item is Container ||
        item is Positioned ||
        item is Expanded ||
        item is SizedBox ||
        item is Align) {
      return [
        ...items,
        ...getChildren([(item as dynamic).child])
      ];
    }
  }
  return items;
}
