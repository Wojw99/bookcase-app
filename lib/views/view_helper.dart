import 'package:bookcase_app/utils/enums.dart';
import 'package:bookcase_app/utils/types/genre.dart';
import 'package:bookcase_app/utils/types/genres.dart';

/// Class stores helpful methods for building UI.
class ViewHelper {
  /// Function return different image source for each of Genre enum values.
  static String getImgSourceForGenre(Genre genre) {
    if (genre == Genres.urbanFantasy)
      return 'assets/img/i_company.png';
    else if (genre == Genres.highFantasy)
      return 'assets/img/i_dragon.png';
    else if (genre == Genres.historicalNovel)
      return 'assets/img/i_knight.png';
    else if (genre == Genres.sciFi)
      return 'assets/img/i_ship_space.png';
    else if (genre == Genres.lightFantasy)
      return 'assets/img/i_sword.png';
    else if (genre == Genres.horror)
      return 'assets/img/i_thriller.png';
    else // (genre == Genre.Other)
      return 'assets/img/i_thriller.png';
  }

  /// Function formats DateTime and returns String adequate to format dd.MM
  static String getTextForDateTime(DateTime date, {bool showYear = false}) {
    var year = date.year.toString();
    var month = date.month.toString();
    var day = date.day.toString();

    if (month.length < 2) month = '0$month';
    if (day.length < 2) day = '0$day';

    if (showYear)
      return '$day.$month.$year';
    else
      return '$day.$month';
  }
}
