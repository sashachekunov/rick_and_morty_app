import 'package:chekunov_rick_and_morty_client/features/character/domain/character_entity.dart';
import 'package:chekunov_rick_and_morty_client/features/episode/domain/episode_entity.dart';
import 'package:chekunov_rick_and_morty_client/features/location/domain/location_entity.dart';
import 'package:test/test.dart';

void main() {
  group('Character entity test', () {
    test('Location contructor test', () {
      // Arrange
      var locationName = 'Citadel of Ricks';
      var locationUrl = 'https://rickandmortyapi.com/api/location/3';

      // Act
      var location = Location(name: locationName, url: locationUrl);

      // Assert
      expect(location.name + location.url, locationName + locationUrl);
    });

    test('Character entity contructor test', () {
      // Arrange
      var characterId = 2;
      var characterName = 'Morty Smith';
      var characterStatus = 'Alive';
      var characterSpecies = 'Human';
      var characterType = '';
      var characterGender = 'Male';
      var characterOrigin = const Location(
        name: 'unknown',
        url: '',
      );
      var characterLocation = const Location(
        name: 'Citadel of Ricks',
        url: 'https://rickandmortyapi.com/api/location/3',
      );
      var characterImage =
          'https://rickandmortyapi.com/api/character/avatar/2.jpeg';
      var characterEpisode = [
        'https://rickandmortyapi.com/api/episode/1',
        'https://rickandmortyapi.com/api/episode/2',
      ];
      var characterUrl =
          'https://rickandmortyapi.com/api/character/avatar/2.jpeg';
      var characterCreated = DateTime.parse('2017-11-04T18:50:21.651Z');

      // Act
      var character = CharacterEntity(
        id: characterId,
        name: characterName,
        status: characterStatus,
        species: characterSpecies,
        type: characterType,
        gender: characterGender,
        origin: characterOrigin,
        location: characterLocation,
        image: characterImage,
        episode: characterEpisode,
        url: characterUrl,
        created: characterCreated,
      );

      // Assert
      expect(
        character.id.toString() +
            character.name +
            character.status +
            character.species +
            character.type +
            character.gender +
            character.origin.name +
            character.origin.url +
            character.location.name +
            character.location.url +
            character.image +
            character.episode.join() +
            character.url +
            character.created.toString(),
        characterId.toString() +
            characterName +
            characterStatus +
            characterSpecies +
            characterType +
            characterGender +
            characterOrigin.name +
            characterOrigin.url +
            characterLocation.name +
            characterLocation.url +
            characterImage +
            characterEpisode.join() +
            characterUrl +
            characterCreated.toString(),
      );
    });
  });

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

  test('Location entity contructor test', () {
    // Arrange
    var locationId = 1;
    var locationName = 'Earth (C-137)';
    var locationType = 'Planet';
    var locationDimension = 'Dimension C-137';
    var locationResidents = [
      'https://rickandmortyapi.com/api/character/38',
      'https://rickandmortyapi.com/api/character/45',
    ];
    var locationUrl = 'https://rickandmortyapi.com/api/location/1';
    var locationCreated = DateTime.parse('2017-11-10T12:42:04.162Z');

    // Act
    var location = LocationEntity(
      id: locationId,
      name: locationName,
      type: locationType,
      dimension: locationDimension,
      residents: locationResidents,
      url: locationUrl,
      created: locationCreated,
    );

    // Assert
    expect(
        location.id.toString() +
            location.name +
            location.type +
            location.dimension +
            location.residents.join() +
            location.url +
            location.created.toString(),
        locationId.toString() +
            locationName +
            locationType +
            locationDimension +
            locationResidents.join() +
            locationUrl +
            locationCreated.toString());
  });
}
