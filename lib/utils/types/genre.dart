import 'package:bookcase_app/utils/enums.dart';
import 'package:flutter/cupertino.dart';

class Genre {
  String name;
  final int number;

  Genre({
    @required this.name,
    @required this.number,
  });

  @override
  int get hashCode => name.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Genre && runtimeType == other.runtimeType && name == other.name;

  @override
  String toString() {
    return name;
  }
}
