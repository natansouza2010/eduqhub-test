import 'package:dio/dio.dart';
import 'package:eduqhub_test/app/modules/user/external/datasource/city_remote_datasource_contract.dart';

class CityRemoteDatasourceImpl implements CityRemoteDatasourceContract {
  final dio = Dio();
  @override
  Future<List<dynamic>> getCity({required String state}) async {
    try {
      final response = await dio.get(
          'https://servicodados.ibge.gov.br/api/v1/localidades/estados/$state/municipios');
      final result = response.data as List;
      return result;
    } catch (error) {
      return [];
    }
  }
}
