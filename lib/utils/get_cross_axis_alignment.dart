import 'package:flutter_visible/imports.dart';

getCrossAxisAlignment(Map<String, dynamic> json) {
  if (viewDebugProps) print('getCrossAxisAlignment');
  if (json['constraints'] != null) {
    switch (json['constraints']['vertical']) {
      case 'CENTER':
        return CrossAxisAlignment.center;
    }
  }

  switch (json['counterAxisAlignItems']) {
    case 'MIN':
      return CrossAxisAlignment.start;
    case 'MAX':
      return CrossAxisAlignment.end;
    case 'CENTER':
      return CrossAxisAlignment.center;
  }
  return CrossAxisAlignment.start;
}
