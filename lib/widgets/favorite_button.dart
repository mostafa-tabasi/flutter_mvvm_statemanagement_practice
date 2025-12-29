import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        // TODO: implement add to favorite function
      },
      icon: const Icon(Icons.favorite_outline, size: 20),
    );
  }
}
