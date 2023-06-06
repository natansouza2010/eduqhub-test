import 'package:dio/dio.dart';
import 'package:eduqhub_test/app/modules/user/external/datasource/user_remote_datasource_contract.dart';

class UserRemoteDatasourceImpl implements UserRemoteDatasourceContract {
  final dio = Dio();
  @override
  Future<bool> deleteUserById({required String id}) async {
    // TODO: implement deleteUserById
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getUserById({required String id}) {
    // TODO: implement getUserById
    throw UnimplementedError();
  }

  @override
  Future<List<dynamic>> getUsers() async {
    try {
      final response = await dio.get(
          'http://eduqhub-api-dev-lb-1386179597.us-east-2.elb.amazonaws.com/test-dev/users');
      final result = response.data as List;

      return result;
    } catch (error) {
      return [];
    }
  }

  @override
  Future<dynamic> saveUser({required Map<String, dynamic> userMap}) async {
    try {
      final response = await dio.post(
        'http://eduqhub-api-dev-lb-1386179597.us-east-2.elb.amazonaws.com/test-dev/users',
        data: userMap,
      );

      return response;
    } catch (error) {
      return [];
    }
  }

  @override
  Future<bool> updateUser({required Map<String, dynamic> userUpdateMap}) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
