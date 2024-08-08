

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/moviesdb/movie_moviesdb.dart';

class MovieMapper {

  static Movie movieDbToEntity(MovieMovieDB movieDB) => Movie(
    adult: movieDB.adult, 
    backdropPath: (movieDB.backdropPath != '')
    ? 'https://image.tmdb.org/t/p/w500${movieDB.backdropPath}'
    :'https://ih1.redbubble.net/image.533910704.5853/pp,840x830-pad,1000x1000,f8f8f8.u3.jpg',
    genreIds: movieDB.genreIds.map((e) => e.toString()).toList(), 
    id: movieDB.id, 
    originalLanguage: movieDB.originalLanguage, 
    originalTitle: movieDB.originalTitle, 
    overview: movieDB.overview, 
    popularity: movieDB.popularity, 
    posterPath: (movieDB.posterPath != '')
    ?'https://image.tmdb.org/t/p/w500${movieDB.posterPath}'
    :'No-Poster', 
    //releaseDate: movieDB.releaseDate, 
    title: movieDB.title, 
    video: movieDB.video, 
    voteAverage: movieDB.voteAverage, 
    voteCount: movieDB.voteCount
  );

}