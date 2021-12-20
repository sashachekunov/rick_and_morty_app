import 'package:chekunov_rick_and_morty_client/core/error.dart';
import 'package:chekunov_rick_and_morty_client/core/id_params.dart';
import 'package:chekunov_rick_and_morty_client/core/no_params.dart';
import 'package:chekunov_rick_and_morty_client/core/page_params.dart';
import 'package:chekunov_rick_and_morty_client/features/location/domain/get_all_locations.dart';
import 'package:chekunov_rick_and_morty_client/features/location/domain/get_location_by_id.dart';
import 'package:chekunov_rick_and_morty_client/features/location/domain/get_locations_by_page.dart';
import 'package:chekunov_rick_and_morty_client/features/location/domain/location_entity.dart';
import 'package:chekunov_rick_and_morty_client/features/location/domain/location_repository.dart';

import 'package:dartz/dartz.dart';
import 'package:test/test.dart';

import '../../core/mock_locations_entity.dart';
import '../../core/test_error_impl.dart';

class LocationRepositoryImplTest implements LocationRepository {
  @override
  Future<Either<AppError, List<LocationEntity>>> getAllLocations() async {
    return Right([earthC137, abadango]);
  }

  @override
  Future<Either<AppError, List<LocationEntity>>> getLocationsByPage(
      int page) async {
    if (page > 0 && page < 8) {
      return Right([earthC137, abadango]);
    } else {
      return Left(TestError());
    }
  }

  @override
  Future<Either<AppError, LocationEntity>> getLocationById(int id) async {
    if (id == 1) {
      return Right(earthC137);
    } else if (id == 2) {
      return Right(abadango);
    } else {
      return Left(TestError());
    }
  }
}

void main() {
  test('GetAllEpisodes test', () async {
    // Arrange
    var locationRepository = LocationRepositoryImplTest();

    // Act
    var res = await GetAllLocations(locationRepository).call(NoParams());

    // Assert
    expect(res.fold((l) => l, (r) => r), [earthC137, abadango]);
  });

  test('GetEpisodesByPage Error test', () async {
    // Arrange
    var locationRepository = LocationRepositoryImplTest();

    // Act
    var res =
        await GetLocationsByPage(locationRepository).call(const PageParams(8));

    // Assert
    expect(res.fold((l) => l, (r) => r), TestError());
  });

  test('GetEpisodesByPage test', () async {
    // Arrange
    var locationRepository = LocationRepositoryImplTest();

    // Act
    var res =
        await GetLocationsByPage(locationRepository).call(const PageParams(1));

    // Assert
    expect(res.fold((l) => l, (r) => r), [earthC137, abadango]);
  });

  test('GetEpisodeById Error test', () async {
    // Arrange
    var locationRepository = LocationRepositoryImplTest();

    // Act
    var res =
        await GetLocationById(locationRepository).call(const IdParams(10));

    // Assert
    expect(res.fold((l) => l, (r) => r), TestError());
  });

  test('GetEpisodeById test', () async {
    // Arrange
    var locationRepository = LocationRepositoryImplTest();

    // Act
    var res = await GetLocationById(locationRepository).call(const IdParams(1));

    // Assert
    expect(res.fold((l) => l, (r) => r), earthC137);
  });
}
