import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mvvm_statemanagement_practice/models/genre.dart';
import 'package:flutter_mvvm_statemanagement_practice/models/movie.dart';
import 'package:flutter_mvvm_statemanagement_practice/repositories/movies_repository.dart';
import 'package:flutter_mvvm_statemanagement_practice/screens/favorites_screen.dart';
import 'package:flutter_mvvm_statemanagement_practice/services/navigation_service.dart';
import 'package:flutter_mvvm_statemanagement_practice/utils/init_getit.dart';
import 'package:flutter_mvvm_statemanagement_practice/widgets/movie_item.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  final List<Movie> _movies = [];
  int _currentPage = 1;
  bool _isFetching = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _fetchMovies();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !_isFetching) {
      _fetchMovies();
    }
  }

  Future<void> _fetchMovies() async {
    if (_isFetching) return;

    setState(() {
      _isFetching = true;
    });

    try {
      final List<Movie> movies = await getIt<MoviesRepository>().fetchMovies(
        page: _currentPage,
      );
      setState(() {
        _movies.addAll(movies);
        _currentPage++;
      });
    } catch (error) {
      getIt<NavigationService>().showSnackbar("Something went wrong!");
    } finally {
      setState(() {
        _isFetching = false;
      });
    }
  }

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
              final List<Genre> genres = await getIt<MoviesRepository>()
                  .fetchGenres();
              log("$genres");
            },
            icon: const Icon(Icons.dark_mode),
          ),
        ],
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _movies.length + (_isFetching ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < _movies.length) {
            return MovieItem(movie: _movies[index]);
          } else {
            return Center(child: const CircularProgressIndicator.adaptive());
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
