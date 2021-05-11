import 'package:bookcase_app/models/book.dart';
import 'package:bookcase_app/repositories/book_repository.dart';
import 'package:bookcase_app/repositories/user_repository.dart';
import 'package:bookcase_app/services/shared_pref_service.dart';
import 'package:bookcase_app/viewmodels/stats_vm.dart';
import 'package:bookcase_app/views/pages/login_page.dart';
import 'package:bookcase_app/views/pages/menu_page.dart';
import 'package:bookcase_app/views/pages/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'books_vm.dart';
import 'menu_vm.dart';

class LoginRegisterViewModel extends ChangeNotifier {
  final _userRepository = UserRepository();

  String _email = 'j';
  String get email => _email;
  set email(String value) {
    _email = value;
    notifyListeners();
  }

  String _password = '';
  String get password => _password;
  set password(String value) {
    _password = value;
    notifyListeners();
  }

  String _passwordRepeat = '';
  String get passwordRepeat => _passwordRepeat;
  set passwordRepeat(String value) {
    _passwordRepeat = value;
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    try {
      final userCredential =
          await _userRepository.signInWithEmailAndPassword(email, password);

      navigateToApp(context);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> register(BuildContext context) async {
    if (password != passwordRepeat) {
      throw Exception('Password was not same.');
    }
    try {
      final userCredential =
          await _userRepository.createUserWithEmailAndPassword(email, password);

      navigateToApp(context);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  /// Navigate to LoginPage
  void navigateToLogin(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<LoginRegisterViewModel>(
          create: (context) => LoginRegisterViewModel(),
          builder: (context, widget) => LoginPage(),
        ),
      ),
    );
  }

  /// Navigate to RegisterPage
  void navigateToRegister(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<LoginRegisterViewModel>(
          create: (context) => LoginRegisterViewModel(),
          builder: (context, widget) => RegisterPage(),
        ),
      ),
    );
  }

  /// Navigate to MenuPage
  void navigateToApp(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MultiProvider(
          providers: [
            ChangeNotifierProvider<MenuViewModel>(
                create: (_) => MenuViewModel()),
            ChangeNotifierProvider<BooksViewModel>(
                create: (_) => BooksViewModel()),
            ChangeNotifierProvider<StatsViewModel>(
                create: (_) => StatsViewModel()),
            StreamProvider<List<Book>>(
              create: (_) => streamOfBooks(),
              initialData: [],
            )
          ],
          builder: (context, widget) => MenuPage(),
        ),
      ),
    );
  }

  Stream<List<Book>> streamOfBooks() {
    var repo = BookRepository();
    return repo.books();
  }
}
