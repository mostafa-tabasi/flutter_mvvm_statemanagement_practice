import 'package:flutter/material.dart';
import 'package:flutter_mvvm_statemanagement_practice/screens/favorites_screen.dart';
import 'package:flutter_mvvm_statemanagement_practice/services/navigation_service.dart';
import 'package:flutter_mvvm_statemanagement_practice/utils/init_getit.dart';
import 'package:flutter_mvvm_statemanagement_practice/widgets/movie_item.dart';

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
          IconButton(
            onPressed: () async {
              // final List<Movie> movies = await getIt<ApiServices>()
              // .fetchMovies();
              // final List<Genre> genres = await getIt<MoviesRepository>()
              //     .fetchGenres();
              // log("$genres");
            },
            icon: const Icon(Icons.dark_mode),
          ),
        ],
      ),
      body: ListView.builder(
        // controller: _scrollController,
        // itemCount: _movies.length + (_isFetching ? 1 : 0),
        itemCount: 10,
        itemBuilder: (context, index) {
          // if (index < _movies.length) {
          return MovieItem();
          // return MovieItem(movie: _movies[index]);
          // } else {
          //   return Center(child: const CircularProgressIndicator.adaptive());
          // }
        },
      ),
    );
  }
}
