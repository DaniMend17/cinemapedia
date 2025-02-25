import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/movies/movies_horizontal_listview.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreenMovies extends StatelessWidget {
  static const name = 'home-screen-movies';
  const HomeScreenMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeScreenView(),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

class _HomeScreenView extends ConsumerStatefulWidget {
  const _HomeScreenView();

  @override
  _HomeScreenViewState createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends ConsumerState<_HomeScreenView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final moviesSlideShow = ref.watch(moviesSlideShowProvider);

    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppbar(),
        MoviesSlideshow(movies: moviesSlideShow),
        MoviesHorizontalListview(
          movies: nowPlayingMovies, 
          title: 'En cines', 
          subtitle: 'Lunes 20',
          loadNextPage: () => ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
        )

      ],
    );
  }
}
