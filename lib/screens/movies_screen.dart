import 'package:flutter/material.dart';
import 'package:flutter_mvvm_statemanagement_practice/constants/constants.dart';
import 'package:flutter_mvvm_statemanagement_practice/widgets/cached_image.dart';
import 'package:flutter_mvvm_statemanagement_practice/widgets/movie.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Movies"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
            color: Colors.red,
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.dark_mode)),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) =>
            Padding(padding: const EdgeInsets.all(8.0), child: Movie()),
      ),
    );
  }
}
