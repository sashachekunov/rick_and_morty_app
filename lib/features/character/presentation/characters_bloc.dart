import 'package:chekunov_rick_and_morty_client/core/page_params.dart';
import 'package:chekunov_rick_and_morty_client/features/character/domain/character_entity.dart';
import 'package:chekunov_rick_and_morty_client/features/character/domain/get_characters_by_page.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersLoadEvent, CharactersState> {
  final GetCharactersByPage getCharactersByPage;
  int page = 1;

  CharactersBloc(this.getCharactersByPage) : super(const CharactersState()) {
    on<LoadCharacters>((event, emit) async {
      if (state.hasReachedMaxPage) return;

      final errorOrCharacters = await getCharactersByPage(PageParams(page));

      errorOrCharacters.fold(
        (error) {
          emit(state.copyWith(status: CharactersStatus.failure));
        },
        (characters) {
          ++page;
          if (characters.isEmpty) {
            emit(state.copyWith(
              status: CharactersStatus.success,
              hasReachedMaxPage: true,
            ));
          } else if (state.status == CharactersStatus.initial) {
            return emit(state.copyWith(
              status: CharactersStatus.success,
              characters: characters,
              hasReachedMaxPage: false,
            ));
          } else {
            emit(state.copyWith(
              status: CharactersStatus.success,
              characters: List.of(state.characters)..addAll(characters),
              hasReachedMaxPage: false,
            ));
          }
        },
      );
    });
  }
}
