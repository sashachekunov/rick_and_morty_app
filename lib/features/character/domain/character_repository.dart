import 'package:chekunov_rick_and_morty_client/core/error.dart';
import 'package:chekunov_rick_and_morty_client/features/character/domain/character_entity.dart';

import 'package:dartz/dartz.dart';

abstract class CharacterRepository {
  Future<Either<AppError, CharacterEntity>> getCharacterById(int id);
  Future<Either<AppError, List<CharacterEntity>>> getAllCharacters();
  Future<Either<AppError, List<CharacterEntity>>> getAllCharactersByPage(
      int page);
}
