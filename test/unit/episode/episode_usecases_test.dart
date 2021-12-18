import 'package:chekunov_rick_and_morty_client/core/error.dart';
import 'package:chekunov_rick_and_morty_client/core/id_params.dart';
import 'package:chekunov_rick_and_morty_client/core/no_params.dart';
import 'package:chekunov_rick_and_morty_client/core/page_params.dart';
import 'package:chekunov_rick_and_morty_client/features/episode/domain/episode_entity.dart';
import 'package:chekunov_rick_and_morty_client/features/episode/domain/episode_repository.dart';
import 'package:chekunov_rick_and_morty_client/features/episode/domain/get_all_episodes.dart';
import 'package:chekunov_rick_and_morty_client/features/episode/domain/get_episode_by_id.dart';
import 'package:chekunov_rick_and_morty_client/features/episode/domain/get_episodes_by_page.dart';

import 'package:dartz/dartz.dart';
import 'package:test/test.dart';

import '../../core/episode_inst.dart';
import '../../core/test_error_impl.dart';

class EpisodeRepositoryImplTest implements EpisodeRepository {
  @override
  Future<Either<AppError, List<EpisodeEntity>>> getAllEpisodes() async {
    return Right([pilot, lawnmowerDog]);
  }

  @override
  Future<Either<AppError, List<EpisodeEntity>>> getEpisodesByPage(
      int page) async {
    if (page > 0 && page < 4) {
      return Right([pilot, lawnmowerDog]);
    } else {
      return Left(TestError());
    }
  }

  @override
  Future<Either<AppError, EpisodeEntity>> getEpisodeById(int id) async {
    if (id == 1) {
      return Right(pilot);
    } else if (id == 2) {
      return Right(lawnmowerDog);
    } else {
      return Left(TestError());
    }
  }
}

void main() {
  test('GetAllEpisodes test', () async {
    // Arrange
    var episodeRepository = EpisodeRepositoryImplTest();

    // Act
    var res = await GetAllEpisodes(episodeRepository).call(NoParams());

    // Assert
    expect(res.fold((l) => l, (r) => r), [pilot, lawnmowerDog]);
  });

  test('GetEpisodesByPage Error test', () async {
    // Arrange
    var episodeRepository = EpisodeRepositoryImplTest();

    // Act
    var res =
        await GetEpisodesByPage(episodeRepository).call(const PageParams(4));

    // Assert
    expect(res.fold((l) => l, (r) => r), TestError());
  });

  test('GetEpisodesByPage test', () async {
    // Arrange
    var episodeRepository = EpisodeRepositoryImplTest();

    // Act
    var res =
        await GetEpisodesByPage(episodeRepository).call(const PageParams(1));

    // Assert
    expect(res.fold((l) => l, (r) => r), [pilot, lawnmowerDog]);
  });

  test('GetEpisodeById Error test', () async {
    // Arrange
    var episodeRepository = EpisodeRepositoryImplTest();

    // Act
    var res = await GetEpisodeById(episodeRepository).call(const IdParams(10));

    // Assert
    expect(res.fold((l) => l, (r) => r), TestError());
  });

  test('GetEpisodeById test', () async {
    // Arrange
    var episodeRepository = EpisodeRepositoryImplTest();

    // Act
    var res = await GetEpisodeById(episodeRepository).call(const IdParams(1));

    // Assert
    expect(res.fold((l) => l, (r) => r), pilot);
  });
}
