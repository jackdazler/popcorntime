import 'dart:convert';

import 'package:movie_recommendation/model/all_movie.dart';
import 'package:movie_recommendation/model/api_key.dart';
import 'package:http/http.dart' as http;
import 'package:movie_recommendation/model/single_movie.dart';

abstract class MovieRepository {
  Future<AllMovies> getAllMovies(int no, String searchMovie);
  Future<SingleMovie> getSingleMovies(String searchMovie);
}

class MoviesFetch implements MovieRepository {
  @override
  Future<AllMovies> getAllMovies(
      [int no = 1, String seachMovie = "captain"]) async {
    http.Response response = await http
        .get("http://www.omdbapi.com/?s=$seachMovie&page=$no&apikey=$apiKey");
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);

      return AllMovies.fromJson(result);
    } else
      throw Exception();
  }

  @override
  Future<SingleMovie> getSingleMovies([String searchMovie = "avenger"]) async {
    http.Response response =
        await http.get("http://www.omdbapi.com/?t=$searchMovie&apikey=$apiKey");
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);

      return SingleMovie.fromJson(result);
    } else
      throw Exception();
  }
}
