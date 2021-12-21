import 'package:chekunov_rick_and_morty_client/core/error.dart';
import 'package:chekunov_rick_and_morty_client/features/character/data/character_model.dart';
import 'package:chekunov_rick_and_morty_client/features/character/domain/character_repository.dart';
import 'package:chekunov_rick_and_morty_client/features/character/data/character_remote_data_source.dart';

import 'package:dartz/dartz.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterRemoteDataSource remoteDataSource;

  CharacterRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<AppError, List<CharacterModel>>> getCharactersByPage(
      int page) async {
    try {
      final characters = await remoteDataSource.getCharactersByPage(page);
      return Right(characters);
    } on Exception {
      return Left(ServerError());
    }
  }
}
