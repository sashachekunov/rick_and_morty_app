import 'package:chekunov_rick_and_morty_client/features/character/domain/character_entity.dart';

class CharacterModel extends CharacterEntity {
  const CharacterModel({
    required id,
    required name,
    required status,
    required species,
    required type,
    required gender,
    required origin,
    required location,
    required image,
    required episode,
    required url,
    required created,
  }) : super(
          id: id,
          name: name,
          status: status,
          species: species,
          type: type,
          gender: gender,
          origin: origin,
          location: location,
          image: image,
          episode: episode,
          url: url,
          created: created,
        );

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'] as int,
      name: json['name'] as String,
      status: json['status'] as String,
      species: json['species'] as String,
      type: json['type'] as String,
      gender: json['gender'] as String,
      origin: CharacterLocationModel.fromJson(json['origin']),
      location: CharacterLocationModel.fromJson(json['location']),
      image: json['image'] as String,
      url: json['url'] as String,
      episode:
          (json['episode'] as List<dynamic>).map((e) => e as String).toList(),
      created: DateTime.parse(json['created'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'type': type,
      'gender': gender,
      'origin': CharacterLocationModel(
        name: origin.name,
        url: origin.url,
      ).toJson(),
      'location': CharacterLocationModel(
        name: location.name,
        url: location.url,
      ).toJson(),
      'image': image,
      'episode': episode,
      'url': url,
      'created': created.toIso8601String(),
    };
  }
}

class CharacterLocationModel extends CharacterLocation {
  const CharacterLocationModel({name, url}) : super(name: name, url: url);

  factory CharacterLocationModel.fromJson(Map<String, dynamic> json) {
    return CharacterLocationModel(
        name: json['name'] as String, url: json['url'] as String);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'url': url};
  }
}
