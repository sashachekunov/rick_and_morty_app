import 'package:chekunov_rick_and_morty_client/features/location/domain/location_entity.dart';

class LocationModel extends LocationEntity {
  const LocationModel({
    id,
    name,
    type,
    dimension,
    residents,
    url,
    created,
  }) : super(
          id: id,
          name: name,
          type: type,
          dimension: dimension,
          residents: residents,
          url: url,
          created: created,
        );

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      id: json['id'] as int,
      name: json['name'] as String,
      type: json['type'] as String,
      dimension: json['dimension'] as String,
      residents:
          (json['residents'] as List<dynamic>).map((e) => e as String).toList(),
      url: json['url'] as String,
      created: DateTime.parse(json['created'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'dimension': dimension,
      'residents': residents,
      'url': url,
      'created': created.toIso8601String(),
    };
  }
}
