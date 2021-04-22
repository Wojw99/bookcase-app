import 'package:bookcase_app/utils/enums.dart';

class ViewHelper {
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
}
