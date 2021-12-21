import 'package:chekunov_rick_and_morty_client/features/character/data/character_model.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class CharacterRemoteDataSource {
  Future<List<CharacterModel>> getCharactersByPage(int page);
}

class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  final http.Client client;

  CharacterRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CharacterModel>> getCharactersByPage(int page) async {
    final response = await client.get(
        Uri.parse(
            'https://rickandmortyapi.com/api/character/?page=${page.toString()}'),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final characters = json.decode(response.body) as Map<String, dynamic>;

      return (characters['results'] as List)
          .map((character) => CharacterModel.fromJson(character))
          .toList();
    } else {
      throw Exception();
    }
  }
}
