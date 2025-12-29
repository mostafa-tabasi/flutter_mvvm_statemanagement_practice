import 'package:flutter/material.dart';
import 'package:flutter_mvvm_statemanagement_practice/widgets/cached_image.dart';
import 'package:flutter_mvvm_statemanagement_practice/widgets/favorite_button.dart';
import 'package:flutter_mvvm_statemanagement_practice/widgets/genres_chips.dart';

import '../constants/constants.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key});

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
            // Navigate to the movie details screen
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IntrinsicWidth(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: const CachedImage(
                      imageUrl: AppConstants.defaultImageUrl,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Movie Title",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 20.0),
                            SizedBox(width: 5),
                            Text("8/10"),
                          ],
                        ),
                        const SizedBox(width: 10),
                        GenresChips(),
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
                            const Text(
                              "Release Date",
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
