import 'package:eduqhub_test/app/modules/user/external/datasource/user_remote_datasource_contract.dart';

class UserRemoteDatasourceImpl implements UserRemoteDatasourceContract {
  @override
  Future<bool> deleteUserById({required String id}) {
    // TODO: implement deleteUserById
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getUserById({required String id}) {
    // TODO: implement getUserById
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }

  @override
  Future<bool> saveUser({required Map<String, dynamic> userMap}) {
    // TODO: implement saveUser
    throw UnimplementedError();
  }

  @override
  Future<bool> updateUser({required Map<String, dynamic> userUpdateMap}) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
