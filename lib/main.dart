import 'package:bookcase_app/viewmodels/books_vm.dart';
import 'package:bookcase_app/viewmodels/stats_vm.dart';
import 'package:bookcase_app/views/pages/books_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (context) => BooksViewModel(),
        child: BooksPage(),
      ),
    );
  }
}
