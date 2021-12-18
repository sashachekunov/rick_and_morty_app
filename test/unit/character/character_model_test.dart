import 'package:chekunov_rick_and_morty_client/features/character/data/character_model.dart';
import 'package:chekunov_rick_and_morty_client/features/character/domain/character_entity.dart';
import 'package:test/test.dart';

void main() {
  test('CharacterLocationModel contructor test', () {
    // Arrange
    var locationName = 'Citadel of Ricks';
    var locationUrl = 'https://rickandmortyapi.com/api/location/3';

    // Act
    var location = CharacterLocationModel(name: locationName, url: locationUrl);

    // Assert
    expect(location.name + location.url, locationName + locationUrl);
  });

  test('CharacterLocationModel from JSON format contructor test', () {
    // Arrange
    var locationName = 'Citadel of Ricks';
    var locationUrl = 'https://rickandmortyapi.com/api/location/3';
    var json = {
      'name': locationName,
      'url': locationUrl,
    };

    // Act
    var location = CharacterLocationModel.fromJson(json);

    // Assert
    expect(location.name + location.url, locationName + locationUrl);
  });

  test('CharacterLocationModel to JSON format  test', () {
    // Arrange
    var locationName = 'Citadel of Ricks';
    var locationUrl = 'https://rickandmortyapi.com/api/location/3';
    var location = CharacterLocationModel(
      name: locationName,
      url: locationUrl,
    );

    // Act
    var res = location.toJson();

    // Assert
    expect(res, {
      'name': locationName,
      'url': locationUrl,
    });
  });

  test('CharacterModel constructor test', () {
    // Arrange
    var characterId = 2;
    var characterName = 'Morty Smith';
    var characterStatus = 'Alive';
    var characterSpecies = 'Human';
    var characterType = '';
    var characterGender = 'Male';
    var characterOrigin = const CharacterLocation(
      name: 'unknown',
      url: '',
    );
    var characterLocation = const CharacterLocation(
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
    var character = CharacterModel(
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

  test('CharacterModel from JSON format contructor test', () {
    // Arrange
    var characterId = 2;
    var characterName = 'Morty Smith';
    var characterStatus = 'Alive';
    var characterSpecies = 'Human';
    var characterType = '';
    var characterGender = 'Male';
    var characterOrigin = const CharacterLocationModel(
      name: 'unknown',
      url: '',
    );
    var characterLocation = const CharacterLocationModel(
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

    var json = {
      'id': characterId,
      'name': characterName,
      'status': characterStatus,
      'species': characterSpecies,
      'type': characterType,
      'gender': characterGender,
      'origin': characterOrigin.toJson(),
      'location': characterLocation.toJson(),
      'image': characterImage,
      'episode': characterEpisode,
      'url': characterUrl,
      'created': characterCreated.toIso8601String()
    };

    // Act
    var character = CharacterModel.fromJson(json);

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

  test('CharacterModel to JSON format  test', () {
    // Arrange
    var characterId = 2;
    var characterName = 'Morty Smith';
    var characterStatus = 'Alive';
    var characterSpecies = 'Human';
    var characterType = '';
    var characterGender = 'Male';
    var characterOrigin = const CharacterLocationModel(
      name: 'unknown',
      url: '',
    );
    var characterLocation = const CharacterLocationModel(
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

    var character = CharacterModel(
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

    // Act
    var res = character.toJson();

    // Assert
    expect(res, {
      'id': characterId,
      'name': characterName,
      'status': characterStatus,
      'species': characterSpecies,
      'type': characterType,
      'gender': characterGender,
      'origin': characterOrigin.toJson(),
      'location': characterLocation.toJson(),
      'image': characterImage,
      'episode': characterEpisode,
      'url': characterUrl,
      'created': characterCreated.toIso8601String()
    });
  });
}
