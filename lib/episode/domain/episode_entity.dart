import 'package:equatable/equatable.dart';

class EpisodeEntity extends Equatable {
  final int id;
  final String name;
  final String airDate;
  final String code;
  final List<String> characters;
  final String url;
  final DateTime created;

  const EpisodeEntity({
    required this.id,
    required this.name,
    required this.airDate,
    required this.code,
    required this.characters,
    required this.url,
    required this.created,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        airDate,
        code,
        characters,
        url,
        created,
      ];
}
