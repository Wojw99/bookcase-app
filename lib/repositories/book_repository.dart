import 'package:bookcase_app/models/book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class BookRepository {
  final booksCollection = FirebaseFirestore.instance.collection('books');

  Future<void> addNewBook(Book book) {
    return booksCollection.add(book.toDocument());
  }

  Future<void> deleteBook(Book book) {
    return booksCollection.doc(book.id).delete();
  }

  Future<void> updateBook(Book book) {
    return booksCollection.doc(book.id).update(book.toDocument());
  }

  Stream<List<Book>> books() {
    return booksCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Book.fromSnapshot(doc)).toList();
    });
  }

  Future<Book> getBook(String bookID) async {
    Map<String, dynamic> data =
        (await booksCollection.doc(bookID).get()).data();
    return Book.fromJson(data, bookID);
  }
}
