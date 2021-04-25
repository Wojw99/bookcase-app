import 'package:bookcase_app/utils/colors.dart';
import 'package:bookcase_app/views/widgets/charts/bar_chart_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyBarChart extends StatelessWidget {
  final double maxY;
  final double barWidth;
  final List<BarChartData> items;

  MyBarChart({
    this.maxY = 20.0,
    this.barWidth = 25.0,
    @required this.items,
  });

  static const rodPadding = 10.0;
  static const int textFlex = 2;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: items
              .map(
                (item) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: rodPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: (maxY - item.value).toInt() - textFlex,
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            item.value.toInt().toString(),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: item.value.toInt() - textFlex,
                        child: Container(
                          color: kColorMain,
                          width: barWidth,
                        ),
                      ),
                      Expanded(
                        flex: textFlex,
                        child: Container(
                          alignment: Alignment.topCenter,
                          child: Text(
                            item.title.replaceAll(' ', '\n'),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
