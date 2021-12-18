import 'package:chekunov_rick_and_morty_client/features/episode/domain/episode_entity.dart';

class EpisodeModel extends EpisodeEntity {
  const EpisodeModel({
    id,
    name,
    airDate,
    code,
    characters,
    url,
    created,
  }) : super(
          id: id,
          name: name,
          airDate: airDate,
          code: code,
          characters: characters,
          url: url,
          created: created,
        );

  factory EpisodeModel.fromJson(Map<String, dynamic> json) {
    return EpisodeModel(
      id: json['id'] as int,
      name: json['name'] as String,
      airDate: json['air_date'] as String,
      code: json['episode'] as String,
      characters: (json['characters'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      url: json['url'] as String,
      created: DateTime.parse(json['created'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'air_date': airDate,
      'episode': code,
      'characters': characters,
      'url': url,
      'created': created.toIso8601String(),
    };
  }
}
