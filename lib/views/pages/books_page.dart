import 'package:bookcase_app/utils/colors.dart';
import 'package:bookcase_app/utils/strings.dart';
import 'package:bookcase_app/viewmodels/books_vm.dart';
import 'package:bookcase_app/views/widgets/row_book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_helper.dart';

class BooksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _viewModel = Provider.of<BooksViewModel>(context, listen: true);
    return DefaultTabController(
      initialIndex: _viewModel.index,
      length: 3,
      child: Scaffold(
        /// * * * * * * APP BAR * * * * * *
        appBar: AppBar(
          title: Text(kAppTitle),
          elevation: 0.0,
          backgroundColor: kColorDark,
          bottom: TabBar(
            indicatorColor: kColorMain,
            tabs: [
              Tab(
                child: Text(kAbandoned),
              ),
              Tab(
                child: Text(kEnded),
              ),
              Tab(
                child: Text(kPlanning),
              )
            ],
            onTap: (value) {
              _viewModel.setIndex(value);
            },
          ),
        ),

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
                imgSource: ViewHelper.getImgSourceForGenre(book.genre),
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
              _viewModel.navigateToAddingPage(context);
            },
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
