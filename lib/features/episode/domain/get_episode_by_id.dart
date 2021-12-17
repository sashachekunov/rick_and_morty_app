import 'package:chekunov_rick_and_morty_client/core/error.dart';
import 'package:chekunov_rick_and_morty_client/core/usecase.dart';
import 'package:chekunov_rick_and_morty_client/core/id_params.dart';
import 'package:chekunov_rick_and_morty_client/features/episode/domain/episode_entity.dart';
import 'package:chekunov_rick_and_morty_client/features/episode/domain/episode_repository.dart';

import 'package:dartz/dartz.dart';

class GetEpisodeById extends UseCase<EpisodeEntity, IdParams> {
  final EpisodeRepository _episodeRepository;

  GetEpisodeById(this._episodeRepository);

  @override
  Future<Either<AppError, EpisodeEntity>> call(IdParams params) async {
    return await _episodeRepository.getEpisodeById(params.id);
  }
}
