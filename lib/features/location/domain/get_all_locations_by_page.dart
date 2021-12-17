import 'package:chekunov_rick_and_morty_client/core/error.dart';
import 'package:chekunov_rick_and_morty_client/core/usecase.dart';
import 'package:chekunov_rick_and_morty_client/core/page_params.dart';
import 'package:chekunov_rick_and_morty_client/features/location/domain/location_entity.dart';
import 'package:chekunov_rick_and_morty_client/features/location/domain/location_repository.dart';

import 'package:dartz/dartz.dart';

class GetAllLocationsByPage extends UseCase<List<LocationEntity>, PageParams> {
  final LocationRepository _locationRepository;

  GetAllLocationsByPage(this._locationRepository);

  @override
  Future<Either<AppError, List<LocationEntity>>> call(PageParams params) async {
    return await _locationRepository.getAllLocationsByPage(params.page);
  }
}
