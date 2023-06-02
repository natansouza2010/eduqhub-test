import 'package:eduqhub_test/app/modules/user/domain/model/user.dart';
import 'package:eduqhub_test/app/modules/user/infra/user_repository_contract.dart';

class UserRepositoryImpl implements UserRepositoryContract {
  @override
  Future<bool> deleteUserById({required String id}) {
    // TODO: implement deleteUserById
    throw UnimplementedError();
  }

  @override
  Future<User> getUserById({required String id}) {
    // TODO: implement getUserById
    throw UnimplementedError();
  }

  @override
  Future<List<User>> getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }

  @override
  Future<bool> saveUser({required User user}) {
    // TODO: implement saveUser
    throw UnimplementedError();
  }

  @override
  Future<bool> updateUser({required User user}) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
