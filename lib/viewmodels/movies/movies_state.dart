part of 'movies_bloc.dart';

@immutable
sealed class MoviesState {}

final class MoviesInitial extends MoviesState {}

final class MoviesLoading extends MoviesState {}

final class MoviesLoaded extends MoviesState {
  final List<Movie> movies;
  final List<Genre> genres;
  final int currentPage;

  MoviesLoaded({
    this.movies = const [],
    this.genres = const [],
    this.currentPage = 0,
  });
}

final class MoviesLoadingMore extends MoviesState {
  final List<Movie> movies;
  final List<Genre> genres;
  final int currentPage;

  MoviesLoadingMore({
    this.movies = const [],
    this.genres = const [],
    this.currentPage = 0,
  });
}

final class MoviesError extends MoviesState {
  final String message;

  MoviesError({required this.message});
}
