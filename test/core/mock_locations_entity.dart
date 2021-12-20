import 'package:chekunov_rick_and_morty_client/features/location/domain/location_entity.dart';

var earthC137 = LocationEntity(
  id: 1,
  name: 'Earth (C-137)',
  type: 'Planet',
  dimension: 'Dimension C-137',
  residents: const [
    'https://rickandmortyapi.com/api/character/38',
    'https://rickandmortyapi.com/api/character/45',
  ],
  url: 'https://rickandmortyapi.com/api/location/1',
  created: DateTime.parse('2017-11-10T12:42:04.162Z'),
);

var abadango = LocationEntity(
  id: 2,
  name: 'Abadango',
  type: 'Cluster',
  dimension: 'unknown',
  residents: const ['https://rickandmortyapi.com/api/character/6'],
  url: 'https://rickandmortyapi.com/api/location/2',
  created: DateTime.parse('2017-11-10T13:06:38.182Z'),
);
