import 'package:chekunov_rick_and_morty_client/core/bottom_loader.dart';
import 'package:chekunov_rick_and_morty_client/features/location/presentation/location_card.dart';
import 'package:chekunov_rick_and_morty_client/features/location/presentation/locations_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationsPage extends StatefulWidget {
  const LocationsPage({Key? key}) : super(key: key);

  @override
  _LocationsPageState createState() => _LocationsPageState();
}

class _LocationsPageState extends State<LocationsPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationsBloc, LocationsState>(
      builder: (context, state) {
        switch (state.status) {
          case LocationsStatus.initial:
            return const Center(child: CircularProgressIndicator());
          case LocationsStatus.failure:
            return ListView.builder(
              padding: const EdgeInsets.all(5),
              itemBuilder: (BuildContext context, int index) {
                return LocationCard(location: state.locations[index]);
              },
              itemCount: state.locations.length,
              controller: _scrollController,
            );
          case LocationsStatus.success:
            if (state.locations.isEmpty) {
              return const Center(child: Text('no posts'));
            }
            return ListView.builder(
              padding: const EdgeInsets.all(5),
              controller: _scrollController,
              itemBuilder: (BuildContext context, int index) {
                return index >= state.locations.length
                    ? const BottomLoader()
                    : LocationCard(location: state.locations[index]);
              },
              itemCount: state.hasReachedMaxPage
                  ? state.locations.length
                  : state.locations.length + 1,
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
        context.read<LocationsBloc>().add(const LoadLocations());
      }
    }
  }
}
