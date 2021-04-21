import 'package:bookcase_app/viewmodels/books_vm.dart';
import 'package:bookcase_app/viewmodels/stats_vm.dart';
import 'package:bookcase_app/views/pages/books_page.dart';
import 'package:bookcase_app/views/pages/stats_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ViewHelper {
  static void navigateToPage(BuildContext context, int pageNumber) {
    if (pageNumber == 1) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, anim1, anim2) {
            return ChangeNotifierProvider(
              create: (context) => StatsViewModel(),
              child: StatsPage(),
            );
          },
          transitionDuration: Duration(seconds: 0),
        ),
      );
    } else if (pageNumber == 0) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, anim1, anim2) {
            return ChangeNotifierProvider(
              create: (context) => BooksViewModel(),
              child: BooksPage(),
            );
          },
          transitionDuration: Duration(seconds: 0),
        ),
      );
    }
  }
}
