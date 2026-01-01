import 'dart:convert';

import 'package:flutter_mvvm_statemanagement_practice/constants/api_constants.dart';
import 'package:flutter_mvvm_statemanagement_practice/models/genre.dart';
import 'package:flutter_mvvm_statemanagement_practice/models/movie.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<Movie>> fetchMovies({int page = 1}) async {
    final url = Uri.parse(
      "${ApiConstants.baseUrl}/movie/popular?language=en-US&page=$page",
    );
    final response = await http
        .get(url, headers: ApiConstants.headers)
        .timeout(Duration(seconds: 20));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List.from(
        data["results"].map((element) => Movie.fromJson(element)),
      );
    } else {
      throw Exception("Failed to load movies: ${response.statusCode}");
    }
  }

  Future<List<Genre>> fetchGenres() async {
    final url = Uri.parse(
      "${ApiConstants.baseUrl}/genre/movie/list?language=en-US",
    );
    final response = await http
        .get(url, headers: ApiConstants.headers)
        .timeout(Duration(seconds: 20));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List.from(
        data["genres"].map((element) => Genre.fromJson(element)),
      );
    } else {
      throw Exception("Failed to load genres: ${response.statusCode}");
    }
  }
}
