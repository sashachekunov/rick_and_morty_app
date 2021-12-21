import 'package:chekunov_rick_and_morty_client/core/page_params.dart';
import 'package:chekunov_rick_and_morty_client/features/episode/domain/episode_entity.dart';
import 'package:chekunov_rick_and_morty_client/features/episode/domain/get_episodes_by_page.dart';
import 'package:equatable/equatable.dart';

import 'package:bloc/bloc.dart';

part 'episodes_event.dart';
part 'episodes_state.dart';


class EpisodesBloc extends Bloc<EpisodesLoadEvent, EpisodesState> {
  final GetEpisodesByPage getEpisodesByPage;
  int page = 1;

  EpisodesBloc(this.getEpisodesByPage) : super(const EpisodesState()) {
    on<LoadEpisodes>((event, emit) async {
      if (state.hasReachedMaxPage) return;

      final errorOrEpisodes = await getEpisodesByPage(PageParams(page));

      errorOrEpisodes.fold(
        (error) {
          emit(state.copyWith(
              status: EpisodesStatus.failure, hasReachedMaxPage: true));
        },
        (episodes) {
          ++page;
          if (state.status == EpisodesStatus.initial) {
            return emit(state.copyWith(
              status: EpisodesStatus.success,
              episodes: episodes,
              hasReachedMaxPage: false,
            ));
          }
          episodes.isEmpty
              ? emit(state.copyWith(hasReachedMaxPage: true))
              : emit(state.copyWith(
                  status: EpisodesStatus.success,
                  episodes: List.of(state.episodes)..addAll(episodes),
                  hasReachedMaxPage: false,
                ));
        },
      );
    });
  }
}
