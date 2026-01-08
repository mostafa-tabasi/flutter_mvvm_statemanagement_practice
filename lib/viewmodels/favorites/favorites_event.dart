part of 'favorites_bloc.dart';

@immutable
sealed class FavoritesEvent {}

class LoadFavorites extends FavoritesEvent {}

class AddToFavorites extends FavoritesEvent {
  final Movie movie;

  AddToFavorites({required this.movie});
}

class RemoveFromFavorite extends FavoritesEvent {
  final Movie movie;

  RemoveFromFavorite({required this.movie});
}

class RemoveAllFavorites extends FavoritesEvent {}
