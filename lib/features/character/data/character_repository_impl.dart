import 'package:chekunov_rick_and_morty_client/core/exception.dart';
import 'package:chekunov_rick_and_morty_client/features/character/data/character_model.dart';
import 'package:chekunov_rick_and_morty_client/features/character/data/character_remote_data_source.dart';
import 'package:chekunov_rick_and_morty_client/core/error.dart';
import 'package:chekunov_rick_and_morty_client/features/character/domain/character_repository.dart';
import 'package:dartz/dartz.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterRemoteDataSource remoteDataSource;

  CharacterRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<AppError, List<CharacterModel>>> getAllCharacters() async {
    try {
      final characters = await remoteDataSource.getAllCharacters();
      return Right(characters);
    } on ServerException {
      return Left(ServerError());
    }
  }

  @override
  Future<Either<AppError, CharacterModel>> getCharacterById(int id) async {
    try {
      final character = await remoteDataSource.getCharacterById(id);
      return Right(character);
    } on ServerException {
      return Left(ServerError());
    }
  }

  @override
  Future<Either<AppError, List<CharacterModel>>> getCharactersByPage(
      int page) async {
    try {
      final characters = await remoteDataSource.getCharactersByPage(page);
      return Right(characters);
    } on ServerException {
      return Left(ServerError());
    }
  }
}
