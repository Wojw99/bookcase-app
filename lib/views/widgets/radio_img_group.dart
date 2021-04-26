import 'package:bookcase_app/views/widgets/radio_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Creates radio group buttons with given images and labels
class RadioImageGroup extends StatelessWidget {
  final int currentIndex;
  final double iconSize;
  final double iconSpace;
  final Color activeColor;
  final Color inactiveColor;
  final Color fontColor;
  final double fontSize;
  final List<RadioData> radioData;
  final Function(int) onChanged;

  RadioImageGroup({
    this.currentIndex = 1,
    this.iconSize = 40.0,
    this.iconSpace = 25.0,
    this.activeColor = Colors.orangeAccent,
    this.inactiveColor = Colors.grey,
    this.fontColor = Colors.white,
    this.fontSize = 15.0,
    @required this.radioData,
    @required this.onChanged,
  });

  List<Widget> createIconChildren() {
    final list = <Widget>[];

    for (var i = 0; i < radioData.length; i++) {
      list.add(
        GestureDetector(
          onTap: () {
            onChanged(i);
          },
          child: Container(
            color: Colors.transparent,
            child: Padding(
              padding: EdgeInsets.all(iconSpace / 2),
              child: Column(
                children: [
                  Icon(
                    radioData[i].iconData,
                    size: iconSize,
                    color: i == currentIndex ? activeColor : inactiveColor,
                  ),
                  Text(
                    radioData[i].label,
                    style: TextStyle(
                      color: i == currentIndex ? activeColor : fontColor,
                      fontSize: fontSize,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: createIconChildren(),
      ),
    );
  }
}
