import 'package:chekunov_rick_and_morty_client/episode/domain/episode_entity.dart';
import 'package:chekunov_rick_and_morty_client/_core/error.dart';
import 'package:dartz/dartz.dart';

abstract class CharacterRepository {
  Future<Either<AppError, EpisodeEntity>> getEpisodeById(int id);
  Future<Either<AppError, List<EpisodeEntity>>> getAllEpisodes();
}
