import 'package:chekunov_rick_and_morty_client/features/location/domain/location_entity.dart';

import 'package:test/test.dart';

void main() {
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
