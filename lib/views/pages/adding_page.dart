import 'package:bookcase_app/utils/colors.dart';
import 'package:bookcase_app/utils/enums.dart';
import 'package:bookcase_app/utils/strings.dart';
import 'package:bookcase_app/viewmodels/adding_vm.dart';
import 'package:bookcase_app/views/view_helper.dart';
import 'package:bookcase_app/views/widgets/my_button.dart';
import 'package:bookcase_app/views/widgets/my_dropdown_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddingPage extends StatelessWidget {
  Color getButtonDateColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return kColorTextDark;
    }
    return kColorTextLight;
  }

  Color getButtonDateTextColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return kColorDark;
    }
    return kColorDark;
  }

  @override
  Widget build(BuildContext context) {
    final _viewModel = Provider.of<AddingViewModel>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppTitle),
        elevation: 0.0,
        backgroundColor: kColorDark,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: kColorDark,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                /// * * * TITLE * * *
                Padding(
                  padding: EdgeInsets.only(
                    top: topPadding,
                    bottom: bottomPadding,
                  ),
                  child: Text(
                    kTitle,
                    style: kHeaderStyle,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: border,
                    focusedBorder: focusedBorder,
                    hintText: kAddingTitleHint,
                  ),
                  onChanged: (value) {
                    _viewModel.setTitle(value);
                  },
                ),

                /// * * * AUTHOR * * *
                Padding(
                  padding: EdgeInsets.only(
                    top: topPadding,
                    bottom: bottomPadding,
                  ),
                  child: Text(
                    kAuthor,
                    style: kHeaderStyle,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: border,
                    focusedBorder: focusedBorder,
                    hintText: kAddingAuthorHint,
                  ),
                  onChanged: (value) {
                    _viewModel.setAuthor(value);
                  },
                ),

                /// * * * SERIES * * *
                Padding(
                  padding: EdgeInsets.only(
                    top: topPadding,
                    bottom: bottomPadding,
                  ),
                  child: Text(
                    kSeries,
                    style: kHeaderStyle,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: border,
                    focusedBorder: focusedBorder,
                    hintText: kAddingSeriesHint,
                  ),
                  onChanged: (value) {
                    _viewModel.setSeries(value);
                  },
                ),

                /// * * * GENRE * * *
                Padding(
                  padding: EdgeInsets.only(
                    top: topPadding,
                    bottom: bottomPadding,
                  ),
                  child: Text(
                    kGenre,
                    style: kHeaderStyle,
                  ),
                ),
                MyDropdownButton(
                  value: _viewModel.addingBook.genre.toString(),
                  onChanged: (value) {
                    _viewModel.setGenre(value);
                  },
                  itemList: _viewModel.genresNames,
                ),

                /// * * * READING STATE * * *
                Padding(
                  padding: EdgeInsets.only(
                    top: topPadding,
                    bottom: bottomPadding,
                  ),
                  child: Text(
                    kReadingState,
                    style: kHeaderStyle,
                  ),
                ),
                MyDropdownButton(
                  value: _viewModel.addingBook.readingState.toString(),
                  onChanged: (value) {
                    _viewModel.setReadingState(value);
                  },
                  itemList: _viewModel.readingStatesNames,
                ),

                /// * * * DATE * * *
                Visibility(
                  visible: _viewModel.dateVisible,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: topPadding,
                      bottom: bottomPadding,
                    ),
                    child: Text(
                      kDateReading,
                      style: kHeaderStyle,
                    ),
                  ),
                ),
                Visibility(
                  visible: _viewModel.dateVisible,
                  child: ElevatedButton(
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.utc(2020, 1, 1),
                        lastDate: DateTime.now(),
                      ).then((value) => _viewModel.setDate(value));
                    },
                    child: Text(
                      ViewHelper.getTextForDateTime(
                        _viewModel.addingBook.dateLastEdition,
                        showYear: true,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.resolveWith(getButtonDateColor),
                      foregroundColor: MaterialStateProperty.resolveWith(
                          getButtonDateTextColor),
                    ),
                  ),
                ),

                /// * * * NOTE * * *
                Padding(
                  padding: EdgeInsets.only(
                    top: topPadding,
                    bottom: bottomPadding,
                  ),
                  child: Text(
                    kNote,
                    style: kHeaderStyle,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: border,
                    focusedBorder: focusedBorder,
                    hintText: kAddingNoteHint,
                  ),
                  onChanged: (value) {
                    _viewModel.setNote(value);
                  },
                ),

                SizedBox(height: topPadding * 2),

                /// * * * ADD BUTTON * * *
                MyButton(
                  onPressed: () {
                    _viewModel.addBook();
                    Navigator.pop(context);
                  },
                  text: kAddBook,
                  buttonColor: kColorMain,
                  buttonInteractiveColor: kColorMainAccent,
                  textColor: kColorDark,
                ),
                SizedBox(height: bottomPadding * 2),

                /// * * * COLUMN END * * *
              ],
            ),
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
