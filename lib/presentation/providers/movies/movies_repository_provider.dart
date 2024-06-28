import 'package:cinemapedia/domain/infraestructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia/domain/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MoviedbDatasource());
});
