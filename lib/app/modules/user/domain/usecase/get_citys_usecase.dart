import 'package:eduqhub_test/app/modules/user/infra/city_repository_contract.dart';
import 'package:either_dart/either.dart';

abstract class GetCitysUsecaseContract {
  Future<Either<Error, List<String>>> call({required String uf});
}

class GetCitysUsecase implements GetCitysUsecaseContract {
  final CityRepositoryContract repository;
  GetCitysUsecase({
    required this.repository,
  });

  @override
  Future<Either<Error, List<String>>> call({required String uf}) async {
    try {
      final result = await repository.getCitys(state: uf);
      return Right(result);
    } on Error catch (e) {
      return Left(e);
    }
  }
}
