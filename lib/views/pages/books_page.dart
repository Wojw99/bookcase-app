import 'package:bookcase_app/utils/colors.dart';
import 'package:bookcase_app/utils/strings.dart';
import 'package:bookcase_app/viewmodels/books_vm.dart';
import 'package:bookcase_app/views/pages/stats_page.dart';
import 'package:bookcase_app/views/view_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BooksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kBookcase),
        backgroundColor: kColorDark,
      ),
      body: Container(
        color: Colors.green,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('To stats.'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          ViewHelper.navigateToPage(context, index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: kBookcase,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: kStats,
          ),
        ],
      ),
    );
  }
}
