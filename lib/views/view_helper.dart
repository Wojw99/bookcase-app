import 'package:bookcase_app/utils/enums.dart';

/// Class stores helpful methods for building UI.
class ViewHelper {
  /// Function return different image source for each of Genre enum values.
  static String getImgSourceForGenre(Genre genre) {
    if (genre == Genre.UrbanFantasy)
      return 'assets/img/i_company.png';
    else if (genre == Genre.HighFantasy)
      return 'assets/img/i_dragon.png';
    else if (genre == Genre.HistoricalNovel)
      return 'assets/img/i_knight.png';
    else if (genre == Genre.SciFi)
      return 'assets/img/i_ship_space.png';
    else if (genre == Genre.LightFantasy)
      return 'assets/img/i_sword.png';
    else if (genre == Genre.Horror)
      return 'assets/img/i_thriller.png';
    else // (genre == Genre.Other)
      return 'assets/img/i_thriller.png';
  }

  /// Function formats DateTime and returns String adequate to format dd.MM
  static String getTextForDateTime(DateTime date) {
    var month = date.month.toString();
    var day = date.day.toString();

    if (month.length < 2) month = '0$month';
    if (day.length < 2) day = '0$day';

    return '$day.$month';
  }
}
