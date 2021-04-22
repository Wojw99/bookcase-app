import 'package:bookcase_app/utils/colors.dart';
import 'package:bookcase_app/utils/enums.dart';
import 'package:bookcase_app/utils/strings.dart';
import 'package:bookcase_app/views/view_helper.dart';
import 'package:flutter/cupertino.dart';

class BookRow extends StatelessWidget {
  final String title;
  final String series;
  final String author;
  final DateTime date;
  final Genre genre;

  // for inside and outside padding
  static const paddingNumber = 10.0;

  BookRow({
    @required this.title,
    @required this.series,
    @required this.author,
    @required this.date,
    @required this.genre,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: paddingNumber, right: paddingNumber, bottom: paddingNumber),
      child: Container(
        decoration: BoxDecoration(
          color: kColorGreyDark,
          borderRadius: BorderRadius.circular(13.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(paddingNumber),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Image.asset(
                    ViewHelper.getImgSourceForGenre(genre),
                    height: 24.0,
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      title,
                      style: kRowHeaderStyle,
                    ),
                  ),
                  Text(
                    // TODO: row date
                    '22.04',
                    style: kRowHeaderStyle,
                  ),
                ],
              ),
              SizedBox(height: 4.0),
              Text(
                '$kSeriesPrefix \"$series\"',
                style: kRowParagraphStyle,
              ),
              SizedBox(height: 4.0),
              Text(
                author,
                style: kRowParagraphStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const kRowParagraphStyle = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.normal,
  color: kColorTextDark,
);

const kRowHeaderStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
  color: kColorTextLight,
);
