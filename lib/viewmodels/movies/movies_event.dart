part of 'movies_bloc.dart';

@immutable
sealed class MoviesEvent {}

class FetchMovies extends MoviesEvent {}

class FetchMoreMovies extends MoviesEvent {}
