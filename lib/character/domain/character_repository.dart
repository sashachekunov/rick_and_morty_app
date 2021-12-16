import 'package:chekunov_rick_and_morty_client/character/domain/character_entity.dart';
import 'package:chekunov_rick_and_morty_client/_core/error.dart';
import 'package:dartz/dartz.dart';

abstract class CharacterRepository {
  Future<Either<AppError, CharacterEntity>> getCharacterById(int id);
  Future<Either<AppError, List<CharacterEntity>>> getAllCharacters();
}
