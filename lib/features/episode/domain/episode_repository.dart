import 'package:chekunov_rick_and_morty_client/core/error.dart';
import 'package:chekunov_rick_and_morty_client/features/episode/domain/episode_entity.dart';

import 'package:dartz/dartz.dart';

abstract class EpisodeRepository {
  Future<Either<AppError, EpisodeEntity>> getEpisodeById(int id);
  Future<Either<AppError, List<EpisodeEntity>>> getAllEpisodes();
  Future<Either<AppError, List<EpisodeEntity>>> getAllEpisodesByPage(int page);
}
