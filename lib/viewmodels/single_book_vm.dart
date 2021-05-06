import 'package:bookcase_app/models/book.dart';
import 'package:bookcase_app/repositories/book_repository.dart';
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

  /// Book visible on the SingleBookPage
  Book _visibleBook;
  Book get visibleBook => _visibleBook;

  bool get noteVisible => _visibleBook.note.isNotEmpty;

  final _bookRepository = BookRepository();

  SingleBookViewModel(this._visibleBook);

  /// Change readingState into an index for radio buttons
  int getIndexForReadingState() {
    if (_visibleBook.readingState == ReadingStates.abandoned)
      return 0;
    else if (_visibleBook.readingState == ReadingStates.ended)
      return 1;
    else
      return 2;
  }

  /// Handle top-right menu click
  void handleActionClick(BuildContext context, String value) {
    if (value == kEdit) {
      navigateToAddingPage(context);
    } else if (value == kRemove) {
      /// Remove and navigate to the previous page
      removeBook();
      Navigator.pop(context);
    }
  }

  /// Remove book from database
  void removeBook() {
    _bookRepository.deleteBook(_visibleBook);
  }

  /// Navigate to AddingPage and setup AddingViewModel for updating
  void navigateToAddingPage(BuildContext context) async {
    final viewModel = AddingViewModel();
    viewModel.initializeWithBook(visibleBook);
    viewModel.update = true;

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<AddingViewModel>(
          create: (context) => viewModel,
          builder: (context, widget) => AddingPage(),
        ),
      ),
    );

    notifyListeners();
  }

  /// Change readingState of the book and update database
  void setReadingState(int readingStateIndex) {
    if (readingStateIndex == 0)
      _visibleBook.readingState = ReadingStates.abandoned;
    else if (readingStateIndex == 1)
      _visibleBook.readingState = ReadingStates.ended;
    else
      _visibleBook.readingState = ReadingStates.planning;

    _bookRepository.updateBook(_visibleBook);
    notifyListeners();
  }
}
