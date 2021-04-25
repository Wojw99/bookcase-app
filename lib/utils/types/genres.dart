import 'genre.dart';

class Genres {
  static get highFantasy => Genre(
        name: 'High Fantasy',
        number: 0,
      );
  static get lightFantasy => Genre(
        name: 'Light Fantasy',
        number: 1,
      );
  static get urbanFantasy => Genre(
        name: 'Urban Fantasy',
        number: 2,
      );
  static get horror => Genre(
        name: 'Horror',
        number: 3,
      );
  static get sciFi => Genre(
        name: 'Sci-Fi',
        number: 4,
      );
  static get popularScience => Genre(
        name: 'Popular science',
        number: 5,
      );
  static get historicalNovel => Genre(
        name: 'Historical novel',
        number: 6,
      );
  static get other => Genre(
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
}
