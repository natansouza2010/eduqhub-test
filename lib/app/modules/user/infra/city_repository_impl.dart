import 'package:eduqhub_test/app/modules/user/external/datasource/city_remote_datasource_contract.dart';
import 'package:eduqhub_test/app/modules/user/infra/city_repository_contract.dart';

class CityRepositoryImpl implements CityRepositoryContract {
  final CityRemoteDatasourceContract datasource;

  CityRepositoryImpl(this.datasource);

  @override
  Future<List<String>> getCitys({required String state}) async {
    try {
      final response = await datasource.getCity(state: state);
      final citys = response.map((e) => e["nome"] as String).toList();
      return citys;
    } catch (error) {
      return [];
    }
  }
}
