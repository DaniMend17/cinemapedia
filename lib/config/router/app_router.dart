import 'package:cinemapedia/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      path: '/',
      name: HomeScreenMovies.name,
      builder: (context, state) => const HomeScreenMovies(),
      //*Defino el deeplinking es decir las rutas hijas de esta ruta principal, por lo tanto no es necesario agregar el "/" al inicio de la ruta hija.
      routes: [
        GoRoute(
          path: 'movie/:id',
          name: MovieScreen.name,
          builder: (context, state) {
            return MovieScreen(movieId: state.pathParameters['id'] ?? 'no_id');
          },
        )
      ]),
]);
