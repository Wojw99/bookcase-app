import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isAuthenticated() {
    final currentUser = _auth.currentUser;
    return currentUser != null;
  }

  Future<void> signInWithEmailAndPassword(String email, String password) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> createUserWithEmailAndPassword(String email, String password) {
    return _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  String getUserId() {
    return _auth.currentUser.uid;
  }
}
