import 'package:bookcase_app/utils/test_database.dart';
import 'package:bookcase_app/models/book.dart';
import 'package:bookcase_app/utils/types/readingStates.dart';
import 'package:bookcase_app/viewmodels/single_book_vm.dart';
import 'package:bookcase_app/views/pages/adding_page.dart';
import 'package:bookcase_app/views/pages/single_book_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'adding_vm.dart';

class BooksViewModel extends ChangeNotifier {
  List<Book> _books = TestDatabase.books;
  List<Book> get books => getFilteredBooks();

  int _tabIndex = 1;
  int get tabIndex => _tabIndex;

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

  void navigateToSingleBookPage(BuildContext context, int bookIndex) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<SingleBookViewModel>(
          create: (context) => SingleBookViewModel(books[bookIndex]),
          builder: (context, widget) => SingleBookPage(),
        ),
      ),
    );
    notifyListeners();
  }

  List<Book> getFilteredBooks() {
    if (_tabIndex == 0) {
      return _books
          .where((element) => element.readingState == ReadingStates.abandoned)
          .toList();
    } else if (_tabIndex == 1) {
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
    _tabIndex = value;
    notifyListeners();
  }

  void reload() {
    notifyListeners();
  }
}
