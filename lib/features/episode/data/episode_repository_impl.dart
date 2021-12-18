import 'package:chekunov_rick_and_morty_client/core/error.dart';
import 'package:chekunov_rick_and_morty_client/core/exception.dart';
import 'package:chekunov_rick_and_morty_client/features/episode/data/episode_model.dart';
import 'package:chekunov_rick_and_morty_client/features/episode/domain/episode_repository.dart';
import 'package:chekunov_rick_and_morty_client/features/episode/data/episode_remote_data_source.dart';

import 'package:dartz/dartz.dart';

class EpisodeRepositoryImpl implements EpisodeRepository {
  final EpisodeRemoteDataSource remoteDataSource;

  EpisodeRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<AppError, List<EpisodeModel>>> getAllEpisodes() async {
    try {
      final episodes = await remoteDataSource.getAllEpisodes();
      return Right(episodes);
    } on ServerException {
      return Left(ServerError());
    }
  }

  @override
  Future<Either<AppError, EpisodeModel>> getEpisodeById(int id) async {
    try {
      final episode = await remoteDataSource.getEpisodeById(id);
      return Right(episode);
    } on ServerException {
      return Left(ServerError());
    }
  }

  @override
  Future<Either<AppError, List<EpisodeModel>>> getEpisodesByPage(
      int page) async {
    try {
      final episodes = await remoteDataSource.getEpisodesByPage(page);
      return Right(episodes);
    } on ServerException {
      return Left(ServerError());
    }
  }
}
