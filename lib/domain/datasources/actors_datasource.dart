

import 'package:cinemapedia/domain/entities/actor.dart';

abstract class ActorsDatasource{

  Future<List<Actor>> getActorDatasource(String movieId);

}