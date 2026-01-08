part of 'favorites_bloc.dart';

@immutable
sealed class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}

final class FavoritesLoading extends FavoritesState {}

final class FavoritesLoaded extends FavoritesState {
  final List<Movie> favorites;

  FavoritesLoaded({required this.favorites});
}

final class FavoritesError extends FavoritesState {}