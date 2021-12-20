import 'package:chekunov_rick_and_morty_client/features/character/data/character_model.dart';
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

var summer = CharacterEntity(
  id: 3,
  name: 'Summer Smith',
  status: 'Alive',
  species: 'Human',
  type: '',
  gender: 'Female',
  origin: const CharacterLocation(
    name: 'Earth (Replacement Dimension)',
    url: 'https://rickandmortyapi.com/api/location/20',
  ),
  location: const CharacterLocation(
    name: 'Earth (Replacement Dimension)',
    url: 'https://rickandmortyapi.com/api/location/20',
  ),
  image: 'https://rickandmortyapi.com/api/character/avatar/3.jpeg',
  episode: const [
    'https://rickandmortyapi.com/api/episode/1',
    'https://rickandmortyapi.com/api/episode/2',
  ],
  url: 'https://rickandmortyapi.com/api/character/3',
  created: DateTime.parse('2017-11-04T19:09:56.428Z'),
);

var beth = CharacterEntity(
  id: 4,
  name: 'Beth Smith',
  status: 'Alive',
  species: 'Human',
  type: '',
  gender: 'Female',
  origin: const CharacterLocation(
    name: 'Earth (Replacement Dimension)',
    url: 'https://rickandmortyapi.com/api/location/20',
  ),
  location: const CharacterLocation(
    name: 'Earth (Replacement Dimension)',
    url: 'https://rickandmortyapi.com/api/location/20',
  ),
  image: 'https://rickandmortyapi.com/api/character/avatar/4.jpeg',
  episode: const [
    'https://rickandmortyapi.com/api/episode/1',
    'https://rickandmortyapi.com/api/episode/2',
  ],
  url: 'https://rickandmortyapi.com/api/character/4',
  created: DateTime.parse('2017-11-04T19:22:43.665Z'),
);

var jerry = CharacterEntity(
  id: 5,
  name: 'Jerry Smith',
  status: 'Alive',
  species: 'Human',
  type: '',
  gender: 'Male',
  origin: const CharacterLocation(
    name: 'Earth (Replacement Dimension)',
    url: 'https://rickandmortyapi.com/api/location/20',
  ),
  location: const CharacterLocation(
    name: 'Earth (Replacement Dimension)',
    url: 'https://rickandmortyapi.com/api/location/20',
  ),
  image: 'https://rickandmortyapi.com/api/character/avatar/5.jpeg',
  episode: const [
    'https://rickandmortyapi.com/api/episode/1',
    'https://rickandmortyapi.com/api/episode/2',
  ],
  url: 'https://rickandmortyapi.com/api/character/5',
  created: DateTime.parse('2017-11-04T19:26:56.301Z'),
);

var rickModel = CharacterModel(
  id: 1,
  name: 'Rick Sanchez',
  status: 'Alive',
  species: 'Human',
  type: '',
  gender: 'Male',
  origin: const CharacterLocationModel(
    name: 'Earth (C-137)',
    url: 'https://rickandmortyapi.com/api/location/1',
  ),
  location: const CharacterLocationModel(
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

var mortyModel = CharacterModel(
  id: 2,
  name: 'Morty Smith',
  status: 'Alive',
  species: 'Human',
  type: '',
  gender: 'Male',
  origin: const CharacterLocationModel(
    name: 'unknown',
    url: '',
  ),
  location: const CharacterLocationModel(
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

var summerModel = CharacterModel(
  id: 3,
  name: 'Summer Smith',
  status: 'Alive',
  species: 'Human',
  type: '',
  gender: 'Female',
  origin: const CharacterLocationModel(
    name: 'Earth (Replacement Dimension)',
    url: 'https://rickandmortyapi.com/api/location/20',
  ),
  location: const CharacterLocationModel(
    name: 'Earth (Replacement Dimension)',
    url: 'https://rickandmortyapi.com/api/location/20',
  ),
  image: 'https://rickandmortyapi.com/api/character/avatar/3.jpeg',
  episode: const [
    'https://rickandmortyapi.com/api/episode/1',
    'https://rickandmortyapi.com/api/episode/2',
  ],
  url: 'https://rickandmortyapi.com/api/character/3',
  created: DateTime.parse('2017-11-04T19:09:56.428Z'),
);

var bethModel = CharacterModel(
  id: 4,
  name: 'Beth Smith',
  status: 'Alive',
  species: 'Human',
  type: '',
  gender: 'Female',
  origin: const CharacterLocationModel(
    name: 'Earth (Replacement Dimension)',
    url: 'https://rickandmortyapi.com/api/location/20',
  ),
  location: const CharacterLocationModel(
    name: 'Earth (Replacement Dimension)',
    url: 'https://rickandmortyapi.com/api/location/20',
  ),
  image: 'https://rickandmortyapi.com/api/character/avatar/4.jpeg',
  episode: const [
    'https://rickandmortyapi.com/api/episode/1',
    'https://rickandmortyapi.com/api/episode/2',
  ],
  url: 'https://rickandmortyapi.com/api/character/4',
  created: DateTime.parse('2017-11-04T19:22:43.665Z'),
);

var jerryModel = CharacterModel(
  id: 5,
  name: 'Jerry Smith',
  status: 'Alive',
  species: 'Human',
  type: '',
  gender: 'Male',
  origin: const CharacterLocationModel(
    name: 'Earth (Replacement Dimension)',
    url: 'https://rickandmortyapi.com/api/location/20',
  ),
  location: const CharacterLocationModel(
    name: 'Earth (Replacement Dimension)',
    url: 'https://rickandmortyapi.com/api/location/20',
  ),
  image: 'https://rickandmortyapi.com/api/character/avatar/5.jpeg',
  episode: const [
    'https://rickandmortyapi.com/api/episode/1',
    'https://rickandmortyapi.com/api/episode/2',
  ],
  url: 'https://rickandmortyapi.com/api/character/5',
  created: DateTime.parse('2017-11-04T19:26:56.301Z'),
);
