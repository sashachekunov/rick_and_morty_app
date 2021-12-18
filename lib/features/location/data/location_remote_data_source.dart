import 'package:chekunov_rick_and_morty_client/core/exception.dart';
import 'package:chekunov_rick_and_morty_client/features/location/data/location_model.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class LocationRemoteDataSource {
  Future<LocationModel> getLocationById(int id);
  Future<List<LocationModel>> getAllLocations();
  Future<List<LocationModel>> getLocationsByPage(int page);
}

class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  final http.Client client;

  LocationRemoteDataSourceImpl({required this.client});

  @override
  Future<List<LocationModel>> getAllLocations() async {
    final preResponse = await client
        .get(Uri.parse('https://rickandmortyapi.com/api/location/'), headers: {
      'Content-Type': 'application/json',
    });

    var totalCountOfLocations = 0;
    if (preResponse.statusCode == 200) {
      final info = json.decode(preResponse.body);
      totalCountOfLocations = info['info']['count'] as int;
    } else {
      throw ServerException();
    }

    final response = await client.get(
        Uri.parse('https://rickandmortyapi.com/api/location/${[
          for (var i = 1; i <= totalCountOfLocations; ++i) i
        ].join(',')}'),
        headers: {
          'Content-Type': 'application/json',
        });

    if (response.statusCode == 200 && totalCountOfLocations > 0) {
      final locations = json.decode(response.body);
      return (locations as List)
          .map((location) => LocationModel.fromJson(location))
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<LocationModel> getLocationById(int id) async {
    final response = await client.get(
        Uri.parse('https://rickandmortyapi.com/api/location/${id.toString()}'),
        headers: {
          'Content-Type': 'application/json',
        });

    if (response.statusCode == 200) {
      final location = json.decode(response.body);
      return LocationModel.fromJson(location);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<LocationModel>> getLocationsByPage(int page) async {
    final response = await client.get(
        Uri.parse(
            'https://rickandmortyapi.com/api/location/?page=${page.toString()}'),
        headers: {
          'Content-Type': 'application/json',
        });

    if (response.statusCode == 200) {
      final locations = json.decode(response.body);
      return (locations['results'] as List)
          .map((location) => LocationModel.fromJson(location))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
