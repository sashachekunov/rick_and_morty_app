import 'package:chekunov_rick_and_morty_client/core/page_params.dart';
import 'package:chekunov_rick_and_morty_client/features/location/domain/get_locations_by_page.dart';
import 'package:chekunov_rick_and_morty_client/features/location/domain/location_entity.dart';
import 'package:equatable/equatable.dart';

import 'package:bloc/bloc.dart';

part 'locations_event.dart';
part 'locations_state.dart';

class LocationsBloc extends Bloc<LocationsLoadEvent, LocationsState> {
  final GetLocationsByPage getLocationsByPage;
  int page = 1;

  LocationsBloc(this.getLocationsByPage) : super(const LocationsState()) {
    on<LoadLocations>((event, emit) async {
      if (state.hasReachedMaxPage) return;

      final errorOrLocations = await getLocationsByPage(PageParams(page));

      errorOrLocations.fold(
        (error) {
          emit(state.copyWith(
              status: LocationsStatus.failure, hasReachedMaxPage: true));
        },
        (locations) {
          ++page;
          if (state.status == LocationsStatus.initial) {
            return emit(state.copyWith(
              status: LocationsStatus.success,
              locations: locations,
              hasReachedMaxPage: false,
            ));
          }
          locations.isEmpty
              ? emit(state.copyWith(hasReachedMaxPage: true))
              : emit(state.copyWith(
                  status: LocationsStatus.success,
                  locations: List.of(state.locations)..addAll(locations),
                  hasReachedMaxPage: false,
                ));
        },
      );
    });
  }
}
