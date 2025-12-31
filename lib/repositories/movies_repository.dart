import 'package:flutter_mvvm_statemanagement_practice/services/api_services.dart';

import '../models/genre.dart';
import '../models/movie.dart';

class MoviesRepository {
  final ApiServices apiServices;

  MoviesRepository(this.apiServices);

  Future<List<Movie>> fetchMovies({int page = 1}) async {
    return apiServices.fetchMovies(page: page);
  }

  Future<List<Genre>> fetchGenres() async {
    return apiServices.fetchGenres();
  }
}
