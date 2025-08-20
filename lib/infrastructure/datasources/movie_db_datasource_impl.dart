import 'package:cinemapedia/config/environment/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mappers.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_db_response.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_details.dart';
import 'package:dio/dio.dart';

class MovieDbDatasource extends MoviesDatasource {
  final dio = Dio(
    BaseOptions(baseUrl: 'https://api.themoviedb.org/3', queryParameters: {
      'api_key': Environment.moviedDBKey,
      'language': 'es-MX'
    }),
  );

  List<Movie> _jsonToMovie(Map<String, dynamic> json) {
    MovieDbResponse movieDbResponse = MovieDbResponse.fromJson(json);
    final List<Movie> movies = movieDbResponse.results
        .map((e) => MovieMappers.movieDBToEntidad(e))
        .where((movie) => movie.posterPath != 'no poster')
        .toList();
    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response =
        await dio.get('/movie/now_playing', queryParameters: {'page': page});

    // MovieDbResponse movieDbResponse = MovieDbResponse.fromJson(response.data);

    // final List<Movie> movies = movieDbResponse.results
    //     .map((e) => MovieMappers.movieDBToEntidad(e))
    //     .where((movie) => movie.posterPath != 'no poster')
    //     .toList();
    return _jsonToMovie(response.data);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response =
        await dio.get('/movie/popular', queryParameters: {'page': page});
    return _jsonToMovie(response.data);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response =
        await dio.get('/movie/top_rated', queryParameters: {'page': page});
    return _jsonToMovie(response.data);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response =
        await dio.get('/movie/upcoming', queryParameters: {'page': page});
    return _jsonToMovie(response.data);
  }
  
  @override
  Future<Movie> getMovieById(String id) async {
     final response =
        await dio.get('/movie/$id');
      if (response.statusCode != 200) throw Exception('Movie with id: $id not founded.');
    final movieDetails = MovieDetails.fromJson(response.data);
    return MovieMappers.movieDetailsToEntidad(movieDetails);
  }

  

}
