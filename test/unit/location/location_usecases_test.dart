import 'package:chekunov_rick_and_morty_client/core/error.dart';
import 'package:chekunov_rick_and_morty_client/core/page_params.dart';
import 'package:chekunov_rick_and_morty_client/features/location/domain/get_locations_by_page.dart';
import 'package:chekunov_rick_and_morty_client/features/location/domain/location_entity.dart';
import 'package:chekunov_rick_and_morty_client/features/location/domain/location_repository.dart';

import 'package:dartz/dartz.dart';
import 'package:test/test.dart';

import '../../core/mock_locations_entity.dart';
import '../../core/test_error_impl.dart';

class LocationRepositoryImplTest implements LocationRepository {
  @override
  Future<Either<AppError, List<LocationEntity>>> getLocationsByPage(
      int page) async {
    if (page > 0 && page < 8) {
      return Right([earthC137, abadango]);
    } else {
      return Left(TestError());
    }
  }
}

void main() {
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
}
