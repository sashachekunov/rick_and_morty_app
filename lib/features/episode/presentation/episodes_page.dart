import 'package:chekunov_rick_and_morty_client/core/bottom_loader.dart';
import 'package:chekunov_rick_and_morty_client/features/episode/presentation/episode_card.dart';
import 'package:chekunov_rick_and_morty_client/features/episode/presentation/episodes_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EpisodesPage extends StatefulWidget {
  const EpisodesPage({Key? key}) : super(key: key);

  @override
  _EpisodesPageState createState() => _EpisodesPageState();
}

class _EpisodesPageState extends State<EpisodesPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EpisodesBloc, EpisodesState>(
      builder: (context, state) {
        switch (state.status) {
          case EpisodesStatus.initial:
            return const Center(child: CircularProgressIndicator());
          case EpisodesStatus.failure:
            return ListView.builder(
              padding: const EdgeInsets.all(5),
              itemBuilder: (BuildContext context, int index) {
                return EpisodeCard(episode: state.episodes[index]);
              },
              itemCount: state.episodes.length,
              controller: _scrollController,
            );
          case EpisodesStatus.success:
            if (state.episodes.isEmpty) {
              return const Center(child: Text('no posts'));
            }
            return ListView.builder(
              padding: const EdgeInsets.all(5),
              controller: _scrollController,
              itemBuilder: (BuildContext context, int index) {
                return index >= state.episodes.length
                    ? const BottomLoader()
                    : EpisodeCard(episode: state.episodes[index]);
              },
              itemCount: state.hasReachedMaxPage
                  ? state.episodes.length
                  : state.episodes.length + 1,
            );
          default:
            return const Center(child: Text('no posts'));
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.atEdge) {
      if (_scrollController.position.pixels != 0) {
        context.read<EpisodesBloc>().add(const LoadEpisodes());
      }
    }
  }
}
