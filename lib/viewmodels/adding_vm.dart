import 'package:bookcase_app/models/book.dart';
import 'package:bookcase_app/repositories/book_repository.dart';
import 'package:bookcase_app/utils/test_database.dart';
import 'package:bookcase_app/utils/types/genre.dart';
import 'package:bookcase_app/utils/types/genres.dart';
import 'package:bookcase_app/utils/types/readingStates.dart';
import 'package:flutter/cupertino.dart';

class AddingViewModel extends ChangeNotifier {
  /// Genre list
  List<String> _genresNames =
      Genres.listOfGenres().map((e) => e.toString()).toList();
  List<String> get genresNames => _genresNames;

  /// ReadingState list
  List<String> _readingStatesNames =
      ReadingStates.listOfStates().map((e) => e.toString()).toList();
  List<String> get readingStatesNames => _readingStatesNames;

  /// If should be updated
  bool update = false;

  /// Repository
  final _bookRepository = BookRepository();

  /// Book to add
  Book _addingBook = Book(
    id: 'id',
    dateLastEdition: DateTime.now(),
    dateAdded: DateTime.now(),
    genre: Genres.highFantasy,
    readingState: ReadingStates.ended,
  );
  Book get addingBook => _addingBook;

  /// Date is visible
  bool get dateVisible =>
      true; //_addingBook.readingState == ReadingStates.ended;

  void initializeWithBook(Book book) {
    _addingBook = book;
    notifyListeners();
  }

  void setTitle(String title) {
    _addingBook.title = title;
    notifyListeners();
  }

  void setAuthor(String author) {
    _addingBook.author = author;
    notifyListeners();
  }

  void setSeries(String series) {
    _addingBook.series = series;
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

  /// Add to database (or update)
  void addBook() {
    if (update) {
      _bookRepository.updateBook(addingBook);
    } else {
      _bookRepository.addNewBook(addingBook);
    }
  }
}
