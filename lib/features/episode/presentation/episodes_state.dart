part of 'episodes_bloc.dart';


enum EpisodesStatus { initial, success, failure }

class EpisodesState extends Equatable {
  final EpisodesStatus status;
  final List<EpisodeEntity> episodes;
  final bool hasReachedMaxPage;

  const EpisodesState({
    this.status = EpisodesStatus.initial,
    this.episodes = const <EpisodeEntity>[],
    this.hasReachedMaxPage = false,
  });

  EpisodesState copyWith({
    EpisodesStatus? status,
    List<EpisodeEntity>? episodes,
    bool? hasReachedMaxPage,
  }) {
    return EpisodesState(
      status: status ?? this.status,
      episodes: episodes ?? this.episodes,
      hasReachedMaxPage: hasReachedMaxPage ?? this.hasReachedMaxPage,
    );
  }

  @override
  String toString() {
    return 'EpisodesState { status: $status, hasReachedMax: $hasReachedMaxPage, episodes: ${episodes.length} }';
  }

  @override
  List<Object> get props => [status, episodes, hasReachedMaxPage];
}
