import 'package:chekunov_rick_and_morty_client/features/location/data/location_remote_data_source.dart';

import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../core/http_client_mock.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  test('LocationDataSource get all locations test', () async {
    // Arrange
    final client = MockClient();
    when(client
        .get(Uri.parse('https://rickandmortyapi.com/api/location/'), headers: {
      'Content-Type': 'application/json',
    })).thenAnswer((_) async => http.Response(
        '{"info":{"count":126,"pages":7,"next":"https://rickandmortyapi.com/api/location/?page=2","prev":null}, "results": [1, 2, 3]}',
        200));

    when(client.get(
        Uri.parse(
            'https://rickandmortyapi.com/api/location/1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126'),
        headers: {
          'Content-Type': 'application/json',
        })).thenAnswer((_) async => http.Response(
        '[{"id":1,"name":"Earth (C-137)","type":"Planet","dimension":"Dimension C-137","residents":["https://rickandmortyapi.com/api/character/38","https://rickandmortyapi.com/api/character/45"],"url":"https://rickandmortyapi.com/api/location/1","created":"2017-11-10T12:42:04.162Z"},{"id":2,"name":"Abadango","type":"Cluster","dimension":"unknown","residents":["https://rickandmortyapi.com/api/character/6"],"url":"https://rickandmortyapi.com/api/location/2","created":"2017-11-10T13:06:38.182Z"}]',
        200));

    // Act
    var locationRemoteDataSource = LocationRemoteDataSourceImpl(
      client: client,
    );
    var episodes = await locationRemoteDataSource.getAllLocations();

    // Assert
    expect([
      episodes[0].toJson(),
      episodes[1].toJson()
    ], [
      {
        'id': 1,
        'name': 'Earth (C-137)',
        'type': 'Planet',
        'dimension': 'Dimension C-137',
        'residents': [
          'https://rickandmortyapi.com/api/character/38',
          'https://rickandmortyapi.com/api/character/45'
        ],
        'url': 'https://rickandmortyapi.com/api/location/1',
        'created': '2017-11-10T12:42:04.162Z'
      },
      {
        'id': 2,
        'name': 'Abadango',
        'type': 'Cluster',
        'dimension': 'unknown',
        'residents': ['https://rickandmortyapi.com/api/character/6'],
        'url': 'https://rickandmortyapi.com/api/location/2',
        'created': '2017-11-10T13:06:38.182Z'
      }
    ]);
  });

  test('LocationDataSource get single location test', () async {
    // Arrange
    final client = MockClient();
    when(client
        .get(Uri.parse('https://rickandmortyapi.com/api/location/1'), headers: {
      'Content-Type': 'application/json',
    })).thenAnswer((_) async => http.Response(
        '{"id":1,"name":"Earth (C-137)","type":"Planet","dimension":"Dimension C-137","residents":["https://rickandmortyapi.com/api/character/38","https://rickandmortyapi.com/api/character/45"],"url":"https://rickandmortyapi.com/api/location/1","created":"2017-11-10T12:42:04.162Z"}',
        200));

    // Act
    var locationRemoteDataSource = LocationRemoteDataSourceImpl(
      client: client,
    );
    var character = await locationRemoteDataSource.getLocationById(1);

    // Assert
    expect(character.toJson(), {
      'id': 1,
      'name': 'Earth (C-137)',
      'type': 'Planet',
      'dimension': 'Dimension C-137',
      'residents': [
        'https://rickandmortyapi.com/api/character/38',
        'https://rickandmortyapi.com/api/character/45'
      ],
      'url': 'https://rickandmortyapi.com/api/location/1',
      'created': '2017-11-10T12:42:04.162Z'
    });
  });

  test('LocationDataSource get locations by page test', () async {
    // Arrange
    final client = MockClient();
    when(client.get(
        Uri.parse('https://rickandmortyapi.com/api/location/?page=1'),
        headers: {
          'Content-Type': 'application/json',
        })).thenAnswer((_) async => http.Response(
        '{"info":{"count":126,"pages":7,"next":"https://rickandmortyapi.com/api/location/?page=2","prev":null},"results":[{"id":1,"name":"Earth (C-137)","type":"Planet","dimension":"Dimension C-137","residents":["https://rickandmortyapi.com/api/character/38","https://rickandmortyapi.com/api/character/45"],"url":"https://rickandmortyapi.com/api/location/1","created":"2017-11-10T12:42:04.162Z"},{"id":2,"name":"Abadango","type":"Cluster","dimension":"unknown","residents":["https://rickandmortyapi.com/api/character/6"],"url":"https://rickandmortyapi.com/api/location/2","created":"2017-11-10T13:06:38.182Z"}]}',
        200));

    // Act
    var locationRemoteDataSource = LocationRemoteDataSourceImpl(
      client: client,
    );
    var episodes = await locationRemoteDataSource.getLocationsByPage(1);

    // Assert
    expect([
      episodes[0].toJson(),
      episodes[1].toJson()
    ], [
      {
        'id': 1,
        'name': 'Earth (C-137)',
        'type': 'Planet',
        'dimension': 'Dimension C-137',
        'residents': [
          'https://rickandmortyapi.com/api/character/38',
          'https://rickandmortyapi.com/api/character/45'
        ],
        'url': 'https://rickandmortyapi.com/api/location/1',
        'created': '2017-11-10T12:42:04.162Z'
      },
      {
        'id': 2,
        'name': 'Abadango',
        'type': 'Cluster',
        'dimension': 'unknown',
        'residents': ['https://rickandmortyapi.com/api/character/6'],
        'url': 'https://rickandmortyapi.com/api/location/2',
        'created': '2017-11-10T13:06:38.182Z'
      }
    ]);
  });
}
