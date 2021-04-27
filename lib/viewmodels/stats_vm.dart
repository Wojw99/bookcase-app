import 'package:bookcase_app/models/book.dart';
import 'package:bookcase_app/utils/test_database.dart';
import 'package:bookcase_app/utils/types/bar_data.dart';
import 'package:bookcase_app/utils/types/genres.dart';
import 'package:bookcase_app/utils/types/readingStates.dart';
import 'package:flutter/cupertino.dart';

class StatsViewModel extends ChangeNotifier {
  /// List of all books
  List<Book> _books = TestDatabase.books;

  /// State titles in the dropdown button
  List<String> _stateTitles =
      ReadingStates.listOfStates().map((e) => e.name).toList();
  List<String> get statesTitles => _stateTitles;

  /// State selected from dropdown button
  String _selectedState = ReadingStates.ended.toString();
  String get selectedState => _selectedState;

  /// Years titles in the dropdown button
  List<String> _yearsTitles = ['2021', '2020', '2019'];
  List<String> get yearsTitles => _yearsTitles;

  /// Year selected from dropdown button
  String _selectedYear = '2021';
  String get selectedYear => _selectedYear;

  /// List of BarData for progress bars
  List<BarData> _barDataList = <BarData>[];
  List<BarData> get barDataList => _barDataList;

  /// Iterates through all genres and matches books to genre, selected readingState and selected year.
  /// Create barDataList from returned lists.
  void createBarData() {
    final genres = Genres.listOfGenres();
    final yearInt = int.tryParse(selectedYear);

    _barDataList.clear();

    for (var g in genres) {
      final matching = _books
          .where((book) =>
              book.readingState.name == _selectedState &&
              book.dateLastEdition.year == yearInt &&
              book.genre == g)
          .toList();
      final len = matching.length;
      if (len > 0) {
        _barDataList.add(BarData(title: g.name, value: matching.length));
      }
    }

    // notifyListeners();
  }

  void initialize() {
    createBarData();
    notifyListeners();
  }

  void setReadingState(String state) {
    _selectedState = state;
    createBarData();
    notifyListeners();
  }

  void setYear(String year) {
    _selectedYear = year;
    createBarData();
    notifyListeners();
  }
}
