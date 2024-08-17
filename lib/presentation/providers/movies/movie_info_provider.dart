import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieInfoProvider = StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {
  final movieRepository = ref.watch(moviesRepositoryProvider);
  return MovieMapNotifier(getMovie: movieRepository.getMovieById);
});

typedef GetMovieCall = Future<Movie>Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {

  MovieMapNotifier({
    required this.getMovie,
  }): super({});

  final GetMovieCall getMovie;

  Future<void> loadMovie(String movieId) async {

    if(state[movieId] != null) return;
    final movie = await getMovie(movieId);
    state = {...state, movieId: movie};
  }
}