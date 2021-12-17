import 'package:chekunov_rick_and_morty_client/core/error.dart';
import 'package:chekunov_rick_and_morty_client/core/usecase.dart';
import 'package:chekunov_rick_and_morty_client/core/page_params.dart';
import 'package:chekunov_rick_and_morty_client/features/episode/domain/episode_entity.dart';
import 'package:chekunov_rick_and_morty_client/features/episode/domain/episode_repository.dart';

import 'package:dartz/dartz.dart';

class GetAllEpisodesByPage extends UseCase<List<EpisodeEntity>, PageParams> {
  final EpisodeRepository _episodeRepository;

  GetAllEpisodesByPage(this._episodeRepository);

  @override
  Future<Either<AppError, List<EpisodeEntity>>> call(PageParams params) async {
    return await _episodeRepository.getAllEpisodesByPage(params.page);
  }
}
