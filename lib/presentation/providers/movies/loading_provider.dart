import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';

  //A pesar de ser un provider de solo lectura, este esta escuchando otros providers que si cambian, por tando su valor también
  // va a cambiar si los providers de los que depende cambian su valor.
final loadingMoviesProvider = Provider<bool>(
  (ref) {
    final step1 = ref.watch(nowPlayingMoviesProvider).isEmpty;
    final step2 = ref.watch(popularMoviesProvider).isEmpty;
    final step3 = ref.watch(topRatedMoviesProvider).isEmpty;
    final step4 = ref.watch(upcomingMoviesProvider).isEmpty;

    if (step1 || step2 || step3 || step4) return true;
    return false;
  },
);
