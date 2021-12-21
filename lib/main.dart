import 'package:chekunov_rick_and_morty_client/core/app_theme_colors.dart';
import 'package:chekunov_rick_and_morty_client/features/episode/presentation/episodes_bloc.dart';
import 'package:chekunov_rick_and_morty_client/features/location/presentation/locations_bloc.dart';
import 'package:chekunov_rick_and_morty_client/features/character/presentation/characters_bloc.dart';
import 'package:chekunov_rick_and_morty_client/main_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chekunov_rick_and_morty_client/get_it.dart' as get_it;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await get_it.init();
  runApp(const RickAndMortyApp());
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
        BlocProvider<EpisodesBloc>(
          create: (context) =>
              get_it.getItInstance<EpisodesBloc>()..add(const LoadEpisodes()),
        ),
        BlocProvider<LocationsBloc>(
          create: (context) =>
              get_it.getItInstance<LocationsBloc>()..add(const LoadLocations()),
        ),
      ],
      child: MaterialApp(
        home: const MainPage(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: AppColors.mainBackground),
      ),
    );
  }
}
