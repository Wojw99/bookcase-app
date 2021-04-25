import 'package:bookcase_app/utils/enums.dart';
import 'package:flutter/cupertino.dart';

class ReadingState {
  String name;

  ReadingState({
    @required this.name,
  });

  @override
  int get hashCode => name.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReadingState &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  String toString() {
    return name;
  }
}
