import 'package:chekunov_rick_and_morty_client/core/error.dart';

import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Params> {
  Future<Either<AppError, Type>> call(Params params);
}
