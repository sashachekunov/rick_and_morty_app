import 'package:chekunov_rick_and_morty_client/features/location/data/location_model.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class LocationRemoteDataSource {
  Future<List<LocationModel>> getLocationsByPage(int page);
}

class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  final http.Client client;

  LocationRemoteDataSourceImpl({required this.client});

  @override
  Future<List<LocationModel>> getLocationsByPage(int page) async {
    final response = await client.get(
        Uri.parse(
            'https://rickandmortyapi.com/api/location/?page=${page.toString()}'),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final locations = json.decode(response.body);
      return (locations['results'] as List)
          .map((location) => LocationModel.fromJson(location))
          .toList();
    } else {
      throw Exception();
    }
  }
}
