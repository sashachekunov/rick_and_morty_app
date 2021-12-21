import 'package:chekunov_rick_and_morty_client/features/character/data/character_model.dart';
import 'package:chekunov_rick_and_morty_client/features/character/data/character_remote_data_source.dart';
import 'package:chekunov_rick_and_morty_client/features/character/data/character_repository_impl.dart';

import 'package:test/test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import '../../core/http_client_mock.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  test('CharacterRepositoryImpl getCharactersByPage test', () async {
    // Arrange
    final client = MockClient();
    when(client.get(
        Uri.parse('https://rickandmortyapi.com/api/character/?page=1'),
        headers: {
          'Content-Type': 'application/json',
        })).thenAnswer((_) async => http.Response(
        '{"info":{"count":826,"pages":42,"next":"https://rickandmortyapi.com/api/character/?page=2","prev":null}, "results": [{"id":1,"name":"Rick Sanchez","status":"Alive","species":"Human","type":"","gender":"Male","origin":{"name":"Earth (C-137)","url":"https://rickandmortyapi.com/api/location/1"},"location":{"name":"Citadel of Ricks","url":"https://rickandmortyapi.com/api/location/3"},"image":"https://rickandmortyapi.com/api/character/avatar/1.jpeg","episode":["https://rickandmortyapi.com/api/episode/1","https://rickandmortyapi.com/api/episode/2"],"url":"https://rickandmortyapi.com/api/character/1","created":"2017-11-04T18:48:46.250Z"},{"id":2,"name":"Morty Smith","status":"Alive","species":"Human","type":"","gender":"Male","origin":{"name":"unknown","url":""},"location":{"name":"Citadel of Ricks","url":"https://rickandmortyapi.com/api/location/3"},"image":"https://rickandmortyapi.com/api/character/avatar/2.jpeg","episode":["https://rickandmortyapi.com/api/episode/1","https://rickandmortyapi.com/api/episode/2"],"url":"https://rickandmortyapi.com/api/character/2","created":"2017-11-04T18:50:21.651Z"}]}',
        200));

    var characterRemoteDataSource =
        CharacterRemoteDataSourceImpl(client: client);
    var characterRepositoryImpl =
        CharacterRepositoryImpl(remoteDataSource: characterRemoteDataSource);

    // Act
    var res = await characterRepositoryImpl.getCharactersByPage(1);

    // Assert
    expect(res.fold((l) => l, (r) => r), [
      CharacterModel.fromJson(const {
        'id': 1,
        'name': 'Rick Sanchez',
        'status': 'Alive',
        'species': 'Human',
        'type': '',
        'gender': 'Male',
        'origin': {
          'name': 'Earth (C-137)',
          'url': 'https://rickandmortyapi.com/api/location/1'
        },
        'location': {
          'name': 'Citadel of Ricks',
          'url': 'https://rickandmortyapi.com/api/location/3'
        },
        'image': 'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
        'episode': [
          'https://rickandmortyapi.com/api/episode/1',
          'https://rickandmortyapi.com/api/episode/2'
        ],
        'url': 'https://rickandmortyapi.com/api/character/1',
        'created': '2017-11-04T18:48:46.250Z',
      }),
      CharacterModel.fromJson(
        const {
          "id": 2,
          "name": "Morty Smith",
          "status": "Alive",
          "species": "Human",
          "type": "",
          "gender": "Male",
          "origin": {"name": "unknown", "url": ""},
          "location": {
            "name": "Citadel of Ricks",
            "url": "https://rickandmortyapi.com/api/location/3"
          },
          "image": "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
          "episode": [
            "https://rickandmortyapi.com/api/episode/1",
            "https://rickandmortyapi.com/api/episode/2"
          ],
          "url": "https://rickandmortyapi.com/api/character/2",
          "created": "2017-11-04T18:50:21.651Z"
        },
      )
    ]);
  });
}
