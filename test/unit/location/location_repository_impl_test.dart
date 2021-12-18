import 'package:chekunov_rick_and_morty_client/core/error.dart';
import 'package:chekunov_rick_and_morty_client/features/location/data/location_model.dart';
import 'package:chekunov_rick_and_morty_client/features/location/data/location_remote_data_source.dart';
import 'package:chekunov_rick_and_morty_client/features/location/data/location_repository_impl.dart';

import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../core/http_client_mock.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  test('LocationRepositoryImpl getLocationById test', () async {
    // Arrange
    final client = MockClient();
    when(client
        .get(Uri.parse('https://rickandmortyapi.com/api/location/1'), headers: {
      'Content-Type': 'application/json',
    })).thenAnswer((_) async => http.Response(
        '{"id":1,"name":"Earth (C-137)","type":"Planet","dimension":"Dimension C-137","residents":["https://rickandmortyapi.com/api/character/38","https://rickandmortyapi.com/api/character/45"],"url":"https://rickandmortyapi.com/api/location/1","created":"2017-11-10T12:42:04.162Z"}',
        200));

    var locationRemoteDataSource = LocationRemoteDataSourceImpl(client: client);
    var locationRepositoryImpl =
        LocationRepositoryImpl(remoteDataSource: locationRemoteDataSource);

    // Act
    var res = await locationRepositoryImpl.getLocationById(1);

    // Assert
    expect(
        res.fold((l) => l, (r) => r),
        LocationModel.fromJson(
          const {
            "id": 1,
            "name": "Earth (C-137)",
            "type": "Planet",
            "dimension": "Dimension C-137",
            "residents": [
              "https://rickandmortyapi.com/api/character/38",
              "https://rickandmortyapi.com/api/character/45"
            ],
            "url": "https://rickandmortyapi.com/api/location/1",
            "created": "2017-11-10T12:42:04.162Z",
          },
        ));
  });

  test('LocationRepositoryImpl getLocationById ServerError test', () async {
    // Arrange
    final client = MockClient();
    when(client.get(Uri.parse('https://rickandmortyapi.com/api/location/1000'),
        headers: {
          'Content-Type': 'application/json',
        })).thenAnswer((_) async => http.Response('"error":"404"', 404));

    var locationRemoteDataSource = LocationRemoteDataSourceImpl(client: client);
    var locationRepositoryImpl =
        LocationRepositoryImpl(remoteDataSource: locationRemoteDataSource);

    // Act
    var res = await locationRepositoryImpl.getLocationById(1000);

    // Assert
    expect(res.fold((l) => l, (r) => r), ServerError());
  });

  test('LocationRepositoryImpl getAllLocations test', () async {
    // Arrange
    final client = MockClient();
    when(client
        .get(Uri.parse('https://rickandmortyapi.com/api/location/'), headers: {
      'Content-Type': 'application/json',
    })).thenAnswer((_) async => http.Response(
        '{"info":{"count":51,"pages":3,"next":"https://rickandmortyapi.com/api/location/?page=2","prev":null}, "results": [1, 2, 3]}',
        200));

    when(client.get(
        Uri.parse(
            'https://rickandmortyapi.com/api/location/1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51'),
        headers: {
          'Content-Type': 'application/json',
        })).thenAnswer((_) async => http.Response(
        '[{"id":1,"name":"Earth (C-137)","type":"Planet","dimension":"Dimension C-137","residents":["https://rickandmortyapi.com/api/character/38","https://rickandmortyapi.com/api/character/45"],"url":"https://rickandmortyapi.com/api/location/1","created":"2017-11-10T12:42:04.162Z"},{"id":2,"name":"Abadango","type":"Cluster","dimension":"unknown","residents":["https://rickandmortyapi.com/api/character/6"],"url":"https://rickandmortyapi.com/api/location/2","created":"2017-11-10T13:06:38.182Z"}]',
        200));

    var locationRemoteDataSource = LocationRemoteDataSourceImpl(client: client);
    var locationRepositoryImpl =
        LocationRepositoryImpl(remoteDataSource: locationRemoteDataSource);

    // Act
    var res = await locationRepositoryImpl.getAllLocations();

    // Assert
    expect(res.fold((l) => l, (r) => r), [
      LocationModel.fromJson(
        const {
          'id': 1,
          'name': 'Earth (C-137)',
          'type': 'Planet',
          'dimension': 'Dimension C-137',
          'residents': [
            'https://rickandmortyapi.com/api/character/38',
            'https://rickandmortyapi.com/api/character/45'
          ],
          'url': 'https://rickandmortyapi.com/api/location/1',
          'created': '2017-11-10T12:42:04.162Z',
        },
      ),
      LocationModel.fromJson(
        const {
          'id': 2,
          'name': 'Abadango',
          'type': 'Cluster',
          'dimension': 'unknown',
          'residents': ['https://rickandmortyapi.com/api/character/6'],
          'url': 'https://rickandmortyapi.com/api/location/2',
          'created': '2017-11-10T13:06:38.182Z',
        },
      ),
    ]);
  });

  test('LocationRepositoryImpl getAllLocations ServerError test', () async {
    // Arrange
    final client = MockClient();
    when(client
        .get(Uri.parse('https://rickandmortyapi.com/api/location/'), headers: {
      'Content-Type': 'application/json',
    })).thenAnswer((_) async => http.Response(
        '{"info":{"count":51,"pages":3,"next":"https://rickandmortyapi.com/api/location/?page=2","prev":null}, "results": [1, 2, 3]}',
        200));

    when(client.get(
        Uri.parse(
            'https://rickandmortyapi.com/api/location/1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51'),
        headers: {
          'Content-Type': 'application/json',
        })).thenAnswer((_) async => http.Response('"error": "404"', 404));

    var locationRemoteDataSource = LocationRemoteDataSourceImpl(client: client);
    var locationRepositoryImpl =
        LocationRepositoryImpl(remoteDataSource: locationRemoteDataSource);

    // Act
    var res = await locationRepositoryImpl.getAllLocations();

    // Assert
    expect(res.fold((l) => l, (r) => r), ServerError());
  });

  test('LocationRepositoryImpl getLocationsByPage test', () async {
    // Arrange
    final client = MockClient();
    when(client.get(
        Uri.parse('https://rickandmortyapi.com/api/location/?page=1'),
        headers: {
          'Content-Type': 'application/json',
        })).thenAnswer((_) async => http.Response(
        '{"info":{"count":51,"pages":3,"next":"https://rickandmortyapi.com/api/location/?page=2","prev":null},"results":[{"id":1,"name":"Earth (C-137)","type":"Planet","dimension":"Dimension C-137","residents":["https://rickandmortyapi.com/api/character/38","https://rickandmortyapi.com/api/character/45"],"url":"https://rickandmortyapi.com/api/location/1","created":"2017-11-10T12:42:04.162Z"},{"id":2,"name":"Abadango","type":"Cluster","dimension":"unknown","residents":["https://rickandmortyapi.com/api/character/6"],"url":"https://rickandmortyapi.com/api/location/2","created":"2017-11-10T13:06:38.182Z"}]}',
        200));

    var locationRemoteDataSource = LocationRemoteDataSourceImpl(client: client);
    var locationRepositoryImpl =
        LocationRepositoryImpl(remoteDataSource: locationRemoteDataSource);

    // Act
    var res = await locationRepositoryImpl.getLocationsByPage(1);

    // Assert
    expect(res.fold((l) => l, (r) => r), [
      LocationModel.fromJson(
        const {
          'id': 1,
          'name': 'Earth (C-137)',
          'type': 'Planet',
          'dimension': 'Dimension C-137',
          'residents': [
            'https://rickandmortyapi.com/api/character/38',
            'https://rickandmortyapi.com/api/character/45'
          ],
          'url': 'https://rickandmortyapi.com/api/location/1',
          'created': '2017-11-10T12:42:04.162Z',
        },
      ),
      LocationModel.fromJson(
        const {
          'id': 2,
          'name': 'Abadango',
          'type': 'Cluster',
          'dimension': 'unknown',
          'residents': ['https://rickandmortyapi.com/api/character/6'],
          'url': 'https://rickandmortyapi.com/api/location/2',
          'created': '2017-11-10T13:06:38.182Z',
        },
      ),
    ]);
  });

  test('LocationRepositoryImpl getLocationsByPage ServerError test', () async {
    // Arrange
    final client = MockClient();
    when(client.get(
        Uri.parse('https://rickandmortyapi.com/api/location/?page=1000'),
        headers: {
          'Content-Type': 'application/json',
        })).thenAnswer((_) async => http.Response('"error": "404"', 404));

    var locationRemoteDataSource = LocationRemoteDataSourceImpl(client: client);
    var locationRepositoryImpl =
        LocationRepositoryImpl(remoteDataSource: locationRemoteDataSource);

    // Act
    var res = await locationRepositoryImpl.getLocationsByPage(1000);

    // Assert
    expect(res.fold((l) => l, (r) => r), ServerError());
  });
}
