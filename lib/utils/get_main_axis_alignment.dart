import 'package:flutter_visible/imports.dart';

getMainAxisAlignment(Map<String, dynamic> json) {
  if (viewDebugProps) print('getCrossAxisAlignment');
  if (json['constraints'] != null) {
    switch (json['constraints']['horizontal']) {
      case 'CENTER':
        return MainAxisAlignment.center;
      case 'SPACE_BETWEEN':
        return MainAxisAlignment.spaceBetween;
    }
  }
  switch (json['primaryAxisAlignItems']) {
    case 'MIN':
      return MainAxisAlignment.start;
    case 'MAX':
      return MainAxisAlignment.end;
    case 'CENTER':
      return MainAxisAlignment.center;
    case 'SPACE_BETWEEN':
      return MainAxisAlignment.spaceBetween;
  }

  return MainAxisAlignment.start;
}
