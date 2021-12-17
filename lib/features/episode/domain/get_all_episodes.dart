import 'package:chekunov_rick_and_morty_client/core/error.dart';
import 'package:chekunov_rick_and_morty_client/core/usecase.dart';
import 'package:chekunov_rick_and_morty_client/core/no_params.dart';
import 'package:chekunov_rick_and_morty_client/features/episode/domain/episode_entity.dart';
import 'package:chekunov_rick_and_morty_client/features/episode/domain/episode_repository.dart';

import 'package:dartz/dartz.dart';

class GetAllEpisodes extends UseCase<List<EpisodeEntity>, NoParams> {
  final EpisodeRepository _episodeRepository;

  GetAllEpisodes(this._episodeRepository);

  @override
  Future<Either<AppError, List<EpisodeEntity>>> call(NoParams params) async {
    return await _episodeRepository.getAllEpisodes();
  }
}
