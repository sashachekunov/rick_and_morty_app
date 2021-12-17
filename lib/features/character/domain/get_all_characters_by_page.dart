import 'package:chekunov_rick_and_morty_client/core/error.dart';
import 'package:chekunov_rick_and_morty_client/core/usecase.dart';
import 'package:chekunov_rick_and_morty_client/core/page_params.dart';
import 'package:chekunov_rick_and_morty_client/features/character/domain/character_entity.dart';
import 'package:chekunov_rick_and_morty_client/features/character/domain/character_repository.dart';

import 'package:dartz/dartz.dart';

class GetAllCharactersByPage
    extends UseCase<List<CharacterEntity>, PageParams> {
  final CharacterRepository _characterRepository;

  GetAllCharactersByPage(this._characterRepository);

  @override
  Future<Either<AppError, List<CharacterEntity>>> call(
      PageParams params) async {
    return await _characterRepository.getAllCharactersByPage(params.page);
  }
}
