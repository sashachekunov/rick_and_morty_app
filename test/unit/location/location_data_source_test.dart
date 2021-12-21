import 'package:chekunov_rick_and_morty_client/features/location/data/location_remote_data_source.dart';

import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../core/http_client_mock.mocks.dart';

@GenerateMocks([http.Client])
void main() {
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
