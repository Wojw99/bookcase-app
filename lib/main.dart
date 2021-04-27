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
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
