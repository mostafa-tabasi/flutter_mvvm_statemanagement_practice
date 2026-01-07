import 'package:flutter/material.dart';
import 'package:flutter_mvvm_statemanagement_practice/widgets/cached_image.dart';
import 'package:flutter_mvvm_statemanagement_practice/widgets/favorite_button.dart';
import 'package:flutter_mvvm_statemanagement_practice/widgets/genres_chips.dart';

import '../constants/api_constants.dart';
import '../models/movie.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: size.height * 0.45,
              width: double.infinity,
              child: CachedImage(
                imageUrl: "${ApiConstants.imagesBaseUrl}${movie.backdropPath}",
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.4),
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 25),
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 25),
                                Text(
                                  movie.title,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 20,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "${movie.voteAverage.toStringAsFixed(1)}/10",
                                    ),
                                    Spacer(),
                                    Text(
                                      movie.releaseDate,
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                GenresChips(/*genresIds: movie.genreIds*/),
                                SizedBox(height: 10),
                                Text(
                                  movie.overview,
                                  style: TextStyle(fontSize: 18),
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(6),
                            child: FavoriteButton(/*movie: movie*/),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
