import 'package:chekunov_rick_and_morty_client/location/domain/location_entity.dart';
import 'package:chekunov_rick_and_morty_client/_core/error.dart';
import 'package:dartz/dartz.dart';

abstract class CharacterRepository {
  Future<Either<AppError, LocationEntity>> getLocationById(int id);
  Future<Either<AppError, List<LocationEntity>>> getAllLocations();
}
