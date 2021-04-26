import 'package:bookcase_app/utils/colors.dart';
import 'package:bookcase_app/utils/constants.dart';
import 'package:bookcase_app/utils/strings.dart';
import 'package:bookcase_app/utils/types/readingStates.dart';
import 'package:bookcase_app/viewmodels/single_book_vm.dart';
import 'package:bookcase_app/views/view_helper.dart';
import 'package:bookcase_app/views/widgets/radio_data.dart';
import 'package:bookcase_app/views/widgets/radio_img_group.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleBookPage extends StatelessWidget {
  final double sectionSpace = 18.0;

  @override
  Widget build(BuildContext context) {
    final _viewModel = Provider.of<SingleBookViewModel>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppTitle),
        elevation: 0.0,
        backgroundColor: kColorDark,
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              _viewModel.handleActionClick(context, value);
            },
            itemBuilder: (BuildContext context) {
              return _viewModel.actions.map(
                (String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                },
              ).toList();
            },
          )
        ],
      ),
      body: Container(
        color: kColorDark,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: kColorGreyDark,
            ),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  /// * * * TITLE * * *
                  Text(
                    _viewModel.visibleBook.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  /// * * * IMAGE * * *
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: sectionSpace * 1.7),
                    child: Image.asset(
                      ViewHelper.getImgSourceForGenre(
                          _viewModel.visibleBook.genre),
                      height: 60.0,
                    ),
                  ),

                  /// * * * SERIES * * *
                  Text(
                    kSeries,
                    style: kHeaderStyle,
                  ),
                  Text(
                    _viewModel.visibleBook.series,
                    style: kParagraphStyle,
                  ),
                  SizedBox(height: sectionSpace),

                  /// * * * AUTHOR * * *
                  Text(
                    kAuthor,
                    style: kHeaderStyle,
                  ),
                  Text(
                    _viewModel.visibleBook.author,
                    style: kParagraphStyle,
                  ),
                  SizedBox(height: sectionSpace),

                  /// * * * ADDING DATE * * *
                  Text(
                    kDateReading,
                    style: kHeaderStyle,
                  ),
                  Text(
                    ViewHelper.getTextForDateTime(
                      _viewModel.visibleBook.dateLastEdition,
                      showYear: true,
                    ),
                    style: kParagraphStyle,
                  ),
                  SizedBox(height: sectionSpace),

                  /// * * * GENRE * * *
                  Text(
                    kGenre,
                    style: kHeaderStyle,
                  ),
                  Text(
                    _viewModel.visibleBook.genre.name,
                    style: kParagraphStyle,
                  ),
                  SizedBox(height: sectionSpace),

                  /// * * * NOTE * * *
                  Visibility(
                    visible: _viewModel.noteVisible,
                    child: Text(
                      kNote,
                      style: kHeaderStyle,
                    ),
                  ),
                  Visibility(
                    visible: _viewModel.noteVisible,
                    child: Text(
                      _viewModel.visibleBook.note,
                      style: kParagraphStyle,
                    ),
                  ),
                  SizedBox(height: sectionSpace),

                  /// * * * READING STATE * * *
                  RadioImageGroup(
                    currentIndex: _viewModel.getIndexForReadingState(),
                    activeColor: kColorMain,
                    onChanged: (index) {
                      _viewModel.setReadingState(index);
                    },
                    radioData: [
                      RadioData(
                        label: ReadingStates.abandoned.toString(),
                        iconData: Icons.clear,
                      ),
                      RadioData(
                        label: ReadingStates.ended.toString(),
                        iconData: Icons.check,
                      ),
                      RadioData(
                        label: ReadingStates.planning.toString(),
                        iconData: Icons.bookmark,
                      ),
                    ],
                  ),

                  /// * * * COLUMN END * * *
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

const kParagraphStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.normal,
  color: kColorTextDark,
);

const kHeaderStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
  color: kColorTextLight,
);
