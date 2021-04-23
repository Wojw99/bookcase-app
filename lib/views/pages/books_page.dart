import 'package:bookcase_app/utils/colors.dart';
import 'package:bookcase_app/utils/strings.dart';
import 'package:bookcase_app/viewmodels/books_vm.dart';
import 'package:bookcase_app/views/pages/adding_page.dart';
import 'package:bookcase_app/views/pages/stats_page.dart';
import 'package:bookcase_app/views/view_helper.dart';
import 'package:bookcase_app/views/widgets/row_book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BooksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _viewModel = Provider.of<BooksViewModel>(context, listen: true);
    return Scaffold(
      /// * * * * * * BODY * * * * * *
      body: Container(
        color: kColorDark,
        child: ListView.builder(
          itemCount: _viewModel.books.length,
          itemBuilder: (context, index) {
            final book = _viewModel.books[index];
            return BookRow(
              title: book.title,
              series: book.series,
              author: book.author,
              date: book.dateLastEdition,
              genre: book.genre,
            );
          },
        ),
      ),

      /// * * * * * * F BUTTON * * * * * *
      floatingActionButton: Padding(
        padding: EdgeInsets.all(16.0),
        child: FloatingActionButton(
          backgroundColor: kColorMain,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddingPage()),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
