import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDatasource datasource;

  MovieRepositoryImpl(
    {required this.datasource}
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async{
    return datasource.getNowPlaying(page: page);
  }
  
}