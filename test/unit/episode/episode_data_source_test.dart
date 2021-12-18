import 'package:chekunov_rick_and_morty_client/features/episode/data/episode_remote_data_source.dart';

import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../core/http_client_mock.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  test('EpisodeDataSource get all episodes test', () async {
    // Arrange
    final client = MockClient();
    when(client
        .get(Uri.parse('https://rickandmortyapi.com/api/episode/'), headers: {
      'Content-Type': 'application/json',
    })).thenAnswer((_) async => http.Response(
        '{"info":{"count":51,"pages":3,"next":"https://rickandmortyapi.com/api/episode/?page=2","prev":null}, "results": [1, 2, 3]}',
        200));

    when(client.get(
        Uri.parse(
            'https://rickandmortyapi.com/api/episode/1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51'),
        headers: {
          'Content-Type': 'application/json',
        })).thenAnswer((_) async => http.Response(
        '[{"id":1,"name":"Pilot","air_date":"December 2, 2013","episode":"S01E01","characters":["https://rickandmortyapi.com/api/character/1","https://rickandmortyapi.com/api/character/2"],"url":"https://rickandmortyapi.com/api/episode/1","created":"2017-11-10T12:56:33.798Z"},{"id":2,"name":"Lawnmower Dog","air_date":"December 9, 2013","episode":"S01E02","characters":["https://rickandmortyapi.com/api/character/1","https://rickandmortyapi.com/api/character/2"],"url":"https://rickandmortyapi.com/api/episode/2","created":"2017-11-10T12:56:33.916Z"}]',
        200));

    // Act
    var episodeRemoteDataSource = EpisodeRemoteDataSourceImpl(
      client: client,
    );
    var episodes = await episodeRemoteDataSource.getAllEpisodes();

    // Assert
    expect([
      episodes[0].toJson(),
      episodes[1].toJson()
    ], [
      {
        'id': 1,
        'name': 'Pilot',
        'air_date': 'December 2, 2013',
        'episode': 'S01E01',
        'characters': [
          'https://rickandmortyapi.com/api/character/1',
          'https://rickandmortyapi.com/api/character/2'
        ],
        'url': 'https://rickandmortyapi.com/api/episode/1',
        'created': '2017-11-10T12:56:33.798Z'
      },
      {
        'id': 2,
        'name': 'Lawnmower Dog',
        'air_date': 'December 9, 2013',
        'episode': 'S01E02',
        'characters': [
          'https://rickandmortyapi.com/api/character/1',
          'https://rickandmortyapi.com/api/character/2'
        ],
        'url': 'https://rickandmortyapi.com/api/episode/2',
        'created': '2017-11-10T12:56:33.916Z'
      }
    ]);
  });

  test('EpisodeDataSource get single episode test', () async {
    // Arrange
    final client = MockClient();
    when(client
        .get(Uri.parse('https://rickandmortyapi.com/api/episode/1'), headers: {
      'Content-Type': 'application/json',
    })).thenAnswer((_) async => http.Response(
        '{"id":1,"name":"Pilot","air_date":"December 2, 2013","episode":"S01E01","characters":["https://rickandmortyapi.com/api/character/1","https://rickandmortyapi.com/api/character/2"],"url":"https://rickandmortyapi.com/api/episode/1","created":"2017-11-10T12:56:33.798Z"}',
        200));

    // Act
    var episodeRemoteDataSource = EpisodeRemoteDataSourceImpl(
      client: client,
    );
    var character = await episodeRemoteDataSource.getEpisodeById(1);

    // Assert
    expect(character.toJson(), {
      'id': 1,
      'name': 'Pilot',
      'air_date': 'December 2, 2013',
      'episode': 'S01E01',
      'characters': [
        'https://rickandmortyapi.com/api/character/1',
        'https://rickandmortyapi.com/api/character/2'
      ],
      'url': 'https://rickandmortyapi.com/api/episode/1',
      'created': '2017-11-10T12:56:33.798Z'
    });
  });

  test('EpisodeDataSource get episodes by page test', () async {
    // Arrange
    final client = MockClient();
    when(client.get(
        Uri.parse('https://rickandmortyapi.com/api/episode/?page=1'),
        headers: {
          'Content-Type': 'application/json',
        })).thenAnswer((_) async => http.Response(
        '{"info":{"count":51,"pages":3,"next":"https://rickandmortyapi.com/api/episode/?page=2","prev":null},"results":[{"id":1,"name":"Pilot","air_date":"December 2, 2013","episode":"S01E01","characters":["https://rickandmortyapi.com/api/character/1","https://rickandmortyapi.com/api/character/2"],"url":"https://rickandmortyapi.com/api/episode/1","created":"2017-11-10T12:56:33.798Z"},{"id":2,"name":"Lawnmower Dog","air_date":"December 9, 2013","episode":"S01E02","characters":["https://rickandmortyapi.com/api/character/1","https://rickandmortyapi.com/api/character/2"],"url":"https://rickandmortyapi.com/api/episode/2","created":"2017-11-10T12:56:33.916Z"}]}',
        200));

    // Act
    var episodeRemoteDataSource = EpisodeRemoteDataSourceImpl(
      client: client,
    );
    var episodes = await episodeRemoteDataSource.getEpisodesByPage(1);

    // Assert
    expect([
      episodes[0].toJson(),
      episodes[1].toJson()
    ], [
      {
        'id': 1,
        'name': 'Pilot',
        'air_date': 'December 2, 2013',
        'episode': 'S01E01',
        'characters': [
          'https://rickandmortyapi.com/api/character/1',
          'https://rickandmortyapi.com/api/character/2'
        ],
        'url': 'https://rickandmortyapi.com/api/episode/1',
        'created': '2017-11-10T12:56:33.798Z'
      },
      {
        'id': 2,
        'name': 'Lawnmower Dog',
        'air_date': 'December 9, 2013',
        'episode': 'S01E02',
        'characters': [
          'https://rickandmortyapi.com/api/character/1',
          'https://rickandmortyapi.com/api/character/2'
        ],
        'url': 'https://rickandmortyapi.com/api/episode/2',
        'created': '2017-11-10T12:56:33.916Z'
      }
    ]);
  });
}
