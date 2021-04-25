import 'package:bookcase_app/models/book.dart';
import 'package:bookcase_app/utils/types/genres.dart';
import 'package:bookcase_app/utils/types/readingStates.dart';

class TestDatabase {
  static final books = [
    Book(
      id: 'asd3asd4asd',
      title: 'Thrawn',
      series: 'Star Wars',
      author: 'Nie wiem',
      dateLastEdition: DateTime.utc(2021, 2, 7),
      dateAdded: DateTime.utc(2021, 2, 7),
      genre: Genres.sciFi,
      readingState: ReadingStates.abandoned,
    ),
    Book(
      id: 'asd34asdasd',
      title: 'Słowa światłości',
      series: 'Archiwum Burzowego Światła',
      author: 'Brandon Sanderson',
      dateLastEdition: DateTime.utc(2021, 2, 8),
      dateAdded: DateTime.utc(2021, 2, 8),
      genre: Genres.lightFantasy,
      readingState: ReadingStates.planning,
    ),
    Book(
      id: 'asd34asd',
      title: 'Rytm Wojny',
      series: 'Archiwum Burzowego Światła',
      author: 'Brandon Sanderson',
      dateLastEdition: DateTime.utc(2021, 2, 13),
      dateAdded: DateTime.utc(2021, 2, 13),
      genre: Genres.highFantasy,
      readingState: ReadingStates.ended,
    ),
    Book(
      id: 'asd34asd4345',
      title: 'Odprysk świtu',
      series: 'Archiwum Burzowego Światła',
      author: 'Brandon Sanderson',
      dateLastEdition: DateTime.utc(2021, 1, 3),
      dateAdded: DateTime.utc(2021, 1, 3),
      genre: Genres.highFantasy,
      readingState: ReadingStates.ended,
    ),
    Book(
      id: 'asd34asd4',
      title: 'Kamień Filozoficzny',
      series: 'Harry Potter',
      author: 'J. K. Rowling',
      dateLastEdition: DateTime.utc(2021, 1, 22),
      dateAdded: DateTime.utc(2021, 1, 22),
      genre: Genres.urbanFantasy,
      readingState: ReadingStates.ended,
    ),
    Book(
      id: 'asd34asd5',
      title: 'Gra o Tron',
      series: 'Pieśń Lodu i Ognia',
      author: 'George R. R. Martin',
      dateLastEdition: DateTime.utc(2021, 3, 28),
      dateAdded: DateTime.utc(2021, 3, 28),
      genre: Genres.highFantasy,
      readingState: ReadingStates.ended,
    ),
  ];
}
