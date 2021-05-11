import 'package:bookcase_app/utils/types/genre.dart';
import 'package:bookcase_app/utils/types/genres.dart';
import 'package:bookcase_app/utils/types/readingState.dart';
import 'package:bookcase_app/utils/types/readingStates.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Book {
  String id;
  String title;
  String author;
  String series;
  String note;
  Genre genre;
  DateTime dateLastEdition;
  DateTime dateAdded;
  ReadingState readingState;

  Book({
    @required this.id,
    this.title = '',
    this.author = '',
    this.series = '',
    this.note = '',
    @required this.dateLastEdition,
    @required this.dateAdded,
    @required this.readingState,
    @required this.genre,
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

  static Book fromSnapshot(DocumentSnapshot snap) {
    return Book(
      id: snap.id,
      title: snap.data()['title'],
      author: snap.data()['author'],
      dateLastEdition: (snap.data()['date'] as Timestamp).toDate(),
      dateAdded: (snap.data()['date'] as Timestamp).toDate(),
      genre: Genres.fromString(snap.data()['genre']),
      readingState: ReadingStates.fromString(snap.data()['state']),
      series: snap.data()['series'],
      note: snap.data()['note'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      'author': author,
      'date': Timestamp.fromDate(dateAdded),
      'genre': genre.name,
      'note': note,
      'series': series,
      'state': readingState.name,
      'title': title,
    };
  }

  static Book fromJson(Map<String, Object> json, String id) {
    return Book(
      id: id,
      dateLastEdition: json['date'],
      dateAdded: json['date'],
      readingState: json['state'],
      genre: json['genre'],
      note: json['note'],
      series: json['series'],
      title: json['title'],
    );
  }
}
