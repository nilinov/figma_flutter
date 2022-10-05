import 'package:flutter_visible/utils/download_io.dart';

import 'package:flutter_visible/utils/download.dart'
    if (dart.library.io) 'package:flutter_visible/utils/download_io.dart'
    if (dart.library.js) 'package:flutter_visible/utils/download_web.dart';

Future<String> getData(bool isAssets) async {
  return Downloaded1.getData(isAssets);
}
