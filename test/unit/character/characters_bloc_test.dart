import 'package:chekunov_rick_and_morty_client/features/character/data/character_remote_data_source.dart';
import 'package:chekunov_rick_and_morty_client/features/character/data/character_repository_impl.dart';
import 'package:chekunov_rick_and_morty_client/features/character/domain/get_characters_by_page.dart';
import 'package:chekunov_rick_and_morty_client/features/character/presentation/characters_bloc.dart';
import 'package:mockito/annotations.dart';

import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../core/http_client_mock.mocks.dart';
import '../../core/mock_characters_entity.dart';
import '../../core/mock_server_responses.dart';

@GenerateMocks([http.Client])
void main() {
  late http.Client client;
  late CharacterRemoteDataSourceImpl characterRemoteDataSourceImpl;
  late CharacterRepositoryImpl characterRepositoryImpl;
  late GetCharactersByPage getCharactersByPage;
  late CharactersBloc charactersBloc;

  var expectedResult = [
    CharactersState(
      status: CharactersStatus.success,
      characters: [rickModel, mortyModel],
      hasReachedMaxPage: false,
    ),
    CharactersState(
      status: CharactersStatus.success,
      characters: [rickModel, mortyModel, summerModel, bethModel],
      hasReachedMaxPage: false,
    ),
    CharactersState(
      status: CharactersStatus.success,
      characters: [rickModel, mortyModel, summerModel, bethModel, jerryModel],
      hasReachedMaxPage: false,
    ),
    CharactersState(
      status: CharactersStatus.success,
      characters: [rickModel, mortyModel, summerModel, bethModel, jerryModel],
      hasReachedMaxPage: true,
    )
  ];

  setUp(() {
    client = MockClient();
    when(client.get(
        Uri.parse('https://rickandmortyapi.com/api/character/?page=1'),
        headers: {
          'Content-Type': 'application/json',
        })).thenAnswer((_) async => charactersFirstPageResponse);
    when(client.get(
        Uri.parse('https://rickandmortyapi.com/api/character/?page=2'),
        headers: {
          'Content-Type': 'application/json',
        })).thenAnswer((_) async => charactersMiddlePageResponse);
    when(client.get(
        Uri.parse('https://rickandmortyapi.com/api/character/?page=3'),
        headers: {
          'Content-Type': 'application/json',
        })).thenAnswer((_) async => charactersLastPageResponse);
    when(client.get(
        Uri.parse('https://rickandmortyapi.com/api/character/?page=4'),
        headers: {
          'Content-Type': 'application/json',
        })).thenAnswer((_) async => noCharactersPageResponse);

    characterRemoteDataSourceImpl =
        CharacterRemoteDataSourceImpl(client: client);

    characterRepositoryImpl = CharacterRepositoryImpl(
        remoteDataSource: characterRemoteDataSourceImpl);

    getCharactersByPage = GetCharactersByPage(characterRepositoryImpl);

    charactersBloc = CharactersBloc(getCharactersByPage);
  });

  blocTest<CharactersBloc, CharactersState>(
    'CharactersBloc initial test',
    build: () => charactersBloc,
    act: (bloc) {
      bloc.add(const LoadCharacters());
    },
    expect: () => [expectedResult[0]],
  );

  blocTest<CharactersBloc, CharactersState>(
    'CharactersBloc load pages two times test',
    build: () => charactersBloc,
    act: (bloc) {
      bloc.add(const LoadCharacters());
      bloc.add(const LoadCharacters());
    },
    expect: () => [expectedResult[0], expectedResult[1]],
  );

  blocTest<CharactersBloc, CharactersState>(
    'CharactersBloc load last page test',
    build: () => charactersBloc,
    act: (bloc) {
      bloc.add(const LoadCharacters());
      bloc.add(const LoadCharacters());
      bloc.add(const LoadCharacters());
    },
    expect: () => [expectedResult[0], expectedResult[1], expectedResult[2]],
  );

  blocTest<CharactersBloc, CharactersState>(
    'CharactersBloc page limit test',
    build: () => charactersBloc,
    act: (bloc) {
      bloc.add(const LoadCharacters());
      bloc.add(const LoadCharacters());
      bloc.add(const LoadCharacters());
      bloc.add(const LoadCharacters());
    },
    expect: () => expectedResult,
  );
}
