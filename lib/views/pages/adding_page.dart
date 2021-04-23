import 'package:bookcase_app/utils/colors.dart';
import 'package:bookcase_app/utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppTitle),
        elevation: 0.0,
        backgroundColor: kColorDark,
      ),
      body: Container(
        color: kColorDark,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title',
                style: kHeaderStyle,
              ),
              SizedBox(height: 8.0),
              TextField(
                decoration: InputDecoration(
                  border: border,
                  focusedBorder: focusedBorder,
                  hintText: 'ex. The Old Man and the Sea',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: topPadding,
                  bottom: bottomPadding,
                ),
                child: Text(
                  'Author',
                  style: kHeaderStyle,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: border,
                  focusedBorder: focusedBorder,
                  hintText: 'ex. Ernest Hemingway',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

const topPadding = 16.0;
const bottomPadding = 8.0;

final border = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10.0),
);

final focusedBorder = OutlineInputBorder(
  borderSide: BorderSide(color: kColorMain, width: 2.0),
  borderRadius: BorderRadius.circular(10.0),
);

const kHeaderStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
  color: kColorTextLight,
);
