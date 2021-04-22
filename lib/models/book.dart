import 'package:bookcase_app/utils/enums.dart';
import 'package:flutter/cupertino.dart';

class Book {
  final String id;
  final String title;
  final String author;
  final String series;
  final String note;
  final DateTime dateLastEdition;
  final DateTime dateAdded;
  final ReadingState readingState;
  final Genre genre;

  Book({
    @required this.id,
    this.title = '',
    this.author = '',
    this.series = '',
    this.note = '',
    @required this.dateLastEdition,
    @required this.dateAdded,
    this.readingState = ReadingState.Read,
    this.genre = Genre.Other,
  });

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      author.hashCode ^
      series.hashCode ^
      note.hashCode ^
      dateLastEdition.hashCode ^
      dateAdded.hashCode ^
      readingState.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Book &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          author == other.author &&
          series == other.series &&
          note == other.note &&
          dateLastEdition == other.dateLastEdition &&
          dateAdded == other.dateAdded &&
          readingState == other.readingState;

  @override
  String toString() {
    return 'Book { id: $id, title: $title, author: $author, '
        'series: $series, note: $note, last edition: $dateLastEdition, '
        'added date: $dateAdded, readingState: $readingState';
  }
}
