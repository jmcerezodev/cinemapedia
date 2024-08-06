import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:dio/dio.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/moviesdb/moviesdb_response.dart';


class MoviesdbDatasource extends MoviesDatasource{

  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.theMovieDbKey,
      'language': 'es-ES',
    }
  ));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {

    final response = await dio.get('/movie/now_playing');
    final moviesDBResponse = MoviesDbResponse.fromJson(response.data);

    final List<Movie> movies = moviesDBResponse.results
    .where((moviedb) => moviedb.posterPath != 'No-Poster')
    .map(
      (moviesdb) => MovieMapper.movieDbToEntity(moviesdb)
      ).toList();

    return movies;    
  }

}