import 'package:chekunov_rick_and_morty_client/core/error.dart';
import 'package:chekunov_rick_and_morty_client/core/id_params.dart';
import 'package:chekunov_rick_and_morty_client/core/no_params.dart';
import 'package:chekunov_rick_and_morty_client/core/page_params.dart';
import 'package:chekunov_rick_and_morty_client/features/character/domain/character_entity.dart';
import 'package:chekunov_rick_and_morty_client/features/character/domain/character_repository.dart';
import 'package:chekunov_rick_and_morty_client/features/character/domain/get_all_characters.dart';
import 'package:chekunov_rick_and_morty_client/features/character/domain/get_character_by_id.dart';
import 'package:chekunov_rick_and_morty_client/features/character/domain/get_characters_by_page.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../core/character_inst.dart';
import '../../core/test_error_impl.dart';

class CharacterRepositoryImplTest extends CharacterRepository {
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

Future<void> main() async {
  test('GetAllCharacters test', () async {
    // Arrange
    var characterRepository = CharacterRepositoryImplTest();

    // Act
    var res = await GetAllCharacters(characterRepository).call(NoParams());

    // Assert
    expect(res.fold((l) => l, (r) => r), [rick, morty]);
  });

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

  test('GetCharacterById Error test', () async {
    // Arrange
    var characterRepository = CharacterRepositoryImplTest();

    // Act
    var res =
        await GetCharacterById(characterRepository).call(const IdParams(10));

    // Assert
    expect(res.fold((l) => l, (r) => r), TestError());
  });

  test('GetCharacterById test', () async {
    // Arrange
    var characterRepository = CharacterRepositoryImplTest();

    // Act
    var res =
        await GetCharacterById(characterRepository).call(const IdParams(1));

    // Assert
    expect(res.fold((l) => l, (r) => r), rick);
  });
}
