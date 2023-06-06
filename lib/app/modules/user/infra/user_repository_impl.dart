import 'package:eduqhub_test/app/modules/user/domain/model/user.dart';
import 'package:eduqhub_test/app/modules/user/external/datasource/user_remote_datasource_contract.dart';
import 'package:eduqhub_test/app/modules/user/infra/user_repository_contract.dart';

class UserRepositoryImpl implements UserRepositoryContract {
  final UserRemoteDatasourceContract datasource;

  UserRepositoryImpl({required this.datasource});

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
  Future<List<User>> getUsers() async {
    try {
      final response = await datasource.getUsers();
      final users = response.map((e) => User.fromMap(e)).toList();
      return users;
    } catch (error) {
      return [];
    }
  }

  @override
  Future<String> saveUser({required User user}) async {
    try {
      final json = user.toMap();
      final send = await datasource.saveUser(userMap: json);
      return send;
    } catch (error) {
      return "";
    }
  }

  @override
  Future<bool> updateUser({required User user}) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
