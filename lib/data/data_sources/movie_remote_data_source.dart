import 'dart:convert';

import 'package:http/http.dart';
import 'package:movies_app/data/core/api_constants.dart';
import 'package:movies_app/data/models/movie_model.dart';
import 'package:movies_app/data/models/movies_result_model.dart';

import '../core/api_client.dart';

abstract class MovieRemoteDataSource {
  //get trending movies by day
  Future<List<MovieModel>?> getTrendingMovies();

  Future<List<MovieModel>?> getPopularMovies();

  Future<List<MovieModel>?> getComingSoon();

  Future<List<MovieModel>?> getPlayingNow();
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiClient _client;

  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<List<MovieModel>?> getTrendingMovies() async {
    final response = await _client.get("trending/movie/day");
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }

  @override
  Future<List<MovieModel>?> getPopularMovies() async {
    final response = await _client.get("movie/popular");
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }

  @override
  Future<List<MovieModel>?> getPlayingNow() async {
    final response = await _client.get("movie/now_playing");
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }

  @override
  Future<List<MovieModel>?> getComingSoon() async {
    final response = await _client.get("movie/upcoming");
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }
}
