import 'package:flutter_mvvm_statemanagement_practice/models/genre.dart';
import 'package:flutter_mvvm_statemanagement_practice/repositories/movies_repository.dart';
import 'package:flutter_mvvm_statemanagement_practice/utils/init_getit.dart';

class GenreUtils {
  static List<Genre> movieGenresNames(List<int> genresIds) {
    final MoviesRepository moviesRepository = getIt<MoviesRepository>();
    // final cachedGenres = moviesRepository.cachedGenres;
    final cachedGenres = []; //TODO: we need to get the correct cachedGenres
    final List<Genre> movieGenres = [];

    for (var id in genresIds) {
      for (var genre in cachedGenres) {
        if (id == genre.id) {
          movieGenres.add(genre);
          continue;
        }
      }
    }
    return movieGenres;
  }
}
