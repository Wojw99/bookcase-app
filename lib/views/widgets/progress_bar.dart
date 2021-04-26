import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Creates a progress bar that filled width is proportional to "value" divided by "valueMax"
/// It is similar to bar charts
class ProgressBar extends StatelessWidget {
  final String label;
  final int value;
  final int valueMin;
  final int valueMax;
  final double barMaxWidth;
  final double barHeight;
  final Color filledColor;
  final Color emptyColor;
  final Color fontColor;
  final labelFontSize;
  final valueFontSize;

  final double valueBarSpace = 7.0;

  // TODO: test value == 0, error handling while setting value less than min or greater than max
  ProgressBar({
    this.value = 0,
    this.valueMin = 0,
    this.valueMax = 20,
    this.label = '',
    this.barMaxWidth = 363.0,
    this.barHeight = 25,
    this.filledColor = Colors.orange,
    this.emptyColor = Colors.transparent,
    this.fontColor = Colors.white,
    this.labelFontSize = 16.0,
    this.valueFontSize = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    double barWidth =
        value * (barMaxWidth - valueFontSize - valueBarSpace * 2) / valueMax;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        /// * * * * * * * * LABEL * * * * * * * *
        Text(
          label,
          style: TextStyle(
            fontSize: labelFontSize,
            color: fontColor,
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(height: 5.0),

        /// * * * * * * * * BAR * * * * * * * *
        Stack(
          alignment: AlignmentDirectional.centerStart,
          children: <Widget>[
            /// * * * * * * * * EMPTY * * * * * * * *
            Container(
              height: barHeight,
              decoration: BoxDecoration(
                color: emptyColor,
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
            ),

            Row(
              children: [
                /// * * * * * * * * FILLED * * * * * * * *
                Container(
                  height: barHeight,
                  width: barWidth > valueMin ? barWidth : valueMin,
                  decoration: BoxDecoration(
                    color: filledColor,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                ),
                SizedBox(width: valueBarSpace),

                /// * * * * * * * * VALUE * * * * * * * *
                Text(
                  '$value',
                  style: TextStyle(
                    fontSize: valueFontSize,
                    fontWeight: FontWeight.bold,
                    color: fontColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
