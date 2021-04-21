import 'package:bookcase_app/utils/strings.dart';
import 'package:bookcase_app/viewmodels/stats_vm.dart';
import 'package:bookcase_app/views/view_helper.dart';
import 'package:bookcase_app/views/pages/books_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kStats),
      ),
      body: Container(
        color: Colors.blue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(Provider.of<StatsViewModel>(context).text),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
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
