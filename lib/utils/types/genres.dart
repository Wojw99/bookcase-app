import 'genre.dart';

class Genres {
  static Genre get highFantasy => Genre(
        name: 'High Fantasy',
        number: 0,
      );
  static Genre get lightFantasy => Genre(
        name: 'Light Fantasy',
        number: 1,
      );
  static Genre get urbanFantasy => Genre(
        name: 'Urban Fantasy',
        number: 2,
      );
  static Genre get horror => Genre(
        name: 'Horror',
        number: 3,
      );
  static Genre get sciFi => Genre(
        name: 'Sci-Fi',
        number: 4,
      );
  static Genre get popularScience => Genre(
        name: 'Popular science',
        number: 5,
      );
  static Genre get historicalNovel => Genre(
        name: 'Historical novel',
        number: 6,
      );
  static Genre get other => Genre(
        name: 'Other',
        number: 7,
      );

  static List<Genre> listOfGenres() {
    return <Genre>[
      highFantasy,
      lightFantasy,
      urbanFantasy,
      horror,
      sciFi,
      popularScience,
      historicalNovel,
      other,
    ];
  }

  static Genre fromString(String name) {
    for (Genre genre in listOfGenres()) {
      if (genre.name == name) return genre;
    }
    throw new Exception('Genre with given name does not exists!');
  }
}
