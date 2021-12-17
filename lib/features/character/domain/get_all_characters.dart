import 'package:chekunov_rick_and_morty_client/core/error.dart';
import 'package:chekunov_rick_and_morty_client/core/usecase.dart';
import 'package:chekunov_rick_and_morty_client/core/no_params.dart';
import 'package:chekunov_rick_and_morty_client/features/character/domain/character_entity.dart';
import 'package:chekunov_rick_and_morty_client/features/character/domain/character_repository.dart';

import 'package:dartz/dartz.dart';

class GetAllCharacters extends UseCase<List<CharacterEntity>, NoParams> {
  final CharacterRepository _characterRepository;

  GetAllCharacters(this._characterRepository);

  @override
  Future<Either<AppError, List<CharacterEntity>>> call(NoParams params) async {
    return await _characterRepository.getAllCharacters();
  }
}
