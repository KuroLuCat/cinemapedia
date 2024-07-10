import 'package:cinemapedia/domain/infraestructure/datasources/actor_moviedb_datasource.dart';
import 'package:cinemapedia/domain/repositories/actors_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsRepositoryProvider = Provider((ref) {
  return ActorsRepositoryImpl(ActorMoviedbDatasource());
});