import 'package:bookcase_app/models/book.dart';
import 'package:bookcase_app/utils/test_database.dart';
import 'package:bookcase_app/utils/types/genre.dart';
import 'package:bookcase_app/utils/types/genres.dart';
import 'package:bookcase_app/utils/types/readingStates.dart';
import 'package:flutter/cupertino.dart';

class AddingViewModel extends ChangeNotifier {
  List<String> _genresNames =
      Genres.listOfGenres().map((e) => e.toString()).toList();
  List<String> get genresNames => _genresNames;

  List<String> _readingStatesNames =
      ReadingStates.listOfStates().map((e) => e.toString()).toList();
  List<String> get readingStatesNames => _readingStatesNames;

  Book _addingBook = Book(
    id: 'id',
    dateLastEdition: DateTime.now(),
    dateAdded: DateTime.now(),
    genre: Genres.highFantasy,
    readingState: ReadingStates.ended,
  );
  Book get addingBook => _addingBook;

  bool get dateVisible => _addingBook.readingState == ReadingStates.ended;

  void setTitle(String title) {
    _addingBook.title = title;
    notifyListeners();
  }

  void setAuthor(String author) {
    _addingBook.author = author;
    notifyListeners();
  }

  void setNote(String note) {
    _addingBook.note = note;
    notifyListeners();
  }

  void setDate(DateTime date) {
    if (date != null) {
      _addingBook.dateLastEdition = date;
      _addingBook.dateAdded = date;
      notifyListeners();
    }
  }

  void setGenre(String genre) {
    final index = _genresNames.indexOf(genre);
    _addingBook.genre = Genres.listOfGenres()[index];
    notifyListeners();
  }

  void setReadingState(String genre) {
    final index = _readingStatesNames.indexOf(genre);
    _addingBook.readingState = ReadingStates.listOfStates()[index];
    notifyListeners();
  }

  /// Add to database
  void addBook() {
    print(addingBook.toString());
    TestDatabase.books.add(addingBook);
  }
}
