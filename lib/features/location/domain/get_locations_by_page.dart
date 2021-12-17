import 'package:chekunov_rick_and_morty_client/core/error.dart';
import 'package:chekunov_rick_and_morty_client/core/usecase.dart';
import 'package:chekunov_rick_and_morty_client/core/page_params.dart';
import 'package:chekunov_rick_and_morty_client/features/location/domain/location_entity.dart';
import 'package:chekunov_rick_and_morty_client/features/location/domain/location_repository.dart';

import 'package:dartz/dartz.dart';

class GetLocationsByPage extends UseCase<List<LocationEntity>, PageParams> {
  final LocationRepository _locationRepository;

  GetLocationsByPage(this._locationRepository);

  @override
  Future<Either<AppError, List<LocationEntity>>> call(PageParams params) async {
    return await _locationRepository.getLocationsByPage(params.page);
  }
}
