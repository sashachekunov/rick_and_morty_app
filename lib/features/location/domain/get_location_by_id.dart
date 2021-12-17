import 'package:chekunov_rick_and_morty_client/core/error.dart';
import 'package:chekunov_rick_and_morty_client/core/usecase.dart';
import 'package:chekunov_rick_and_morty_client/core/id_params.dart';
import 'package:chekunov_rick_and_morty_client/features/location/domain/location_entity.dart';
import 'package:chekunov_rick_and_morty_client/features/location/domain/location_repository.dart';

import 'package:dartz/dartz.dart';

class GetLocationById extends UseCase<LocationEntity, IdParams> {
  final LocationRepository _locationRepository;

  GetLocationById(this._locationRepository);

  @override
  Future<Either<AppError, LocationEntity>> call(IdParams params) async {
    return await _locationRepository.getLocationById(params.id);
  }
}
