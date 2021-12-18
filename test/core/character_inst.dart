import 'package:chekunov_rick_and_morty_client/features/character/domain/character_entity.dart';

var rick = CharacterEntity(
  id: 1,
  name: 'Rick Sanchez',
  status: 'Alive',
  species: 'Human',
  type: '',
  gender: 'Male',
  origin: const CharacterLocation(
    name: 'Earth (C-137)',
    url: 'https://rickandmortyapi.com/api/location/1',
  ),
  location: const CharacterLocation(
    name: 'Citadel of Ricks',
    url: 'https://rickandmortyapi.com/api/location/3',
  ),
  image: 'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
  episode: const [
    'https://rickandmortyapi.com/api/episode/1',
    'https://rickandmortyapi.com/api/episode/2',
  ],
  url: 'https://rickandmortyapi.com/api/character/1',
  created: DateTime.parse('2017-11-04T18:48:46.250Z'),
);

var morty = CharacterEntity(
  id: 2,
  name: 'Morty Smith',
  status: 'Alive',
  species: 'Human',
  type: '',
  gender: 'Male',
  origin: const CharacterLocation(
    name: 'unknown',
    url: '',
  ),
  location: const CharacterLocation(
    name: 'Citadel of Ricks',
    url: 'https://rickandmortyapi.com/api/location/3',
  ),
  image: 'https://rickandmortyapi.com/api/character/avatar/2.jpeg',
  episode: const [
    'https://rickandmortyapi.com/api/episode/1',
    'https://rickandmortyapi.com/api/episode/2',
  ],
  url: 'https://rickandmortyapi.com/api/character/2',
  created: DateTime.parse('2017-11-04T18:50:21.651Z'),
);
