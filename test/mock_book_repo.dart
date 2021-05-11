import 'package:bookcase_app/repositories/book_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_platform_interface/src/persistence_settings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockBookRepo extends Mock implements BookRepository {}

class MockCollectionReference extends Mock implements CollectionReference {}

class MockDocumentReference extends Mock implements DocumentReference {}

class MockDocumentsSnapshot extends Mock implements DocumentSnapshot {}

void main() {
  MockBookRepo repository;
  MockCollectionReference mockCollectionReference;
  MockDocumentReference mockDocumentReference;
  MockDocumentsSnapshot mockDocumentsSnapshot;

  setUp(() {
    repository = MockBookRepo();
  });

  test('should return data when the call to remote source is successful.',
      () async {
    // arrange

    //act

    //assert
  });
}
