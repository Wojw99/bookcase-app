import 'package:bookcase_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDropdownButton extends StatelessWidget {
  final String value;
  final Function onChanged;
  final List<String> itemList;

  MyDropdownButton({
    @required this.value,
    @required this.onChanged,
    @required this.itemList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kColorGreyLight,
        borderRadius: BorderRadius.circular(13.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: DropdownButton(
          underline: SizedBox(),
          iconSize: 30.0,
          iconEnabledColor: kColorMain,
          isExpanded: true,
          value: value,
          onChanged: onChanged,
          items: itemList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
