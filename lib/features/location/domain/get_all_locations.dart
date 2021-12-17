import 'package:chekunov_rick_and_morty_client/core/error.dart';
import 'package:chekunov_rick_and_morty_client/core/usecase.dart';
import 'package:chekunov_rick_and_morty_client/core/no_params.dart';
import 'package:chekunov_rick_and_morty_client/features/location/domain/location_entity.dart';
import 'package:chekunov_rick_and_morty_client/features/location/domain/location_repository.dart';

import 'package:dartz/dartz.dart';

class GetAllLocations extends UseCase<List<LocationEntity>, NoParams> {
  final LocationRepository _locationRepository;

  GetAllLocations(this._locationRepository);

  @override
  Future<Either<AppError, List<LocationEntity>>> call(NoParams params) async {
    return await _locationRepository.getAllLocations();
  }
}
