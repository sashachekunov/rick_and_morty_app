part of 'characters_bloc.dart';

abstract class CharactersLoadEvent extends Equatable {
  const CharactersLoadEvent();

  @override
  List<Object> get props => [];
}

class LoadCharacters extends CharactersLoadEvent {
  const LoadCharacters();
}
