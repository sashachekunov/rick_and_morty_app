part of 'locations_bloc.dart';

enum LocationsStatus { initial, success, failure }

class LocationsState extends Equatable {
  final LocationsStatus status;
  final List<LocationEntity> locations;
  final bool hasReachedMaxPage;

  const LocationsState({
    this.status = LocationsStatus.initial,
    this.locations = const <LocationEntity>[],
    this.hasReachedMaxPage = false,
  });

  LocationsState copyWith({
    LocationsStatus? status,
    List<LocationEntity>? locations,
    bool? hasReachedMaxPage,
  }) {
    return LocationsState(
      status: status ?? this.status,
      locations: locations ?? this.locations,
      hasReachedMaxPage: hasReachedMaxPage ?? this.hasReachedMaxPage,
    );
  }

  @override
  String toString() {
    return 'LocationsState { status: $status, hasReachedMax: $hasReachedMaxPage, locations: ${locations.length} }';
  }

  @override
  List<Object> get props => [status, locations, hasReachedMaxPage];
}
