import 'package:flutter/cupertino.dart';

class RadioData {
  String label;
  IconData iconData;

  RadioData({this.label, this.iconData});

  @override
  String toString() {
    return 'RadioData { label: $label, iconData: $iconData }';
  }
}
