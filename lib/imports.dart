export 'dart:async';
export 'dart:convert';

export 'package:flutter/material.dart';
export 'package:flutter/services.dart';
export 'package:flutter_svg/flutter_svg.dart';
export 'package:flutter_visible/env.dart';
export 'package:flutter_visible/get_data.dart';
export 'package:flutter_visible/get_widget/get_children_by_layout_mode.dart';

export 'utils/_utils.dart';
export 'components/_components.dart';
export 'get_widget/_get_widget.dart';
export 'wrap_widgets/_wrap_widgets.dart';
export 'generated_widget.dart';
export 'get_style.dart';

import 'get_style.dart';

const viewDebugProps = false;


typedef Json = Map<String, dynamic>;

List<Style> StylesApp = [];
