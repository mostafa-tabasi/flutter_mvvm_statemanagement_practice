import 'dart:convert';
import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'package:flutter_mvvm_statemanagement_practice/constants/api_constants.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<void> fetchMovies({int page = 1}) async {
    final url = Uri.parse(
      "${ApiConstants.baseUrl}/movie/popular?language=en-US&page=$page",
    );
    final response = await http.get(url, headers: ApiConstants.headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      log("Data: $data");
    } else {
      throw Exception("Failed to load movies: ${response.statusCode}");
    }
  }
}
