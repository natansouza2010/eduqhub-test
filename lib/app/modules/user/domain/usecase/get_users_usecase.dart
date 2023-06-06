import 'package:eduqhub_test/app/modules/user/domain/model/user.dart';
import 'package:eduqhub_test/app/modules/user/infra/user_repository_contract.dart';
import 'package:either_dart/either.dart';

abstract class GetUsersUsecaseContract {
  Future<Either<Error, List<User>>> call();
}

class GetUserUsecase implements GetUsersUsecaseContract {
  final UserRepositoryContract repository;
  GetUserUsecase({
    required this.repository,
  });

  @override
  Future<Either<Error, List<User>>> call() async {
    try {
      final result = await repository.getUsers();
      return Right(result);
    } on Error catch (e) {
      return Left(e);
    }
  }
}
