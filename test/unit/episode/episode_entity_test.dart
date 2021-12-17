import 'package:chekunov_rick_and_morty_client/features/episode/domain/episode_entity.dart';

import 'package:test/test.dart';

void main() {
  test('Episode entity contructor test', () {
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
    var episode = EpisodeEntity(
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
}
