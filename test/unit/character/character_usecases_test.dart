import 'package:chekunov_rick_and_morty_client/core/error.dart';
import 'package:chekunov_rick_and_morty_client/core/page_params.dart';
import 'package:chekunov_rick_and_morty_client/features/character/domain/character_entity.dart';
import 'package:chekunov_rick_and_morty_client/features/character/domain/character_repository.dart';
import 'package:chekunov_rick_and_morty_client/features/character/domain/get_characters_by_page.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../core/mock_characters_entity.dart';
import '../../core/test_error_impl.dart';

class CharacterRepositoryImplTest implements CharacterRepository {
  @override
  Future<Either<AppError, List<CharacterEntity>>> getAllCharacters() async {
    return Right([rick, morty]);
  }

  @override
  Future<Either<AppError, List<CharacterEntity>>> getCharactersByPage(
      int page) async {
    if (page > 0 && page < 43) {
      return Right([rick, morty]);
    } else {
      return Left(TestError());
    }
  }

  @override
  Future<Either<AppError, CharacterEntity>> getCharacterById(int id) async {
    if (id == 1) {
      return Right(rick);
    } else if (id == 2) {
      return Right(morty);
    } else {
      return Left(TestError());
    }
  }
}

void main() {
  test('GetCharactersByPage Error test', () async {
    // Arrange
    var characterRepository = CharacterRepositoryImplTest();

    // Act
    var res = await GetCharactersByPage(characterRepository)
        .call(const PageParams(1000));

    // Assert
    expect(res.fold((l) => l, (r) => r), TestError());
  });

  test('GetCharactersByPage test', () async {
    // Arrange
    var characterRepository = CharacterRepositoryImplTest();

    // Act
    var res = await GetCharactersByPage(characterRepository)
        .call(const PageParams(1));

    // Assert
    expect(res.fold((l) => l, (r) => r), [rick, morty]);
  });
}
