import 'package:flutter_visible/get_data.dart';
import 'package:flutter_visible/imports.dart';

class DemoWidgetList extends StatefulWidget {
  final bool isSample;

  const DemoWidgetList({Key? key, required this.isSample}) : super(key: key);

  @override
  _DemoWidgetListState createState() => _DemoWidgetListState();
}

enum ImageExportEnum { inline, consts, file }

class _DemoWidgetListState extends State<DemoWidgetList> {
  Map<String, dynamic>? json;
  String? name;

  GWidget? selectedChild;

  @override
  Future<void> didChangeDependencies() async {
    json = jsonDecode(await getData(widget.isSample));
    setState(() {});
    super.didChangeDependencies();
    // Future.delayed(Duration(seconds: 1)).then((value) => debugDumpApp());
  }

  @override
  Widget build(BuildContext context) {
    // return Container(child: Widget1(), width: MediaQuery.of(context).size.width * 0.5, height: MediaQuery.of(context).size.height * 0.5);

    if (json != null) {
      final res = getWidgetByMap(json!['json'] ?? {}, 0, name: name);

      if (res != null) {
        name = name ?? res.name ?? 'screen';
      }

      Widget widget = res?.widget ?? SizedBox();

      // print(res.toWidget());
      return Row(
        children: [
          Expanded(
              child: Padding(
            child: Container(
              child: SingleChildScrollView(child: Column(children: [widget])),
              constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.9, maxWidth: MediaQuery.of(context).size.width / 2),
            ),
            padding: EdgeInsets.all(20),
          )),
          if (MediaQuery.of(context).size.width > 800)
            Expanded(
                child: Column(
              children: [
                Divider(),
                Text('Tree widgets', style: TextStyle(fontSize: 20)),
                Divider(),
                if (res != null)
                  Expanded(
                    child: SingleChildScrollView(
                      child: TreeWidgets(gWidget: res, onTap: (item) => setState(() => selectedChild = item)),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Container(height: 2, color: Colors.grey),
                ),
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(selectedChild?.widgetType ?? 'No select', style: TextStyle(fontSize: 18)),
                      SizedBox(height: 10),
                      if (selectedChild != null)
                        ...?selectedChild?.props?.keys
                            .map((e) => Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(e),
                                    Text(" : "),
                                    Text(clearCode(selectedChild?.props![e] ?? '')),
                                  ],
                                ))
                            .toList(),
                      SizedBox(height: 10),
                      if (selectedChild != null) Text(selectedChild?.code ?? ''),
                    ],
                  ),
                )),
                Divider(),
              ],
              crossAxisAlignment: CrossAxisAlignment.stretch,
            )),
        ],
      );
    }

    return Center(child: CircularProgressIndicator());
  }
}

class TreeWidgets extends StatelessWidget {
  final GWidget gWidget;
  final Function(GWidget) onTap;

  const TreeWidgets({Key? key, required this.gWidget, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(child: Text(gWidget.widgetType), onTap: () => this.onTap(gWidget)),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [...gWidget.children.map((e) => TreeWidgets(gWidget: e, onTap: this.onTap)).toList()],
          ),
        )
      ],
    );
  }
}
