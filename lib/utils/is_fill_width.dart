isFillWidthVertical(Map<String, dynamic> json) => (json['layoutMode'] == 'VERTICAL' && json['layoutAlign'] == 'STRETCH');

isFillWidthHorizontal(Map<String, dynamic> json) => (json['layoutMode'] == 'HORIZONTAL' && json['layoutAlign'] == 'STRETCH');

isPrimaryAxisSizingModeFixed(Map<String, dynamic> json) {
  return json['primaryAxisSizingMode'] == 'FIXED';
}

isPrimaryAxisSizingModeAuto(Map<String, dynamic> json) {
  return json['primaryAxisSizingMode'] == 'AUTO';
}

isCounterAxisSizingModeFixed(Map<String, dynamic> json) {
  return json['counterAxisSizingMode'] == 'FIXED';
}

isCounterAxisSizingModeAuto(Map<String, dynamic> json) {
  return json['counterAxisSizingMode'] == 'AUTO';
}

layoutGrow(Map<String, dynamic> json) {
  return json['layoutGrow'];
}
