import 'package:chekunov_rick_and_morty_client/features/episode/domain/episode_entity.dart';

var pilot = EpisodeEntity(
  id: 1,
  name: 'Pilot',
  airDate: 'December 2, 2013',
  code: 'S01E01',
  characters: const [
    'https://rickandmortyapi.com/api/character/1',
    'https://rickandmortyapi.com/api/character/2',
  ],
  url: 'https://rickandmortyapi.com/api/episode/1',
  created: DateTime.parse('2017-11-10T12:56:33.798Z'),
);

var lawnmowerDog = EpisodeEntity(
  id: 2,
  name: 'Lawnmower Dog',
  airDate: 'December 9, 2013',
  code: 'S01E02',
  characters: const [
    'https://rickandmortyapi.com/api/character/1',
    'https://rickandmortyapi.com/api/character/2',
  ],
  url: 'https://rickandmortyapi.com/api/episode/2',
  created: DateTime.parse('2017-11-10T12:56:33.916Z'),
);
