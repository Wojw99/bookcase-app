import 'package:bookcase_app/utils/colors.dart';
import 'package:bookcase_app/utils/strings.dart';
import 'package:bookcase_app/viewmodels/adding_vm.dart';
import 'package:bookcase_app/viewmodels/menu_vm.dart';
import 'package:bookcase_app/viewmodels/stats_vm.dart';
import 'package:bookcase_app/views/pages/books_page.dart';
import 'package:bookcase_app/views/pages/stats_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final pages = [
  BooksPage(),
  StatsPage(),
];

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _viewModel = Provider.of<MenuViewModel>(context, listen: true);
    final _statsViewModel = Provider.of<StatsViewModel>(context, listen: true);
    return Scaffold(
      /// * * * * * * BODY * * * * * *
      body: pages[_viewModel.currentIndex],

      /// * * * * * * BOTTOM NAVIGATION BAR * * * * * *
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kColorMain,
        selectedItemColor: kColorDark,
        unselectedItemColor: Colors.black54,
        currentIndex: _viewModel.currentIndex,
        onTap: (index) {
          _statsViewModel.initialize();
          _viewModel.changeIndex(index);
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
