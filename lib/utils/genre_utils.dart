import 'package:flutter_mvvm_statemanagement_practice/models/genre.dart';

class GenreUtils {
  static List<Genre> movieGenresNames(
    List<int> genresIds,
    List<Genre> genresList,
  ) {
    final List<Genre> movieGenres = [];

    for (var id in genresIds) {
      for (var genre in genresList) {
        if (id == genre.id) {
          movieGenres.add(genre);
          continue;
        }
      }
    }
    return movieGenres;
  }
}
