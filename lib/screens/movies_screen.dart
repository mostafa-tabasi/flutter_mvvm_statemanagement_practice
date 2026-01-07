import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mvvm_statemanagement_practice/screens/favorites_screen.dart';
import 'package:flutter_mvvm_statemanagement_practice/services/navigation_service.dart';
import 'package:flutter_mvvm_statemanagement_practice/utils/init_getit.dart';
import 'package:flutter_mvvm_statemanagement_practice/viewmodels/theme/theme_bloc.dart';
import 'package:flutter_mvvm_statemanagement_practice/widgets/movie_item.dart';

import '../viewmodels/movies/movies_bloc.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Movies"),
        actions: [
          IconButton(
            onPressed: () {
              getIt<NavigationService>().navigate(FavoritesScreen());
            },
            icon: const Icon(Icons.favorite),
            color: Colors.red,
          ),
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return IconButton(
                onPressed: () async {
                  getIt<ThemeBloc>().add(ToggleThemeEvent());
                },
                icon: Icon(
                  state is LightTheme ? Icons.dark_mode : Icons.light_mode,
                ),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          if (state is MoviesLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is MoviesError) {
            return Center(child: Text(state.message));
          } else if (state is MoviesLoaded || state is MoviesLoadingMore) {
            final movies = state is MoviesLoaded
                ? state.movies
                : (state as MoviesLoadingMore).movies;
            final isLoadingMore = state is MoviesLoadingMore;
            final itemCount = isLoadingMore ? movies.length + 1 : movies.length;

            return NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (scrollInfo.metrics.pixels ==
                        scrollInfo.metrics.maxScrollExtent &&
                    !isLoadingMore) {
                  getIt<MoviesBloc>().add(FetchMoreMovies());
                  return true;
                }
                return false;
              },
              child: ListView.builder(
                itemCount: itemCount,
                itemBuilder: (context, index) {
                  if (index >= movies.length && isLoadingMore) {
                    return Center(
                      child: const CircularProgressIndicator.adaptive(),
                    );
                  }

                  return MovieItem(movie: movies[index]);
                },
              ),
            );
          }

          return const Center(child: Text("No data available"));
        },
      ),
    );
  }
}
