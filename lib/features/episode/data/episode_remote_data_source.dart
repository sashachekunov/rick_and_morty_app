import 'package:chekunov_rick_and_morty_client/core/exception.dart';
import 'package:chekunov_rick_and_morty_client/features/episode/data/episode_model.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class EpisodeRemoteDataSource {
  Future<EpisodeModel> getEpisodeById(int id);
  Future<List<EpisodeModel>> getAllEpisodes();
  Future<List<EpisodeModel>> getEpisodeByPage(int page);
}

class EpisodeRemoteDataSourceImpl implements EpisodeRemoteDataSource {
  final http.Client client;

  EpisodeRemoteDataSourceImpl({required this.client});

  @override
  Future<List<EpisodeModel>> getAllEpisodes() async {
    final preResponse = await client
        .get(Uri.parse('https://rickandmortyapi.com/api/episode/'), headers: {
      'Content-Type': 'application/json',
    });

    var totalCountOfEpisodes = 0;
    if (preResponse.statusCode == 200) {
      final info = json.decode(preResponse.body);
      totalCountOfEpisodes = info['info']['count'] as int;
    } else {
      throw ServerException();
    }

    final response = await client.get(
        Uri.parse('https://rickandmortyapi.com/api/episode/${[
          for (var i = 1; i <= totalCountOfEpisodes; ++i) i
        ].join(',')}'),
        headers: {
          'Content-Type': 'application/json',
        });

    if (response.statusCode == 200) {
      final episodes = json.decode(response.body);
      return (episodes as List)
          .map((episode) => EpisodeModel.fromJson(episode))
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<EpisodeModel> getEpisodeById(int id) async {
    final response = await client.get(
        Uri.parse('https://rickandmortyapi.com/api/episode/${id.toString()}'),
        headers: {
          'Content-Type': 'application/json',
        });

    if (response.statusCode == 200) {
      final episode = json.decode(response.body);
      return EpisodeModel.fromJson(episode);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<EpisodeModel>> getEpisodeByPage(int page) async {
    final response = await client.get(
        Uri.parse(
            'https://rickandmortyapi.com/api/episode/?page=${page.toString()}'),
        headers: {
          'Content-Type': 'application/json',
        });

    if (response.statusCode == 200) {
      final episodes = json.decode(response.body);
      return (episodes['results'] as List)
          .map((episode) => EpisodeModel.fromJson(episode))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
