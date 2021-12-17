import 'package:equatable/equatable.dart';

class IdParams extends Equatable {
  final int id;

  const IdParams(this.id);

  @override
  List<Object> get props => [id];
}
