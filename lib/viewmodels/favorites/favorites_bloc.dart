import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/movie.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(FavoritesInitial()) {
    on<LoadFavorites>(_onLoadFavorites);
    on<AddToFavorites>(_onAddToFavorites);
    on<RemoveFromFavorite>(_onRemoveFromFavorite);
    on<RemoveAllFavorites>(_onRemoveAllFavorites);
  }

  final sharedPrefsFavsKey = "sharedPrefsFavsKey";

  Future<void> _onLoadFavorites(event, emit) async {
    final prefs = await SharedPreferences.getInstance();
    final stringList = prefs.getStringList(sharedPrefsFavsKey) ?? [];
    final favoritesList = stringList
        .map((movie) => Movie.fromJson(json.decode(movie)))
        .toList();
    emit(FavoritesLoaded(favorites: favoritesList));
  }

  Future<void> _onAddToFavorites(AddToFavorites event, emit) async {
    if (state is FavoritesLoaded) {
      List<Movie> updatedFavorites = List.from(
        (state as FavoritesLoaded).favorites,
      )..add(event.movie);
      emit(FavoritesLoaded(favorites: updatedFavorites));
      await _saveFavorites(updatedFavorites);
    }
  }

  Future<void> _onRemoveFromFavorite(RemoveFromFavorite event, emit) async {
    if (state is FavoritesLoaded) {
      /*
      List<Movie> updatedFavorites = (state as FavoritesLoaded).favorites
          .where((movie) => movie.id != event.movie.id)
          .toList();
      */

      List<Movie> updatedFavorites = List.from(
        (state as FavoritesLoaded).favorites,
      )..removeWhere((movie) => movie.id == event.movie.id);
      emit(FavoritesLoaded(favorites: updatedFavorites));
      await _saveFavorites(updatedFavorites);
    }
  }

  Future<void> _onRemoveAllFavorites(event, emit) async {
    emit(FavoritesLoaded(favorites: []));
    await _saveFavorites([]);
  }

  Future<void> _saveFavorites(List<Movie> favoriteList) async {
    final prefs = await SharedPreferences.getInstance();
    final stringList = favoriteList
        .map((movie) => json.encode(movie.toJson()))
        .toList();
    prefs.setStringList(sharedPrefsFavsKey, stringList);
  }

  bool _isFavorite(Movie movieModel) {
    if (state is FavoritesLoaded) {
      return (state as FavoritesLoaded).favorites.any(
        (movie) => movie.id == movieModel.id,
      );
    }

    return false;
  }
}
