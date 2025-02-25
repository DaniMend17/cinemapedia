import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class OnCinemaMovies extends StatelessWidget {
  final List<Movie> movies;
  const OnCinemaMovies({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {

    final title = Theme.of(context).textTheme.titleLarge;
    final color = Theme.of(context).colorScheme;

    return Expanded(
      child: Column(
        children: [
          //En cines fecha
          _OnCinemaTitle(title: title, color: color),

          const SizedBox(height: 15,),

          Expanded(
            child: ListView.builder(
              itemCount: movies.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return _MovieBannerAndInfo(movies[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}

class _OnCinemaTitle extends StatelessWidget {
  const _OnCinemaTitle({
    required this.title,
    required this.color,
  });

  final TextStyle? title;
  final ColorScheme color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 20, 14, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'En cines',
            style: title,
          ),
          Container(
            decoration: BoxDecoration(
              color: color.primary,
              borderRadius: const BorderRadius.all(Radius.circular(30))
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: const Text(
                'lunes 24',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MovieBannerAndInfo extends StatelessWidget {
  final Movie movie;
  const _MovieBannerAndInfo(this.movie);

  @override
  Widget build(BuildContext context) {
    final title = Theme.of(context).textTheme.titleMedium;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox(
        width: 150,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                width: 150,
                height: 250,
                movie.posterPath,
                fit: BoxFit.cover,
              )
            ),
            SizedBox(height: 5,),
            Text(
              maxLines: 2,
              movie.title,
              style: title,
            )
          ],
        ),
      ),
    );
  }
}
