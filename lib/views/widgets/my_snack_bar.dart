import 'package:bookcase_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySnackBar extends SnackBar {
  final String text;

  MySnackBar({this.text});

  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(
        text,
        style: TextStyle(color: kColorDark),
      ),
      backgroundColor: kColorMain,
    );
  }
}
