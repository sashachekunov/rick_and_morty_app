import 'package:chekunov_rick_and_morty_client/features/location/data/location_model.dart';
import 'package:test/test.dart';

void main() {
  test('EpisodeModel contructor test', () {
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
    var location = LocationModel(
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

  test('EpisodeModel from JSON format contructor test', () {
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

    var json = {
      'id': locationId,
      'name': locationName,
      'type': locationType,
      'dimension': locationDimension,
      'residents': locationResidents,
      'url': locationUrl,
      'created': locationCreated.toIso8601String(),
    };

    // Act
    var location = LocationModel.fromJson(json);

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

  test('EpisodeModel to JSON format test', () {
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

    var location = LocationModel(
      id: locationId,
      name: locationName,
      type: locationType,
      dimension: locationDimension,
      residents: locationResidents,
      url: locationUrl,
      created: locationCreated,
    );

    // Act
    var res = location.toJson();

    // Assert
    expect(res, {
      'id': locationId,
      'name': locationName,
      'type': locationType,
      'dimension': locationDimension,
      'residents': locationResidents,
      'url': locationUrl,
      'created': locationCreated.toIso8601String(),
    });
  });
}
