import 'package:flutter_visible/imports.dart';

bool isExpanded(Json parent, Json json) {
  final name = json['name'];

  if (name == 'count_balls') {
    print('stop');
  }

  if (isAutoLayout(parent)) {
    if (isVertical(parent)) {
      return isGrow(json);
    } else if (isHorizontal(parent)) {
      return isGrow(json);
      // return isStretch(json);
    }
  }

  return false;
}

bool isExpandedWidth(Json parent, Json json) {
  if (isAutoLayout(parent)) {
    if (isVertical(parent)) {
      return isStretch(json);
    } else if (isHorizontal(parent)) {
      return isGrow(json);
    }
  }

  return false;
}

bool isExpandedHeight(Json parent, Json json) {
  if (isAutoLayout(parent)) {
    if (isVertical(parent)) {
      if (isGrow(json)) {
        return true;
      } else {
        if (isPrimaryAxisSizingModeAuto(json)) {
          return true;
        }
      }
    } else if (isHorizontal(parent)) {
      if (isStretch(json)) {
        return true;
      } else {
        if (isPrimaryAxisSizingModeAuto(json)) {
          return true;
        }
      }
    }
  }

  return false;
}
