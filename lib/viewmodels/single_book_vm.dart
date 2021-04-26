import 'package:bookcase_app/models/book.dart';
import 'package:bookcase_app/utils/strings.dart';
import 'package:bookcase_app/utils/types/genres.dart';
import 'package:bookcase_app/utils/types/readingStates.dart';
import 'package:bookcase_app/views/pages/adding_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'adding_vm.dart';

class SingleBookViewModel extends ChangeNotifier {
  List<String> _actions = [kEdit, kRemove];
  List<String> get actions => _actions;

  Book _visibleBook;
  Book get visibleBook => _visibleBook;

  bool get noteVisible => _visibleBook.note.isNotEmpty;

  SingleBookViewModel(this._visibleBook);

  int getIndexForReadingState() {
    if (_visibleBook.readingState == ReadingStates.abandoned)
      return 0;
    else if (_visibleBook.readingState == ReadingStates.ended)
      return 1;
    else
      return 2;
  }

  void handleActionClick(BuildContext context, String value) {
    if (value == kEdit) {
      navigateToAddingPage(context);
    } else if (value == kRemove) {
      removeBook();
    }
  }

  void removeBook() {}

  void navigateToAddingPage(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<AddingViewModel>(
          create: (context) => AddingViewModel(),
          builder: (context, widget) => AddingPage(),
        ),
      ),
    );
    notifyListeners();
  }

  void setReadingState(int readingStateIndex) {
    if (readingStateIndex == 0)
      _visibleBook.readingState = ReadingStates.abandoned;
    else if (readingStateIndex == 1)
      _visibleBook.readingState = ReadingStates.ended;
    else
      _visibleBook.readingState = ReadingStates.planning;
    notifyListeners();
  }
}
