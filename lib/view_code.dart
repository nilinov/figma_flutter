import 'package:flutter/foundation.dart';
import 'package:flutter_visible/get_data.dart';
import 'package:flutter_visible/imports.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ViewCode extends StatefulWidget {
  final bool isSample;

  const ViewCode({Key? key, required this.isSample}) : super(key: key);

  @override
  _ViewCodeState createState() => _ViewCodeState();
}

class _ViewCodeState extends State<ViewCode> {
  Map<String, dynamic>? json;
  String? name;
  late String code;

  @override
  Future<void> didChangeDependencies() async {
    json = jsonDecode(await getData(widget.isSample));

    if (json != null && json!['json'] == null) {
      if (json!['styles'] != null) {
        Navigator.pushNamed(context, '/');
      }
    }

    setState(() {});
    super.didChangeDependencies();
    // Future.delayed(Duration(seconds: 1)).then((value) => debugDumpApp());
  }

  @override
  Widget build(BuildContext context) {
    // return Container(child: Widget1(), width: MediaQuery.of(context).size.width * 0.5, height: MediaQuery.of(context).size.height * 0.5);

    if (json != null) {
      StylesApp = getStyles((json!['styles'] as List).map((e) => e as Json).toList());
      final res = getWidgetByMap(json!['json'] ?? {}, 0, name: name);

      if (res != null) {
        name = name ?? res.name ?? 'screen';

        code = res.fullCode ?? '';
      } else {
        code = '';
      }

      Widget widget = res?.widget ?? SizedBox();

      if (res?.widgetType == 'Column') {
        widget = Container(child: widget, height: MediaQuery.of(context).size.height * 0.9);
      }

      return SingleChildScrollView(child: GestureDetector(
        onTap: () async {
          await Clipboard.setData(ClipboardData(text: code));
          Fluttertoast.showToast(msg: "Success copy");
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SelectableText(code),
        ),
      ));
    }

    return SizedBox();
  }
}
