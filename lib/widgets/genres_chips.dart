import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mvvm_statemanagement_practice/models/genre.dart';
import 'package:flutter_mvvm_statemanagement_practice/utils/genre_utils.dart';

import '../viewmodels/movies/movies_bloc.dart';

class GenresChips extends StatelessWidget {
  const GenresChips({super.key, required this.genresIds});

  final List<int> genresIds;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        if (state is MoviesLoaded || state is MoviesLoadingMore) {
          final allGenres = state is MoviesLoaded
              ? state.genres
              : (state as MoviesLoadingMore).genres;
          final List<Genre> genresNames = GenreUtils.movieGenresNames(
            genresIds,
            allGenres,
          );

          return Wrap(
            children: List.generate(genresNames.length, (index) {
              return chipWidget(
                genreName: genresNames[index].name,
                context: context,
              );
            }),
          );
        }

        return Text("Loading genres...");
      },
    );
  }

  Widget chipWidget({
    required String genreName,
    required BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.2),
          border: Border.all(color: Theme.of(context).colorScheme.surface),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          child: Text(
            genreName,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
