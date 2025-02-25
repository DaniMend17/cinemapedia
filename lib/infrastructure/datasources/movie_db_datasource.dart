import 'package:cinemapedia/config/environment/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mappers.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_db_response.dart';
import 'package:dio/dio.dart';

class MovieDbDatasource extends MoviesDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.moviedDBKey,
        'language': 'es-MX'
      }
    ),
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async{
    final response = await dio.get(
      '/movie/now_playing',
      queryParameters: {
        'page': page
      }
    );
    
    MovieDbResponse movieDbResponse = MovieDbResponse.fromJson(response.data);
    
    final List<Movie> movies = movieDbResponse.results.map(
      (e) => MovieMappers.movieDBToEntidad(e)
    )
    .where((movie) => movie.posterPath != 'no poster')
    .toList();
    return movies;    
  }
  
}