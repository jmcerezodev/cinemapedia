import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final searchQueryProvider = StateProvider<String>((ref) => '');
final searchMoviesProvider = StateNotifierProvider<SearchedMoviesNotifier, List<Movie>>((ref) {
final moviesRepository = ref.read(moviesRepositoryProvider);

  return SearchedMoviesNotifier(
    searchMovies: moviesRepository.searchMovie, 
    ref: ref
  );
});

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchedMoviesNotifier extends StateNotifier<List<Movie>> {

  final SearchMoviesCallback searchMovies;
  final Ref ref;
  
  SearchedMoviesNotifier({
    required this.searchMovies,
    required this.ref,
  }): super([]);

  Future <List<Movie>> searchMoviesByQuery(String query) async {
    final List<Movie> movies = await searchMovies(query);
    ref.read(searchQueryProvider.notifier).update((state) => query);

    state = movies;
    return movies;
  }
}