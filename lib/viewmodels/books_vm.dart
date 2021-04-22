import 'package:bookcase_app/models/book.dart';
import 'package:bookcase_app/utils/enums.dart';
import 'package:flutter/cupertino.dart';

class BooksViewModel extends ChangeNotifier {
  final books = [
    Book(
      id: 'asd34asd',
      title: 'Rytm Wojny',
      series: 'Archiwum Burzowego Światła',
      author: 'Brandon Sanderson',
      dateLastEdition: DateTime.utc(2021, 2, 13),
      dateAdded: DateTime.utc(2021, 2, 13),
      genre: Genre.HighFantasy,
    ),
    Book(
      id: 'asd34asd4345',
      title: 'Odprysk świtu',
      series: 'Archiwum Burzowego Światła',
      author: 'Brandon Sanderson',
      dateLastEdition: DateTime.utc(2021, 1, 3),
      dateAdded: DateTime.utc(2021, 1, 3),
      genre: Genre.HighFantasy,
    ),
    Book(
      id: 'asd34asd4',
      title: 'Kamień Filozoficzny',
      series: 'Harry Potter',
      author: 'J. K. Rowling',
      dateLastEdition: DateTime.utc(2021, 1, 22),
      dateAdded: DateTime.utc(2021, 1, 22),
      genre: Genre.UrbanFantasy,
    ),
    Book(
      id: 'asd34asd5',
      title: 'Gra o Tron',
      series: 'Pieśń Lodu i Ognia',
      author: 'George R. R. Martin',
      dateLastEdition: DateTime.utc(2021, 3, 28),
      dateAdded: DateTime.utc(2021, 3, 28),
      genre: Genre.HighFantasy,
    ),
  ];
}
