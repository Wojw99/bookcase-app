import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function onPressed;
  final Color buttonColor;
  final Color buttonInteractiveColor;
  final Color textColor;
  final String text;

  MyButton({
    this.onPressed,
    this.text,
    this.buttonColor,
    this.buttonInteractiveColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(fontSize: 18.0),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(getButtonColor),
        foregroundColor: MaterialStateProperty.resolveWith(getButtonTextColor),
      ),
    );
  }

  Color getButtonColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return buttonInteractiveColor;
    }
    return buttonColor;
  }

  Color getButtonTextColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return textColor;
    }
    return textColor;
  }
}
