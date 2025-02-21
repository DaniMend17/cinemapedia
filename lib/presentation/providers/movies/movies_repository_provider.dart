import 'package:cinemapedia/infrastructure/datasources/movie_db_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Provider inmutable su objetivo es proporcionar a los demas providers la información necesaria para que puedan consultar la información de la 
//implementación del repositorio.
final  movieRepositoryProvider = Provider((ref) => 
  MovieRepositoryImpl(
    datasource: MovieDbDatasource()
  )
);