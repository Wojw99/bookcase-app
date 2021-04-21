import 'package:bookcase_app/utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(kAppTitle),
    );
  }
}
