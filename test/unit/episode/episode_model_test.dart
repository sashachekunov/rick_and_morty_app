import 'package:chekunov_rick_and_morty_client/features/episode/data/episode_model.dart';
import 'package:test/test.dart';

void main() {
  test('EpisodeModel contructor test', () {
    // Arrange
    var episodeId = 1;
    var episodeName = 'Pilot';
    var episodeAirDate = 'December 2, 2013';
    var episodeCode = 'S01E01';
    var episodeCharacters = [
      'https://rickandmortyapi.com/api/character/1',
      'https://rickandmortyapi.com/api/character/2',
    ];
    var episodeUrl = 'https://rickandmortyapi.com/api/episode/1';
    var episodeCreated = DateTime.parse('2017-11-10T12:56:33.798Z');

    // Act
    var episode = EpisodeModel(
      id: episodeId,
      name: episodeName,
      airDate: episodeAirDate,
      code: episodeCode,
      characters: episodeCharacters,
      url: episodeUrl,
      created: episodeCreated,
    );

    // Assert
    expect(
        episode.id.toString() +
            episode.name +
            episode.airDate +
            episode.code +
            episode.characters.join() +
            episode.url +
            episode.created.toString(),
        episodeId.toString() +
            episodeName +
            episodeAirDate +
            episodeCode +
            episodeCharacters.join() +
            episodeUrl +
            episodeCreated.toString());
  });

  test('EpisodeModel from JSON format contructor test', () {
    // Arrange
    var episodeId = 1;
    var episodeName = 'Pilot';
    var episodeAirDate = 'December 2, 2013';
    var episodeCode = 'S01E01';
    var episodeCharacters = [
      'https://rickandmortyapi.com/api/character/1',
      'https://rickandmortyapi.com/api/character/2',
    ];
    var episodeUrl = 'https://rickandmortyapi.com/api/episode/1';
    var episodeCreated = DateTime.parse('2017-11-10T12:56:33.798Z');

    var json = {
      'id': episodeId,
      'name': episodeName,
      'air_date': episodeAirDate,
      'episode': episodeCode,
      'characters': episodeCharacters,
      'url': episodeUrl,
      'created': episodeCreated.toIso8601String(),
    };

    // Act
    var episode = EpisodeModel.fromJson(json);

    // Assert
    expect(
        episode.id.toString() +
            episode.name +
            episode.airDate +
            episode.code +
            episode.characters.join() +
            episode.url +
            episode.created.toString(),
        episodeId.toString() +
            episodeName +
            episodeAirDate +
            episodeCode +
            episodeCharacters.join() +
            episodeUrl +
            episodeCreated.toString());
  });

  test('EpisodeModel to JSON format test', () {
    // Arrange
    var episodeId = 1;
    var episodeName = 'Pilot';
    var episodeAirDate = 'December 2, 2013';
    var episodeCode = 'S01E01';
    var episodeCharacters = [
      'https://rickandmortyapi.com/api/character/1',
      'https://rickandmortyapi.com/api/character/2',
    ];
    var episodeUrl = 'https://rickandmortyapi.com/api/episode/1';
    var episodeCreated = DateTime.parse('2017-11-10T12:56:33.798Z');

    var episode = EpisodeModel(
      id: episodeId,
      name: episodeName,
      airDate: episodeAirDate,
      code: episodeCode,
      characters: episodeCharacters,
      url: episodeUrl,
      created: episodeCreated,
    );

    // Act
    var res = episode.toJson();

    // Assert
    expect(res, {
      'id': episodeId,
      'name': episodeName,
      'air_date': episodeAirDate,
      'episode': episodeCode,
      'characters': episodeCharacters,
      'url': episodeUrl,
      'created': episodeCreated.toIso8601String(),
    });
  });
}
