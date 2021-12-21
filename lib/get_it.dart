import 'package:chekunov_rick_and_morty_client/features/character/data/character_remote_data_source.dart';
import 'package:chekunov_rick_and_morty_client/features/character/data/character_repository_impl.dart';
import 'package:chekunov_rick_and_morty_client/features/character/domain/character_repository.dart';
import 'package:chekunov_rick_and_morty_client/features/character/domain/get_characters_by_page.dart';
import 'package:chekunov_rick_and_morty_client/features/character/presentation/characters_bloc.dart';

import 'package:chekunov_rick_and_morty_client/features/episode/data/episode_remote_data_source.dart';
import 'package:chekunov_rick_and_morty_client/features/episode/data/episode_repository_impl.dart';
import 'package:chekunov_rick_and_morty_client/features/episode/domain/episode_repository.dart';
import 'package:chekunov_rick_and_morty_client/features/episode/domain/get_episodes_by_page.dart';
import 'package:chekunov_rick_and_morty_client/features/episode/presentation/episodes_bloc.dart';

import 'package:chekunov_rick_and_morty_client/features/location/data/location_remote_data_source.dart';
import 'package:chekunov_rick_and_morty_client/features/location/data/location_repository_impl.dart';
import 'package:chekunov_rick_and_morty_client/features/location/domain/get_locations_by_page.dart';
import 'package:chekunov_rick_and_morty_client/features/location/domain/location_repository.dart';

import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

final getItInstance = GetIt.instance;

Future<void> init() async {
  // http client
  getItInstance.registerLazySingleton<http.Client>(() => http.Client());

  // DataSources
  getItInstance.registerLazySingleton<CharacterRemoteDataSource>(
      () => CharacterRemoteDataSourceImpl(client: getItInstance()));
  getItInstance.registerLazySingleton<EpisodeRemoteDataSource>(
      () => EpisodeRemoteDataSourceImpl(client: getItInstance()));
  getItInstance.registerLazySingleton<LocationRemoteDataSource>(
      () => LocationRemoteDataSourceImpl(client: getItInstance()));

  // UseCases
  getItInstance
      .registerLazySingleton(() => GetCharactersByPage(getItInstance()));
  getItInstance.registerLazySingleton(() => GetEpisodesByPage(getItInstance()));
  getItInstance
      .registerLazySingleton(() => GetLocationsByPage(getItInstance()));

  // Repositories
  getItInstance.registerLazySingleton<CharacterRepository>(
      () => CharacterRepositoryImpl(remoteDataSource: getItInstance()));
  getItInstance.registerLazySingleton<EpisodeRepository>(
      () => EpisodeRepositoryImpl(remoteDataSource: getItInstance()));
  getItInstance.registerLazySingleton<LocationRepository>(
      () => LocationRepositoryImpl(remoteDataSource: getItInstance()));

  // BLoC
  getItInstance.registerFactory(() => CharactersBloc(getItInstance()));
  getItInstance.registerFactory(() => EpisodesBloc(getItInstance()));
}
