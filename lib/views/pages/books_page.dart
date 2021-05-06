import 'package:bookcase_app/models/book.dart';
import 'package:bookcase_app/utils/colors.dart';
import 'package:bookcase_app/utils/strings.dart';
import 'package:bookcase_app/viewmodels/books_vm.dart';
import 'package:bookcase_app/views/widgets/row_book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_helper.dart';

class BooksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _viewModel = Provider.of<BooksViewModel>(context, listen: true);
    final _allBooks = Provider.of<List<Book>>(context, listen: true);
    final _filteredBooks = _viewModel.getFilteredBooks(_allBooks);
    return DefaultTabController(
      initialIndex: _viewModel.tabIndex,
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
            itemCount: _filteredBooks.length,
            itemBuilder: (context, index) {
              final book = _filteredBooks[index];
              return GestureDetector(
                onTap: () {
                  _viewModel.navigateToSingleBookPage(
                      context, _filteredBooks[index]);
                },
                child: BookRow(
                  title: book.title,
                  series: book.series,
                  author: book.author,
                  date: book.dateLastEdition,
                  imgSource: ViewHelper.getImgSourceForGenre(book.genre),
                ),
              );
            },
          ),
        ),

        /// * * * * * * FAB BUTTON * * * * * *
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
