import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>(
  (ref) {
    final fetchMoreMovies = ref.watch( movieRepositoryProvider ).getNowPlaying;
    return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
  }
);


typedef MovieCallBack = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  
  int currentPage = 0;
  MovieCallBack fetchMoreMovies;
  //*Variable usada para controlar o evitar varias peticiones simultaneas (Opcional)
  bool isLoading = false;

  MoviesNotifier(
    {required this.fetchMoreMovies}
  ) : super([]);

  Future<void> loadNextPage() async{
    if(isLoading) return;
    isLoading = true;

    currentPage++;
    List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
    
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }

}
