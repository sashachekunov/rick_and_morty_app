import 'package:chekunov_rick_and_morty_client/features/episode/data/episode_model.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class EpisodeRemoteDataSource {
  Future<List<EpisodeModel>> getEpisodesByPage(int page);
}

class EpisodeRemoteDataSourceImpl implements EpisodeRemoteDataSource {
  final http.Client client;

  EpisodeRemoteDataSourceImpl({required this.client});

  @override
  Future<List<EpisodeModel>> getEpisodesByPage(int page) async {
    final response = await client.get(
        Uri.parse(
            'https://rickandmortyapi.com/api/episode/?page=${page.toString()}'),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final episodes = json.decode(response.body);
      return (episodes['results'] as List)
          .map((episode) => EpisodeModel.fromJson(episode))
          .toList();
    } else {
      throw Exception();
    }
  }
}
