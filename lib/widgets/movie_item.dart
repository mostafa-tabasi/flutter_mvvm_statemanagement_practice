import 'package:flutter/material.dart';
import 'package:flutter_mvvm_statemanagement_practice/constants/api_constants.dart';
import 'package:flutter_mvvm_statemanagement_practice/models/movie.dart';
import 'package:flutter_mvvm_statemanagement_practice/screens/details_screen.dart';
import 'package:flutter_mvvm_statemanagement_practice/services/navigation_service.dart';
import 'package:flutter_mvvm_statemanagement_practice/utils/init_getit.dart';
import 'package:flutter_mvvm_statemanagement_practice/widgets/cached_image.dart';
import 'package:flutter_mvvm_statemanagement_practice/widgets/favorite_button.dart';
import 'package:flutter_mvvm_statemanagement_practice/widgets/genres_chips.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(12.0),
          onTap: () {
            getIt<NavigationService>().navigate(DetailsScreen(movie: movie));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IntrinsicWidth(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Hero(
                    tag: movie.id,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: CachedImage(
                        imageUrl:
                            "${ApiConstants.imagesBaseUrl}${movie.backdropPath}",
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 20.0),
                            SizedBox(width: 5),
                            Text("${movie.voteAverage.toStringAsFixed(1)}/10"),
                          ],
                        ),
                        const SizedBox(width: 10),
                        GenresChips(genresIds: movie.genreIds),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.watch_later,
                              size: 20,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              movie.releaseDate,
                              style: TextStyle(color: Colors.grey),
                            ),
                            const Spacer(),
                            FavoriteButton(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
