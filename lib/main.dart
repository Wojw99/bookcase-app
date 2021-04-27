import 'package:bookcase_app/utils/colors.dart';
import 'package:bookcase_app/utils/strings.dart';
import 'package:bookcase_app/viewmodels/adding_vm.dart';
import 'package:bookcase_app/viewmodels/books_vm.dart';
import 'package:bookcase_app/viewmodels/login_register_vm.dart';
import 'package:bookcase_app/viewmodels/menu_vm.dart';
import 'package:bookcase_app/viewmodels/stats_vm.dart';
import 'package:bookcase_app/views/pages/books_page.dart';
import 'package:bookcase_app/views/pages/login_page.dart';
import 'package:bookcase_app/views/pages/menu_page.dart';
import 'package:bookcase_app/views/pages/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(BeforeApp());
}

class BeforeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshots) {
        if (snapshots.hasError) {
          print(snapshots.error);
          return ErrorPage();
        }

        if (snapshots.connectionState == ConnectionState.done) {
          return BookcaseApp();
        }

        return LoadingPage();
      },
    );
  }
}

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(color: kColorMainAccent);
  }
}

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kColorDark,
    );
  }
}

class BookcaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppTitle,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: ChangeNotifierProvider<LoginRegisterViewModel>(
        create: (context) => LoginRegisterViewModel(),
        builder: (context, widget) => LoginPage(),
      ),
    );
  }
}
