import 'package:chekunov_rick_and_morty_client/core/exception.dart';
import 'package:chekunov_rick_and_morty_client/core/error.dart';
import 'package:chekunov_rick_and_morty_client/features/location/data/location_remote_data_source.dart';
import 'package:chekunov_rick_and_morty_client/features/location/domain/location_repository.dart';
import 'package:chekunov_rick_and_morty_client/features/location/domain/location_entity.dart';

import 'package:dartz/dartz.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationRemoteDataSource remoteDataSource;

  LocationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<AppError, List<LocationEntity>>> getAllLocations() async {
    try {
      final locations = await remoteDataSource.getAllLocations();
      return Right(locations);
    } on ServerException {
      return Left(ServerError());
    }
  }

  @override
  Future<Either<AppError, LocationEntity>> getLocationById(int id) async {
    try {
      final location = await remoteDataSource.getLocationById(id);
      return Right(location);
    } on ServerException {
      return Left(ServerError());
    }
  }

  @override
  Future<Either<AppError, List<LocationEntity>>> getLocationsByPage(
      int page) async {
    try {
      final locations = await remoteDataSource.getLocationsByPage(page);
      return Right(locations);
    } on ServerException {
      return Left(ServerError());
    }
  }
}
