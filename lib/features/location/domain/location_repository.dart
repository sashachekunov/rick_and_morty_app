import 'package:chekunov_rick_and_morty_client/core/error.dart';
import 'package:chekunov_rick_and_morty_client/features/location/domain/location_entity.dart';

import 'package:dartz/dartz.dart';

abstract class LocationRepository {
  Future<Either<AppError, LocationEntity>> getLocationById(int id);
  Future<Either<AppError, List<LocationEntity>>> getAllLocations();
  Future<Either<AppError, List<LocationEntity>>> getAllLocationsByPage(
      int page);
}
