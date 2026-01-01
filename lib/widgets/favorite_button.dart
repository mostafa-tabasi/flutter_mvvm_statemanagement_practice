import 'package:flutter/material.dart';
import 'package:flutter_mvvm_statemanagement_practice/models/movie.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key, required this.movie});

  final Movie movie;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  final favoriteIds = [];

  @override
  Widget build(BuildContext context) {
    bool isFavorite = favoriteIds.contains(widget.movie.id);

    return IconButton(
      onPressed: () {
        setState(() {
          if (isFavorite) {
            favoriteIds.remove(widget.movie.id);
          } else {
            favoriteIds.add(widget.movie.id);
          }
        });
      },
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_outline,
        size: 20,
        color: isFavorite ? Colors.red : Colors.grey,
      ),
    );
  }
}
