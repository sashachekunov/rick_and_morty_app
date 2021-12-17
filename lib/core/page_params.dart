import 'package:equatable/equatable.dart';

class PageParams extends Equatable {
  final int page;

  const PageParams(this.page);

  @override
  List<Object> get props => [page];
}
