import 'package:chekunov_rick_and_morty_client/core/bottom_loader.dart';
import 'package:chekunov_rick_and_morty_client/features/character/presentation/character_card.dart';
import 'package:chekunov_rick_and_morty_client/features/character/presentation/characters_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({Key? key}) : super(key: key);

  @override
  _CharactersPageState createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersBloc, CharactersState>(
      builder: (context, state) {
        switch (state.status) {
          case CharactersStatus.initial:
            return const Center(child: CircularProgressIndicator());
          case CharactersStatus.failure:
            return ListView.builder(
              padding: const EdgeInsets.all(30),
              itemBuilder: (BuildContext context, int index) {
                return CharacterCard(character: state.characters[index]);
              },
              itemCount: state.characters.length,
              controller: _scrollController,
            );
          case CharactersStatus.success:
            if (state.characters.isEmpty) {
              return const Center(child: Text('no posts'));
            }
            return ListView.builder(
              padding: const EdgeInsets.all(30),
              itemBuilder: (BuildContext context, int index) {
                return index >= state.characters.length
                    ? const BottomLoader()
                    : CharacterCard(character: state.characters[index]);
              },
              itemCount: state.hasReachedMaxPage
                  ? state.characters.length
                  : state.characters.length + 1,
              controller: _scrollController,
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
        context.read<CharactersBloc>().add(const LoadCharacters());
      }
    }
  }
}
