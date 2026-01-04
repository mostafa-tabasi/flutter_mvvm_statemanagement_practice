import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mvvm_statemanagement_practice/screens/favorites_screen.dart';
import 'package:flutter_mvvm_statemanagement_practice/services/navigation_service.dart';
import 'package:flutter_mvvm_statemanagement_practice/utils/init_getit.dart';
import 'package:flutter_mvvm_statemanagement_practice/viewmodels/theme/theme_bloc.dart';
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
