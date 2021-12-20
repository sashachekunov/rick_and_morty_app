import 'dart:async';

import 'package:chekunov_rick_and_morty_client/di/get_it.dart' as get_it;
import 'package:chekunov_rick_and_morty_client/features/character/presentation/characters_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/rick_and_morty_icons.dart';
import 'features/character/domain/character_entity.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await get_it.init();
  runApp(const RickAndMortyApp(key: Key('RickAndMortyApp')));
}

class AppColors {
  static const Color mainBackground = Color(0xFF24282F);
  static const Color cellBackground = Color(0xFF3C3E44);
  static const Color greyColor = Color(0xFF333333);
}

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CharactersBloc>(
          create: (context) => get_it.getItInstance<CharactersBloc>()
            ..add(const LoadCharacters()),
        ),
      ],
      child: MaterialApp(
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          backgroundColor: AppColors.mainBackground,
          scaffoldBackgroundColor: AppColors.cellBackground,
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Icon(
          RickAndMortyIcons.rickAndMortyLabel,
          size: 46,
          color: AppColors.greyColor,
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
      ),
      body: PersonsList(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  RickAndMortyIcons.rickAndMortyLogo,
                  size: 20,
                ),
              ),
              label: 'Characters'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_pin_outlined), label: 'Episodes'),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on_outlined), label: 'Locations'),
        ],
      ),
    );
  }
}

class PersonsList extends StatelessWidget {
  final scrollController = ScrollController();

  PersonsList({Key? key}) : super(key: key);
  void setupScrollController(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          context.read<CharactersBloc>().add(const LoadCharacters());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);

    return BlocBuilder<CharactersBloc, CharactersState>(
        builder: (context, state) {
      List<CharacterEntity> persons = [];
      bool isLoading = false;

      if (state.status == CharactersStatus.initial) {
        return _loadingIndicator();
      } else if (state.status == CharactersStatus.success) {
        persons = state.characters;
        isLoading = true;
      } else if (state.status == CharactersStatus.failure) {
        persons = state.characters;
        // return const Text(
        //   'CharactersStatus.failure',
        //   style: TextStyle(color: Colors.black, fontSize: 25),
        // );
      }
      return ListView.separated(
        controller: scrollController,
        itemBuilder: (context, index) {
          if (index < persons.length) {
            return PersonCard(person: persons[index]);
          } else {
            Timer(const Duration(milliseconds: 30), () {
              scrollController
                  .jumpTo(scrollController.position.maxScrollExtent);
            });
            return _loadingIndicator();
          }
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey[400],
          );
        },
        itemCount: persons.length + (isLoading ? 1 : 0),
      );
    });
  }

  Widget _loadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class PersonCard extends StatelessWidget {
  final CharacterEntity person;

  const PersonCard({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Image.network(
            person.image,
            width: 166,
            height: 166,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                height: 166,
                width: 166,
                color: AppColors.mainBackground,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 12,
                ),
                Text(
                  person.name,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        color: person.status == 'Alive'
                            ? Colors.green
                            : Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Text(
                        '${person.status} - ${person.species}',
                        style: const TextStyle(color: Colors.black),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  'Last known location:',
                  style: TextStyle(),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  person.location.name,
                  style: const TextStyle(color: Colors.black),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  'Origin:',
                  style: TextStyle(),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  person.origin.name,
                  style: const TextStyle(color: Colors.black),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 12,
          ),
        ],
      ),
    );
  }
}
