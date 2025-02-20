import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
class HomeScreenMovies extends StatelessWidget {
  static const name = 'home-screen-movies';
  const HomeScreenMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Text(dotenv.env['THE_MOVIE_DB_KEY'] ?? 'No hay api key'),
      ),
    );
  }
}