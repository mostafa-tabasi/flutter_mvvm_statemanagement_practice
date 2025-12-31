import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mvvm_statemanagement_practice/models/movie_model.dart';
import 'package:flutter_mvvm_statemanagement_practice/screens/favorites_screen.dart';
import 'package:flutter_mvvm_statemanagement_practice/services/api_services.dart';
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
              final List<MovieModel> movies = await getIt<ApiServices>()
                  .fetchMovies();
              log("$movies");
            },
            icon: const Icon(Icons.dark_mode),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => MovieItem(),
      ),
    );
  }
}
