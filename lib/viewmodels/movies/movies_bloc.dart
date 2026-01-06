import 'package:bloc/bloc.dart';
import 'package:flutter_mvvm_statemanagement_practice/models/genre.dart';
import 'package:flutter_mvvm_statemanagement_practice/models/movie.dart';
import 'package:flutter_mvvm_statemanagement_practice/repositories/movies_repository.dart';
import 'package:flutter_mvvm_statemanagement_practice/utils/init_getit.dart';
import 'package:meta/meta.dart';

part 'movies_event.dart';

part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(MoviesInitial()) {
    on<FetchMovies>(_onFetchMovies);
    on<FetchMoreMovies>(_onFetchMoreMovies);
  }

  final MoviesRepository _moviesRepository = getIt<MoviesRepository>();

  Future<void> _onFetchMovies(event, emit) async {
    emit(MoviesLoading());
    try {
      var genres = await _moviesRepository.fetchGenres();
      var movies = await _moviesRepository.fetchMovies(page: 1);
      emit(MoviesLoaded(currentPage: 1, genres: genres, movies: movies));
    } catch (e) {
      emit(MoviesError(message: "Failed to load movies. $e"));
    }
  }

  Future<void> _onFetchMoreMovies(event, emit) async {
    final currentState = state;
    if (currentState is MoviesLoadingMore) {
      return;
    }
    if (currentState is! MoviesLoaded) {
      return;
    }
    emit(
      MoviesLoadingMore(
        currentPage: currentState.currentPage,
        genres: currentState.genres,
        movies: currentState.movies,
      ),
    );

    try {
      var movies = await _moviesRepository.fetchMovies(
        page: currentState.currentPage + 1,
      );
      if (movies.isEmpty) {
        emit(currentState);
        return;
      }

      currentState.movies.addAll(movies);
      emit(
        MoviesLoaded(
          currentPage: currentState.currentPage + 1,
          genres: currentState.genres,
          movies: currentState.movies,
        ),
      );
    } catch (e) {
      emit(MoviesError(message: "Failed to load movies. $e"));
    }
  }
}
