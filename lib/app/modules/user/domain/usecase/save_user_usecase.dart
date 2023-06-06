import 'package:eduqhub_test/app/modules/user/domain/model/user.dart';
import 'package:eduqhub_test/app/modules/user/infra/user_repository_contract.dart';
import 'package:either_dart/either.dart';

abstract class SaveUserUsecaseContract {
  Future<Either<Error, bool>> call({
    required User user,
  });
}

class SaveUserUsecase implements SaveUserUsecaseContract {
  final UserRepositoryContract repository;
  SaveUserUsecase({
    required this.repository,
  });

  @override
  Future<Either<Error, bool>> call({
    required User user,
  }) async {
    try {
      final result = await repository.saveUser(user: user);
      return Right(result.isNotEmpty);
    } on Error catch (e) {
      return Left(e);
    }
  }
}
