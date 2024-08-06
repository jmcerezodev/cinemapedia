

import 'package:cinemapedia/infrastructure/datasource/moviesdb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Este repositorio es inmutable (Solo Lectura)
final moviesRepositoryProvider = Provider((ref){
  return MovieRepositoryImpl(MoviesdbDatasource());
});