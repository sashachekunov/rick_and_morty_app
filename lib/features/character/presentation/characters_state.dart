part of 'characters_bloc.dart';

enum CharactersStatus { initial, success, failure }

class CharactersState extends Equatable {
  final CharactersStatus status;
  final List<CharacterEntity> characters;
  final bool hasReachedMaxPage;

  const CharactersState({
    this.status = CharactersStatus.initial,
    this.characters = const <CharacterEntity>[],
    this.hasReachedMaxPage = false,
  });

  CharactersState copyWith({
    CharactersStatus? status,
    List<CharacterEntity>? characters,
    bool? hasReachedMaxPage,
  }) {
    return CharactersState(
      status: status ?? this.status,
      characters: characters ?? this.characters,
      hasReachedMaxPage: hasReachedMaxPage ?? this.hasReachedMaxPage,
    );
  }

  @override
  String toString() {
    return 'CharactersState { status: $status, hasReachedMax: $hasReachedMaxPage, characters: ${characters.length} }';
  }

  @override
  List<Object> get props => [status, characters, hasReachedMaxPage];
}
