part of 'locations_bloc.dart';

abstract class LocationsLoadEvent extends Equatable {
  const LocationsLoadEvent();

  @override
  List<Object> get props => [];
}

class LoadLocations extends LocationsLoadEvent {
  const LoadLocations();
}
