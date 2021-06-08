import 'package:flutter_visible/imports.dart';

extension WidgetExt on Widget? {
  String? toCode({required bool extractComponents}) {
    if (this == null) return null;

    if (extractComponents == true && this!.key != null) {
      final value = (this!.key as ValueKey).value;
      if (value is Map) {
        if (value['type'] == 'WIDGET') {
          return '''
          ${value['name']}()
        ''';
        }
      }
    }

    if (this is Container) {
      final Container item = this as Container;
      final padding = (item.padding as EdgeInsets?).toCode();

      final valDecoration = (item.decoration as BoxDecoration).toCode();

      return '''
      Container(
        ${getKey(item)}
        ${valDecoration != '' ? "decoration: $valDecoration," : ""}
        ${padding != null ? "padding: ${(item.padding as EdgeInsets?).toCode()}," : ""}
        child: ${item.child.toCode(extractComponents: extractComponents)},
      )
      ''';
    } else if (this is Row) {
      final Row item = this as Row;
      return '''
      Row(
        ${getKey(item)}
        children: [${item.children.map((e) => e.toCode(extractComponents: extractComponents)).join(', ')}],
        crossAxisAlignment: ${item.crossAxisAlignment},
        mainAxisAlignment: ${item.mainAxisAlignment},
      )
      ''';
    } else if (this is Column) {
      final Column item = this as Column;
      return '''
      Column(
        ${getKey(item)}
        children: [${item.children.map((e) => e.toCode(extractComponents: extractComponents)).join(', ')}],
        crossAxisAlignment: ${item.crossAxisAlignment},
        mainAxisAlignment: ${item.mainAxisAlignment},
      )
      ''';
    } else if (this is Stack) {
      final Stack item = this as Stack;
      return '''
      Stack(
        ${getKey(item)}
        children: [${item.children.map((e) => e.toCode(extractComponents: extractComponents)).join(', ')}],
      )
      ''';
    } else if (this is Positioned) {
      final Positioned item = this as Positioned;
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
      final Expanded item = this as Expanded;
      return '''
      Expanded(
        ${getKey(item)}
        child: ${(this as Expanded).child.toCode(extractComponents: extractComponents)},
      )
      ''';
    } else if (this is SizedBox) {
      final SizedBox item = this as SizedBox;
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
      final Text item = this as Text;
      return '''
        Text("${(this as Text).data}", ${getKey(item)} textAlign: ${(this as Text).textAlign}, style: ${(this as Text).style!.toCode()})
      ''';
    } else if (this is Align) {
      final Align item = this as Align;
      return '''
        Align(
          child: ${item.child.toCode(extractComponents: extractComponents)},
          ${wrapProp('alignment', item.alignment)}
        )
      ''';
    } else if (this is Divider) {
      final Divider item = this as Divider;
      return '''
        Divider(color: ${item.color})
      ''';
    } else if (this is VerticalDivider) {
      final VerticalDivider item = this as VerticalDivider;
      return '''
        VerticalDivider(color: ${item.color})
      ''';
    } else if (this is SvgPicture) {
      final SvgPicture item = this as SvgPicture;
      return '''
        SvgPicture.string(\'''{getKeyValue(item)}\''',${getKey(item)}
        ${wrapProp('width', item.width)}
        ${wrapProp('height', item.height)}
        )
      ''';
    } else if (this is Image) {
      final Image item = this as Image;
      return '''
        SvgPicture.string(\'''{getKeyValue(item)}\''', ${getKey(item)}
        ${wrapProp('width', item.width)}
        ${wrapProp('height', item.height)}
        )
      ''';
    }
    return this!.toStringDeep();
  }

  String toWidget({String? name}) {
    return '''
      class ${name ?? 'Widget1'} extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
          return ${toCode(extractComponents: false)};
        }
      }
    ''';
  }

  List<String> toWidgetsExport() {
    return [];
  }

  List<String> toWidgets({String? name}) {
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

extension EdgeInsetsExt on EdgeInsets? {
  toCode() {
    if (this == null) return null;

    if (this!.top == 0 && this!.left == 0 && this!.right == 0 && this!.bottom == 0) return null;
    if (this!.top == this!.left && this!.left == this!.right && this!.right == this!.bottom)
      return 'EdgeInsets.all($this!.left)';

    return '''
    EdgeInsets.only(
      ${wrapProp('top', this!.top)}
      ${wrapProp('left', this!.left)}
      ${wrapProp('right', this!.right)}
      ${wrapProp('bottom', this!.bottom)}
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

    final valColor = wrapProp('color', color, excludeValue: Color(0x00000000));
    final valBorder = wrapProp('border', _border);
    final valBorderRadius = wrapProp('borderRadius', _borderRadius);

    final isEmpty = valColor.isEmpty && valBorder.isEmpty && valBorderRadius.isEmpty;

    if (isEmpty) return '';

    final val = [valColor, valBorder, valBorderRadius].where((element) => element.isNotEmpty).join('\n');

    return '''
        BoxDecoration(
          $val
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
  dynamic value = (item.key as ValueKey?)?.value ?? item.key;
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
  dynamic value = (item.key as ValueKey?)?.value ?? item.key;
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
  dynamic value = (item.key as ValueKey?)?.value;
  if (value is Map) {
    if (value['type'] == 'SVG' || value['type'] == 'PNG') {
      return value['value'];
    } else if (value['type'] == 'WIDGET') {
      return value['value'];
    }
  }

  return value.split(':')[1] ?? value;
}

String wrapProp(String name, dynamic value, {dynamic excludeValue}) {
  if (value != null && value != excludeValue) {
    if (value is String && value.isNotEmpty) {
      return "$name: $value,";
    }
    if (value is double || value is num || value is int) {
      if (value == double.infinity) {
        return "$name: double.infinity,";
      }
      return "$name: $value,";
    }
    if (value is Color) {
      return "$name: $value,";
    }
    if (value is EdgeInsets) {
      if (value.top == 0 && value.bottom == 0 && value.left == 0 && value.right == 0) {
        return '';
      }

      return "const EdgeInsets.only(top: ${value.top}, bottom: ${value.bottom}, left: ${value.left}, right: ${value.right}),";
    }
    if (value is bool) {
      return "$name: $value,";
    }
  }

  return '';
}

List<Widget?> getChildren(List<Widget?> items) {
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
