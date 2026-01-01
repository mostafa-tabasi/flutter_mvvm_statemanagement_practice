import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    // bool isFavorite = favoriteIds.contains(widget.movie.id);

    return IconButton(
      onPressed: () {
        // setState(() {
        //   if (isFavorite) {
        //     favoriteIds.remove(widget.movie.id);
        //   } else {
        //     favoriteIds.add(widget.movie.id);
        //   }
        // });
        //TODO: implement the favorite logic
      },
      icon: Icon(
        /*isFavorite ? Icons.favorite :*/
        Icons.favorite_outline,
        size: 20,
        color: /*isFavorite ? Colors.red :*/ Colors.grey,
      ),
    );
  }
}
