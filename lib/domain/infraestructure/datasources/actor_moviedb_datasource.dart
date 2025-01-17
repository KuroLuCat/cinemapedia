import 'package:cinemapedia/config/constants/enviroment.dart';
import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/domain/infraestructure/mappers/actor_mapper.dart';
import 'package:cinemapedia/domain/infraestructure/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';

class ActorMoviedbDatasource extends ActorsDatasource{
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Enviroment.theMovieDBKey,
        'language': 'es-MX'
      }));
  
  List<Actor> _jsonToActors(Map<String,dynamic> json){
    final creditsResponse = CreditsResponse.fromJson(json);
    final List<Actor> actors = creditsResponse.cast.map((cast)=>ActorMapper.castToEntity(cast)).toList();

    return actors;
  }


  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');
    return _jsonToActors(response.data);
  }

}