import 'package:chekunov_rick_and_morty_client/core/exception.dart';
import 'package:chekunov_rick_and_morty_client/features/character/data/character_model.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class CharacterRemoteDataSource {
  Future<CharacterModel> getCharacterById(int id);
  Future<List<CharacterModel>> getAllCharacters();
  Future<List<CharacterModel>> getCharactersByPage(int page);
}

class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  final http.Client client;

  CharacterRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CharacterModel>> getAllCharacters() async {
    final preResponse = await client.get(
        Uri.parse('https://rickandmortyapi.com/api/character/'),
        headers: {'Content-Type': 'application/json'});

    var totalCountOfCharacters = 0;
    if (preResponse.statusCode == 200) {
      final info = json.decode(preResponse.body);
      totalCountOfCharacters = info['info']['count'] as int;
    } else {
      throw ServerException();
    }

    final response = await client.get(
        Uri.parse('https://rickandmortyapi.com/api/character/${[
          for (var i = 1; i <= totalCountOfCharacters; ++i) i
        ].join(',')}'),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200 && totalCountOfCharacters > 0) {
      final characters = json.decode(response.body);
      return (characters as List)
          .map((character) => CharacterModel.fromJson(character))
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<CharacterModel> getCharacterById(int id) async {
    final response = await client.get(
        Uri.parse('https://rickandmortyapi.com/api/character/${id.toString()}'),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final character = json.decode(response.body);
      return CharacterModel.fromJson(character);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<CharacterModel>> getCharactersByPage(int page) async {
    final response = await client.get(
        Uri.parse(
            'https://rickandmortyapi.com/api/character/?page=${page.toString()}'),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final characters = json.decode(response.body) as Map<String, dynamic>;

      if (characters.containsKey('error')) {
        return <CharacterModel>[];
      }

      return (characters['results'] as List)
          .map((character) => CharacterModel.fromJson(character))
          .toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
