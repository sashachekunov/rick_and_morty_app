part of 'episodes_bloc.dart';

abstract class EpisodesLoadEvent extends Equatable {
  const EpisodesLoadEvent();

  @override
  List<Object> get props => [];
}

class LoadEpisodes extends EpisodesLoadEvent {
  const LoadEpisodes();
}
