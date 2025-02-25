import 'package:cinemapedia/config/helpers/human_formats.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MoviesHorizontalListview extends StatelessWidget {
  
  final List<Movie> movies;
  final String? title;
  final String? subtitle;
  final VoidCallback? loadNextPage;

  const MoviesHorizontalListview({
    required this.movies,
    super.key, 
    this.title, 
    this.subtitle, 
    this.loadNextPage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        children: [
          if(title != null || subtitle != null) _OnCinemaTitle(title, subtitle),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return _MovieInfo(movies[index]);
              },
            ),
          )

        ],
      ),
    );
  }
}

class _MovieInfo extends StatelessWidget {
  final Movie movie;
  const _MovieInfo(this.movie);

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.all(8),
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              movie.posterPath,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if(loadingProgress != null) const CircularProgressIndicator();
                return child;
              },
            ),
          ),
          const SizedBox(height: 5,),
          //*Title
          Text(
            movie.title,
            maxLines: 2,
            style: titleStyle.titleSmall,
          ),
          //*Raiting
          Row(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.star_half_outlined,
                color: Colors.yellow.shade800,
              ),
              const SizedBox(width: 3,),
              Text(
                '${movie.voteAverage}',
                //Obtener el estilo general de la app y también modificar el color de el texto.
                style: titleStyle.bodyMedium?.copyWith(color: Colors.yellow.shade800),
              ),
              const SizedBox(width: 10,),
              Text(
                // '${ movie.popularity }',
                HumanFormats.number(movie.popularity),
                //Obtener el estilo general de la app y también modificar el color de el texto.
                style: titleStyle.bodySmall,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _OnCinemaTitle extends StatelessWidget {
  final String? title;
  final String? subtitle;
  const _OnCinemaTitle(this.title, this.subtitle);

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
      child: Row(
        children: [
          if(title != null) 
            Text(
              title!,
              style: titleStyle
            ),
            const Spacer(),
            if(subtitle != null)
              FilledButton.tonal(
                onPressed: (){}, 
                child: Text(subtitle!)
              )
        ],
      ),
    );
  }
}