import 'package:chekunov_rick_and_morty_client/core/error.dart';
import 'package:chekunov_rick_and_morty_client/core/usecase.dart';
import 'package:chekunov_rick_and_morty_client/core/id_params.dart';
import 'package:chekunov_rick_and_morty_client/features/character/domain/character_entity.dart';
import 'package:chekunov_rick_and_morty_client/features/character/domain/character_repository.dart';

import 'package:dartz/dartz.dart';

class GetCharacterById extends UseCase<CharacterEntity, IdParams> {
  final CharacterRepository _characterRepository;

  GetCharacterById(this._characterRepository);

  @override
  Future<Either<AppError, CharacterEntity>> call(IdParams params) async {
    return await _characterRepository.getCharacterById(params.id);
  }
}
