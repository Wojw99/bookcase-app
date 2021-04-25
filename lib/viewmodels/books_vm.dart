import 'package:bookcase_app/utils/test_database.dart';
import 'package:bookcase_app/models/book.dart';
import 'package:bookcase_app/utils/types/readingStates.dart';
import 'package:bookcase_app/views/pages/adding_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'adding_vm.dart';

class BooksViewModel extends ChangeNotifier {
  List<Book> _books = TestDatabase.books;
  List<Book> get books => getFilteredBooks();

  int _index = 1;
  int get index => _index;

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

  List<Book> getFilteredBooks() {
    if (_index == 0) {
      return _books
          .where((element) => element.readingState == ReadingStates.abandoned)
          .toList();
    } else if (_index == 1) {
      return _books
          .where((element) => element.readingState == ReadingStates.ended)
          .toList();
    } else {
      // if(_index == 2)
      return _books
          .where((element) => element.readingState == ReadingStates.planning)
          .toList();
    }
  }

  void setIndex(int value) {
    _index = value;
    notifyListeners();
  }

  void reload() {
    notifyListeners();
  }
}
